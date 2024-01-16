#!/bin/bash


###set your paths###
GENOME="/piec1/cgalia/GenomaSplicata/Splicata_final_assembly.fasta"
READS="/piec1/cgalia/Styela_mundial/WGS_world/2filtdata/trimmed_paired/"
OUTPUT="/piec1/cgalia/Styela_mundial/WGS_world/4genotyping/bwaUnmasked"

#mkdir ${OUTPUT%/*}
mkdir $OUTPUT

###index your genome###
#bwa index ${GENOME}

cd $READS

for file in *_f.fq;

	do
		name=${file%%_*}

		###map, sort and save as bam your alignment###

		bwa mem ${GENOME} ${READS}/$name\_f.fq ${READS}/$name\_r.fq -t 18 -M  > ${OUTPUT}/$name\_map.sam
		/home/soft/samtools-1.3.1/samtools addreplacerg ${OUTPUT}/$name\_map.sam -r ID:$name -r SM:$name > ${OUTPUT}/$name\_rg.sam
		rm ${OUTPUT}/$name\_map.sam
		/home/soft/samtools-1.3.1/samtools view -S -b ${OUTPUT}/$name\_rg.sam > ${OUTPUT}/$name\_rg.bam
		rm ${OUTPUT}/$name\_rg.sam
		/home/soft/samtools-1.3.1/samtools sort ${OUTPUT}/$name\_rg.bam > ${OUTPUT}/$name\_sorted.bam
		rm ${OUTPUT}/$name\_rg.bam
		/home/soft/samtools-1.3.1/samtools index ${OUTPUT}/$name\_sorted.bam

	done


