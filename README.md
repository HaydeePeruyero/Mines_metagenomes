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
 
 Da un error.
 
 
 
 
