# metagenomes_

Subir los genomas a la carpeta data y descomprimirlos

`mkdir -p metagenomes/data
unzip archivos`

Crear directorio

`mkdir untrimmed_fastq`

Correr fastq en todos los archivos

`fastqc *.fastq* `

Mover los archivos .zip y .html creados a la carpeta resultados.

`mkdir -p ~/metagenomes/results/fastqc_untrimmed_reads 
 mv *.zip ~/metagenomes/results/fastqc_untrimmed_reads/ 
 mv *.html ~/metagenomes/results/fastqc_untrimmed_reads/`
 
Descargarlos o verlos en el navegador para erificar calidad.
 
Descomprimir el archivo .zip para revisar el summary y concatenar todos los summary.
 
`for filename in *.zip; do unzip $filename ; done`
 
`cd metagenomes/results/fastqc_untrimmed_reads
 mkdir -p ~/metagenomes/docs
 cat */summary.txt > ~/metagenomes/docs/fastqc_summaries.txt`
  
Comprimir los archivos en formtato gz
  
`cd metagenomes/data/untrimmed_fastq
 gunzip archivos`
  
Trimming: al revisar la calidad se llegó a la conclusión de que se necesitaba realizar el cortado con los siguientes parámetros para cada uno de los pares de metagenomas:
  
`trimmomatic PE S1_S286_R1.fastq.gz S1_S286_R2.fastq.gz S1_S286_R1.trim.fastq.gz S1_S286_R1un.trim.fastq.gz S1_S286_R2.trim.fastq.gz S1_S286_R2un.trim.fastq.gz SLIDINGWINDOW:4:20 MINLEN:35 LEADING:20 TRAILING:20 ILLUMINACLIP:TruSeq3-PE.fa:2:40:15`
  
Mover los archivos .trim a la carpeta trimmed_fastq
  
`cd ~/metagenomes/data/untrimmed_fastq
 mkdir ../trimmed_fastq
 mv *.trim* ../trimmed_fastq
 cd ../trimmed_fastq
 ls`
 
 Verificar calidad de nuevo
 
 `fastqc *.fastq* `
  
 Ensamblado
 
 `metaspades.py -1 GR_S381_R1.trim.fastq.gz -2 GR_S381_R2.trim.fastq.gz -o ../../results/assembly_GR_S381`
 
 Da el siguiente error:
 
 `<jemalloc>: Error in malloc(): out of memory
 Requested: 32575720008
== Error ==  system call for: "['/opt/anaconda3/envs/metagenomics/bin/spades-hammer', '/home/haydee/metagomes/results/assembly_GR_S381/corrected/configs/config.info']" finished abnormally, OS return value: -6
In case you have troubles running SPAdes, you can write to spades.support@cab.spbu.ru
or report an issue on our GitHub repository github.com/ablab/spades
Please provide us with params.txt and spades.log files from the output directory.
SPAdes log can be found here: /home/haydee/metagomes/results/assembly_GR_S381/spades.log
Thank you for using SPAdes!
`

Kraken2

`for infile in *_R1.trim.fastq.gz
do
base=$(basename ${infile} _R1.trim.fastq.gz)
kraken2 --db /home/betterlab/kraken2/database/db_kraken2 --threads 20 --paired ${infile} ${base}_R2.trim.fastq.gz --output /home/haydee/metagenomes/results/TAXONOMY_READS/${base}.kraken --report /home/haydee/metagenomes/results/TAXONOMY_READS/${base}.report
done
` 
Corrieron manualmente

`kraken2 --db /home/betterlab/kraken2/database/db_kraken2 --threads 20 --paired GR_S381_R1.trim.fastq.gz GR_S381_R2.trim.fastq.gz --output ../../results/TAXONOMY_READS/GR_S381.kraken --report ../../results/TAXONOMY_READS/GR_S381.report`

Crear kraken-biom
`cd metagenomes/results/TAXONOMY_READS
 kraken-biom GR_S381.report Pmt2_S287.report S1_S286.report --fmt json -o metagenomes.biom
`


Metaspades no corrió con ningún par de metagenomas usando -t 32 y -m 100

Para ensamblar se usó megahit

`
megahit -1 GR_S381_R1.trim.fastq.gz -2 GR_S381_R2.trim.fastq.gz -t 30 -m 100 -o ../../results/megahit_GR \
megahit -1 Pmt2_S287_R1.trim.fastq.gz -2 Pmt2_S287_R2.trim.fastq.gz -t 30 -m 100 -o ../../results/megahit_Pmt2_S287 \
megahit -1 S1_S286_R1.trim.fastq.gz -2 S1_S286_R2.trim.fastq.gz -t 30 -m 120 -o ../../results/megahit_S1
`

Binning

`cd ~/metagenomes/results/megahit_GR
mkdir MAXBIN
run_MaxBin.pl -thread 30 -contig final.contigs.fa -reads ../../data/trimmed_fastq/GR_S381_R1.trim.fastq.gz -reads2 ../../data/trimmed_fastq/GR_S381_R2.trim.fastq.gz -out MAXBIN/GR
`

Ver summary

`cat MAXBIN/GR.summary`

Output: tienen mala calidad

``Bin name        Completeness    Genome size     GC content
GR.001.fasta    33.6%   1907219 69.8
GR.002.fasta    56.1%   1389784 65.2
GR.003.fasta    64.5%   2449643 56.6
GR.004.fasta    43.9%   1264274 70.2
GR.005.fasta    10.3%   681660  66.1
``

``Bin name        Completeness    Genome size     GC content
Pmt2.001.fasta  91.6%   5609871 56.1
Pmt2.002.fasta  66.4%   7280137 65.7
``

``Bin name        Completeness    Genome size     GC content
S1.001.fasta    28.0%   493561  39.4
S1.002.fasta    45.8%   1556169 38.7
S1.003.fasta    41.1%   3471537 38.5
S1.004.fasta    43.9%   2037848 67.5
S1.005.fasta    25.2%   593122  55.7
S1.006.fasta    52.3%   3433891 72.4
S1.007.fasta    25.2%   1694013 39.2
S1.008.fasta    57.9%   3358390 36.6
S1.009.fasta    29.0%   2525083 37.1
S1.010.fasta    80.4%   7837257 46.4
S1.011.fasta    47.7%   2723913 39.3
S1.012.fasta    19.6%   2000049 40.2
S1.013.fasta    78.5%   4300101 70.3
S1.014.fasta    21.5%   2764137 35.0
S1.015.fasta    41.1%   7374183 42.9
S1.016.fasta    62.6%   5143684 70.8
S1.017.fasta    45.8%   5805392 44.7
S1.018.fasta    37.4%   1060318 62.3
S1.019.fasta    49.5%   5566383 55.1
S1.020.fasta    22.4%   1209154 62.4
S1.021.fasta    33.6%   1257504 53.6
S1.022.fasta    53.3%   2663212 65.5
S1.023.fasta    15.0%   3131398 61.5
S1.024.fasta    39.3%   2798730 48.4
S1.025.fasta    41.1%   3726885 58.0
S1.026.fasta    64.5%   2452151 70.1
S1.027.fasta    43.9%   1193028 53.9
S1.028.fasta    58.9%   3140736 66.5
S1.029.fasta    15.9%   2059112 61.3

``

Quality CHECK

`mkdir CHECKM
checkm taxonomy_wf domain Bacteria -x fasta MAXBIN/ CHECKM/
checkm qa CHECKM/Bacteria.ms CHECKM/ --file CHECKM//quality_GR.tsv --tab_table -o 2
`


--

# Análisis en R

