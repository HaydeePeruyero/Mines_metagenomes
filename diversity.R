library("phyloseq")
library("ggplot2")
library("RColorBrewer")
library("patchwork")

setwd("~/metagenomes/results/TAXONOMY_READS")


raw_metagenomes <- import_biom("metagenomes.biom")
class(raw_metagenomes)
View(raw_metagenomes@tax_table@.Data)

raw_metagenomes@tax_table@.Data <- substring(raw_metagenomes@tax_table@.Data, 4)
View(raw_metagenomes@tax_table@.Data)

colnames(raw_metagenomes@tax_table@.Data)<- c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species")
View(raw_metagenomes@tax_table@.Data)

unique(raw_metagenomes@tax_table@.Data[,"Kingdom"])

sum(raw_metagenomes@tax_table@.Data[,"Phylum"] == "Pisuviricota")

View(raw_metagenomes@otu_table@.Data)

raw_metagenomes <- subset_taxa(raw_metagenomes, Kingdom == "Bacteria")

raw_metagenomes
sample_sums(raw_metagenomes)
summary(raw_metagenomes@otu_table@.Data)

alpha_div_plot <- plot_richness(physeq = raw_metagenomes, 
                                title = "Alpha diversity indexes for three samples",
                                measures = c("Observed","Chao1","Shannon")) 
ggsave(filename = "~/metagenomes/results/diversity/alpha_diversity_raw.png", plot = alpha_div_plot, width = 20, height = 10, dpi = 300, units = "cm")

summary(raw_metagenomes@tax_table@.Data== "")
raw_metagenomes <- subset_taxa(raw_metagenomes, Genus != "")
summary(raw_metagenomes@tax_table@.Data== "")
head(raw_metagenomes@otu_table@.Data)

#relative abundances

relative_metagenomes <- transform_sample_counts(raw_metagenomes, function(x) x*100 / sum(x) )
head(relative_metagenomes@otu_table@.Data)

meta_ord <- ordinate(physeq = relative_metagenomes, method = "NMDS", 
                     distance = "bray")

beta_div_plot <- plot_ordination(physeq = relative_metagenomes, ordination = meta_ord)

ggsave(filename = "~/metagenomes/results/diversity/beta_diversity.png", plot = beta_div_plot, width = 20, height = 10, dpi = 300, units = "cm")


rel_phylum_global <- tax_glom(relative_metagenomes, taxrank = 'Phylum')
View(rel_phylum_global@tax_table@.Data)

rel_phyl_global_df<-psmelt(rel_phylum_global) # convert to data frame
str(rel_phyl_global_df)
rel_phyl_global_df$Phylum<- as.character(rel_phyl_global_df$Phylum) # convert to character type


absolute_phylum_global <- tax_glom(physeq = raw_metagenomes, taxrank = "Phylum")
absolute_phyl_global_df <- psmelt(absolute_phylum_global)
str(absolute_phyl_global_df)

absolute_phyl_global_df$Phylum <- as.factor(absolute_phyl_global_df$Phylum)
phylum_colors_abs<- colorRampPalette(brewer.pal(8,"Dark2")) (length(levels(absolute_phyl_global_df$Phylum)))

absolute_plot <- ggplot(data= absolute_phyl_global_df, aes(x=Sample, y=Abundance, fill=Phylum))+ 
  geom_bar(aes(), stat="identity", position="stack")+
  scale_fill_manual(values = phylum_colors_abs)+
  labs(x= "Samples", y = "Absolute abundance") +
  ggtitle("Absolute abundance")+
  theme(legend.text = element_text(size = 6), legend.key.size = unit(0.3, 'cm'), axis.title = element_text(size = 8), axis.text.x = element_text(size = 4), plot.title = element_text(size = 10))

ggsave("~/metagenomes/results/diversity/abs_abundance_plot.png", plot = absolute_plot, width = 6.5, height = 3.65, units = "in", dpi = 400)


rel_phyl_global_df$Phylum <- as.factor(rel_phyl_global_df$Phylum)
phylum_colors_rel<- colorRampPalette(brewer.pal(8,"Dark2")) (length(levels(rel_phyl_global_df$Phylum)))

relative_plot <- ggplot(data=rel_phyl_global_df, aes(x=Sample, y=Abundance, fill=Phylum))+ 
  geom_bar(aes(), stat="identity", position="stack")+
  scale_fill_manual(values = phylum_colors_rel)+
  labs(x= "Samples", y = "Relative abundance") +
  ggtitle("Relative abundance")+
  theme(legend.text = element_text(size = 6), legend.key.size = unit(0.3, 'cm'), axis.title = element_text(size = 8), axis.text.x = element_text(size = 4), plot.title = element_text(size = 10))

ggsave("~/metagenomes/results/diversity/rel_abundance_plot.png", plot = relative_plot, width = 6.5, height = 3.65, units = "in", dpi = 400)


rel_phyl_global_df$Phylum <- as.character(rel_phyl_global_df$Phylum) # Return the Phylum column to be of type character
rel_phyl_global_df$Phylum[rel_phyl_global_df$Abundance < 0.5] <- "Phyla < 0.5% abund."
unique(rel_phyl_global_df$Phylum)

rel_phyl_global_df$Phylum <- as.factor(rel_phyl_global_df$Phylum)
phylum_colors_rel<- colorRampPalette(brewer.pal(8,"Dark2")) (length(levels(rel_phyl_global_df$Phylum)))

relative_plot_f <- ggplot(data=rel_phyl_global_df, aes(x=Sample, y=Abundance, fill=Phylum))+ 
  geom_bar(aes(), stat="identity", position="stack")+
  scale_fill_manual(values = phylum_colors_rel)+
  labs(x= "Samples", y = "Relative abundance") +
  ggtitle("Relative abundance")+
  theme(legend.text = element_text(size = 6), legend.key.size = unit(0.3, 'cm'), axis.title = element_text(size = 8), axis.text.x = element_text(size = 4), plot.title = element_text(size = 10))

ggsave("~/metagenomes/results/diversity/rel_abundance_plot_f.png", plot = relative_plot_f, width = 6.5, height = 3.65, units = "in", dpi = 400)




# Filtrado

raw_biom <- import_biom("~/metagenomes/results/TAXONOMY_READS/metagenomes.biom")

#Give name to taxonomic categories
raw_biom@tax_table@.Data<-substring(raw_biom@tax_table@.Data,4)
colnames(raw_biom@tax_table@.Data)<- c("Kingdom","Phylum", "Class", "Order","Family", "Genus", "Species")

# Generate otu_table
otu<-otu_table(raw_biom@otu_table@.Data, taxa_are_rows = TRUE) 

# Generate taxonomy table
tax<-tax_table(raw_biom@tax_table@.Data)

# It is the complete phyloseq object with the 3 previous tables
global<-phyloseq(otu, tax)

# Put the complete species names in the column for Species (instead of the epithet only)
global@tax_table@.Data[,7]<-paste(global@tax_table@.Data[,6], global@tax_table@.Data[,7], sep= "_")

# Agglomerate at Phylum level
phylum_global<- tax_glom(global, "Phylum")

#Relative abundance
relative_phylum_global<- transform_sample_counts(phylum_global, function(x) x / sum(x) ) 
rel_phyl_global_df<-psmelt(relative_phylum_global) # convert to data frame
rel_phyl_global_df$Phylum<- as.character(rel_phyl_global_df$Phylum) # convert to character type

# Agglomerate phylum with less than 0.01 abundance
rel_phyl_global_df$Phylum[rel_phyl_global_df$Abundance < 0.01] <- "Fila < 1% de abundancia" 

rel_phyl_global_df$Phylum<- as.factor(rel_phyl_global_df$Phylum) # convert to factor type
rel_phyl_global_df$Sample<- factor(rel_phyl_global_df$Sample, levels = c("GR_S381", "Pmt2_S287", "S1_S286"))


phylum_colors<- brewer.pal(length(levels(rel_phyl_global_df$Phylum)),"Dark2") 
global_rel_phyl_plot<-ggplot(rel_phyl_global_df, aes(x=Sample, y=Abundance, fill=Phylum)) +
  geom_bar(aes(), stat="identity", position="stack") +
  scale_fill_manual(values=phylum_colors) + 
  labs(x= "Samples", y = "Relative abundance") +
  ggtitle("Relative abundance")+
  theme(axis.title = element_text(size = 14), axis.text.x = element_text(size = 8), plot.title = element_text(size = 20))

ggsave("~/metagenomes/results/diversity/abund_rel_phyl_global.png", plot = global_rel_phyl_plot, width = 6.5, height = 3.65, units = "in", dpi = 400)


rich <- estimate_richness(raw_metagenomes)
rich



# Con el libro de R

library(vegan)

raw_biom <- import_biom("~/metagenomes/results/TAXONOMY_READS/metagenomes.biom")
