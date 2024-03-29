# Report 

## Quality control

We verify the quality at each base in all the reads for the 3 samples and we decide to remove the low quality sequences using Trimmomatic (version 0.38)  taking a slide window of size 4 that will remove bases with score below 20, also we remove 20 bases in leading and trailing (`SLIDINGWINDOW:4:20 MINLEN:35 LEADING:20 TRAILING:20`).  After this the samples perform better in the quality test.

### GR_S381

!["a) Quality of raw sample GR_S381_R1"](https://lh4.googleusercontent.com/uOR4-kwZXORj24k1kJFU-E7e_ZyhkXjWfgUNOCT1NPJuDrYvaQNImT-blhY7921NouvJe1Ol2msVOjTB44tQZDyl_5GwqW9H8nfIcmFYVM2Jb5_8tt8vxi8r58o1absx4jwC_w3qVXJ_PAcPY4i-CM0)
![b) Quality of trimmed sample GR_S381_R1](https://lh4.googleusercontent.com/V8eyRZUy6m4qsVij44dQ-SNJlN8OSuwvHFRha0MG1sRh9B04hBJnrVY2_IERvM5KoIqxmaOitIS09qZxGG52VGdaZfzKGxpEEukGQSX19n29WoXXX2O0_AE4e6oTqaVfEFVqXYWDZBnDm_WIjbWtV5w)
![c) Quality of raw sample GR_S381_R2](https://lh4.googleusercontent.com/T0kGpZ_YBZn8xBrqtPGOOU4j28tnRsfb4SrpRgOFkFP9z9mo0Y-naafF8Fp-O36_EdIdb2VOWtXF2N0cU1KMSwrhARc5cAJC439Wq8kx46oxt4kJfKbMXGmRtPQYsKpm6g9VJSLU_dqBSjUBGMqIJKs)
![d) Quality of trimmed sample GR_S381_R2](https://lh5.googleusercontent.com/KDl_4rPQYmemd07GBvy4y-CoCitKrcUDDGDAc5egO3hr7hgVoKmEzkAYXNeTNuqKiAYRdvCpVQwCr5-grebX7t_gL7TQlk1dzlPCfLXfICe0K3OcE6nzEYWyZGet3dochkfYWbNvgVGz-4lJxPogK1A)


### Pmt2_S87

![a) Quality of raw sample Pmt2_S287_R1](https://lh6.googleusercontent.com/p8N4lJNHEF90NjJKuq8iK9dzEtURTuoh8qh_6vQWemOxPm4qcK9Dc7ouqsXqk4lSETh09W5aWCtc4xWpFFQJb6qrmGW6d5g9FBaghAOL4LJyDQQjLXFgOf_0ZzWw-MD3RC0qv5E_19dfE6_2vnB0xMc)
![b) Quality of trimmed sample Pmt2_S287_R1](https://lh4.googleusercontent.com/S0MKbWVg3bHmgXYZcwxI3JC0AYvwiosEYhgYEQTGTe20o6Ti_LjztaqNss2p0_nq10z6KpCTxkT4UXqgurt5pejn0g0SC4afSiigX_JImYcPRcvYqXDR_GYgUjorU_pvEwXYycaQxuOSc7sgxkPb4Vc)
![c) Quality of raw sample Pmt2_S287_R2](https://lh5.googleusercontent.com/OSrhw4X9IuKpRPSVK9m5mIevPDyOLIRawurxw0dhmfTVlO-sgUQaE9PMaLfr4BGFhkMrM0c4chig68kd0q128N68RiCkIFKsYsmN2z3WHCgRIf_ghzgDwmujbM236tfjky9nyMccuPwvn5SlVFR1N9E)
![d) Quality of trimmed sample Pmt2_S287_R2](https://lh6.googleusercontent.com/gwMIYKCU5vu4hGO5A4Vg62O2q58F9R0xbCNlBJl-dH6JZUS_Vd8MT-KSPYX4Q8OYle3pYT1Zy9SlVu68tVh97bLiEOa7_z0m3Dd5DHmrvF0Q3wKqmSrzEitpJwGfpB0idGVlN3gmyVozyTSROLh08vY)

### S1_S286

![a) Quality of raw sample S1_S286_R1](https://lh5.googleusercontent.com/neiT_uL0upC_IWBdfJFFfUdxv5JORgmXLe-Qb5WUmWucuA614P2mS6ruCaWaw0U6nirPHH4P07WYQnlVzckPgd3sOY96vpUb5abnIDPKjlpzLkbKHeR0eZDI-cV1-aoA6mGh3R24AdzNlDEVttRVlLM)
![b) Quality of trimmed sample S1_S286_R1](https://lh4.googleusercontent.com/Wub0DJyw4nUjBSfHNa08BZVHR2s8SLUhlZsJQpx6Dr9lQ_rHwGEu9BEPUBlbe89MicoR55ChtUWYKEs4uBF9TBtxzbAMV_ZIr58xF4olySxF5ypgHtVa4lMjbksbUXAKk2Oj9XXJBVfRww_6v5kuZek)
![c) Quality of raw sample S1_S286_R2](https://lh4.googleusercontent.com/070vyoAV-MtdQ-VuFPyDp2t010cx_uTxvogVRQaQuFJOemdN1PRIgk10Ea2LLOz0og3YjTjub2YMjPyBcrXwrDFeJJciXy9qhXLMuuJBlFyllZY_QjYW-yZ3uYyL6CiRUAKm0y7VH6baTtcl9heEOgs)
![d) Quality of trimmed sample S1_S286_R2](https://lh4.googleusercontent.com/XK8HMkCrxfk3GrxKSbMjQtjMwJGUWg8ZI6mabqof_x4zSRK47QDHpX5ii7SLJDmV-NpaFBGVcb7y7-LPUxGMDEykEcF110tKtBR3cqUrnGeKOTOouiAuWhSH-paMuDxQBmQMsKr2xCNDLRHHnNt3z8Y)


After trimming we obtained the following paired reads.


|Sample   | Total  paired reads   | Unclassified  | Bacteria   |
|---|---|---|---|
| GR_S387 | 13,220,690 | 9,293,809 | 3863432 |
| Pmt2_S287 | 13,152,308 | 10,331,957 | 2772098 |
| S1_S286 | 10,962,875 | 7,812,630 | 3098270 |


## Assembly

With the trimmed metagenomes, we perform the assembly using megahit (version v1.2.9) with the parameters `-t 30 -m 100`.


## Binning

Using the assembled contigs of each sample we run MAXBIN to perform the binning algorithm. With this we recover the following MAGs.


|Sample   |Number of MAGs   |
|---|---|
| GR_S387 | 5 |
| Pmt2_S287 | 2 |
| S1_S286 | 29 |

Also we verify the quality of the MAGs. 

[Link of CHECKM reports](https://drive.google.com/drive/folders/1BzeBOEn8phlRGFbDNWF3-MVUvVnuA3bA?usp=sharing)

As we can see, we have only two MAGs that are acceptable, the others have a lot of contamination. The MAGs are S1.013 and S1.006.

| Name MAGs | Size | GC content | Completeness | Contamination | Genus |
|---|---|---|---|---|---|
| S1.013 | 4300101 | 70.3 | 79.07 | 0 | Alienimonas Californiensis (90.17) |
| S1.006 | 3433891 | 72.4 | 64.66 | 6.9 | Streptomyces | (17.56) |

## Taxonomy assignment
We use kraken to obtain the taxonomic classification. We run kraken in the trimmed genomes and in the MAGs that we previously obtained.

With the biom file. We explore the taxonomy using the library phyloseq in R. 

We explore the alpha and beta diversity for our samples. First we removed all non-bacterial organisms and computed the alpha diversity with the measures: Observed, Chao and Shannon. We note that the samples GR and S1 are more similar between each other with all the measures.

![Alpha diversity](https://lh6.googleusercontent.com/sxjq9zcW0Nqib0q7yE9k81Q5UUXSr4ASGpVdrwABE5GULrwtpp6eOlTQXaC31aTLKd8BgEQpVjaqMtRLgPIXbM7XaqQH-98FY-UV8xLmzaWDuj0il_RN_2JQ-_D_mGMREJajJRErl08g2qMZmtVv3iA)

Also, we compute the beta diversity, however as we have only 3 samples, the results are not representatives. 

![Beta diversity](https://lh4.googleusercontent.com/oze7yIwFV1DuvqAR-RACTl3FV2Q6ScfY0xJN0HaVONBvIg9WEaD5vo0VrBZqxJpcdpaAFLTGWrsfXu20ZVsblweAc-dRGAmcG2ph6GnAAa3Z5QQWk2IGwnbDywJsHUJlU_pETBrAr9ZZg88xGvaTHxU)

We explore the counts plotting the absolute and relative abundance.

![Absolute abundance](https://lh5.googleusercontent.com/hp_kL-89s9t-uEXy7G76CEIoegpPHl3feJTRsbclUVk-iQp--Z3EFe1kF0ozUQlH2q1Iec3MvUhGW-u-xYt-BSrTOkeL-q3LKcatvtUeChe3XhiQ5MJz24U53kxBrNq582tQ2DB5nlKmaSHjM64JoKo)

![Relative abundance](https://lh6.googleusercontent.com/T_pSPrisOc4veInr10mYs9CEWRxEacS6E7RPPSQdfALILBvvfrh_CnPegp3JEjplGcNSUug5XT82hq_6IOV8yhQ2Cb57i_vxkui1pQvbmuw8EU8eVf0sfOc9gSUEXaNskhHyYvTr2r_1AWYtT-7bnEc)

We group the phyla with a relative abundance less than 5. We observe that the samples GR and Pmt2 are similar. 

[Link to abundance tables filtered by phylum and actinobacteria](https://drive.google.com/drive/folders/1Hn7A2HD1fNai8MvJdH3v2sPQ-K427Fmx?usp=sharing)

![Filtered by actinobacteria](https://lh5.googleusercontent.com/kcHt8K1xQjHAqU4ZqEibSQLdGh_QNauGp8pfJmSyHLFYzw8mjrC6KIA3Z485RT7HiMMjLVyvha2BDYOYcDxKfRSI5B7bI1GGxsiqUTkdKWPHxYiDN6JoYDyTZTs0ps3gYfguYyLesqvJxpDyRcIVFMo)

We obtained a subset of only actinobacteria to have a better visualization of what genus are more presented in the samples.

![Relative abundance filtered by actinobacterias](https://lh6.googleusercontent.com/jqnXzOkfxIk_THMyx5Bcm94vm54JcV_s2v6_pEibt-Vy9Vb913tpJAcEtbeYJUzqIupTu34BJBpCP5FqJWaZYFF7BoAuwTcMSun8d1CTmJWim0c36Pjik2IWOViIw6V9NiBwG8FXxBmB51qWOxge4vs)

![Filtered with genus < 10 ](https://lh3.googleusercontent.com/qy_KW3_KKnl7jMK9_O90FcpwdAggJ99AcL8gLYhiXL05_r9pIlqa1GjcxcmdF3UArUaU20KMEPlcVop7GN-Wrl6DG56wf-Ri_UVpiR0aOOEKzSNEMh_HS0YRmdjUUnI4Z80uRoFiOlMNomu1gvfpzCg)

![Filtered with genus < 5](https://lh3.googleusercontent.com/w7N5PR7pzzbob9vSbAFp8BuNM0FWRdquFWjBNhYXV1oUbDYOrFTfDKhix4ySX6cBBzG7WCpgDp1fSyjMhJxFcUeQJ-6PQT96q4e6TbQjwM8Xqch-wnxV_5wqsDwXLPHHQ_IXotEeRTrSbXAkWVZcxzI)

[Link to the plots](https://drive.google.com/drive/folders/1T_EhF1arDOFlU1d6ViOR636ebka8eqc5?usp=share_link)

## Blastp

With the known sequences of fluorinase we align the sequences that we find with the seeds of fluorinase and we explore the trees to find similar sequences.
