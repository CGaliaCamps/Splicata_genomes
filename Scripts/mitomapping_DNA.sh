#!/bin/bash


###set your paths###
GENOME_PATH="/piec2/cgalia/Styela_mundial/WGS_world/3mitogenome/mitogenomes/"
READS="/piec2/cgalia/Styela_mundial/WGS_world/2filtdata/trimmed_paired/"
OUTPUT="/piec2/cgalia/Styela_mundial/WGS_world/3mitogenome/"

#mkdir ${OUTPUT%/*}
#mkdir $OUTPUT

###index your genome###
#bwa index ${GENOME}

#cd $READS

#for file in *_f.fq;

#	do
#		name=${file%%_*}

		###map, sort and save as bam your alignment###

		bwa mem $GENOME_PATH/Circularized_assembly_1_NC18_15750-1650_k33.fasta ${READS}/NC18_f.fq ${READS}/NC18_r.fq -t 18 -M  > ${OUTPUT}/NC18_2_NC18_map.sam
		/home/soft/samtools-1.3.1/samtools view -S -b ${OUTPUT}/NC18_2_NC18_map.sam > ${OUTPUT}/NC18_2_NC18_map.bam
		rm ${OUTPUT}/NC18_2_NC18_map.sam
		/home/soft/samtools-1.3.1/samtools sort ${OUTPUT}/NC18_2_NC18_map.bam > ${OUTPUT}/NC18_2_NC18_map_sort.bam
		rm ${OUTPUT}/NC18_2_NC18_map.bam
		/home/soft/samtools-1.3.1/samtools index ${OUTPUT}/NC18_2_NC18_map_sort.bam

#	done


