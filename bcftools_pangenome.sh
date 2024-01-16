#!/bin/bash


INPATH="/piec1/cgalia/Styela_mundial/WGS_world/4genotyping/bwaUnmasked"
OUTPATH="/piec1/cgalia/Styela_mundial/WGS_world/4genotyping/bwaUnmasked/bcftools"
GENOME="/piec1/cgalia/GenomaSplicata/Splicata_final_assembly.fasta"

mkdir $OUTPATH
cd $INPATH

realpath *bam > pathfile.txt

for file in *.txt;
	do

	name=${file%_*}

		/home/soft/samtools-20211022/bcftools/bcftools mpileup --threads 6 -Ov --annotate FORMAT/AD,FORMAT/ADF,FORMAT/ADR,FORMAT/DP,FORMAT/SP,INFO/AD,INFO/ADF,INFO/ADR -f $GENOME -b ${INPATH}/$file | /home/soft/samtools-20211022/bcftools/bcftools call --threads 6 -mv | /home/soft/samtools-20211022/bcftools/bcftools annotate --set-id +'%CHROM\_%POS' > ${OUTPATH}/$name.vcf
	done
