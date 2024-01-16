#!/bin/bash
#
# Usage:
#   genotype_calling.sh <ref.fa> <indir_bams> <site_depth.stats> <outdir> <ncores> <njobs>
#
# Description:
#   Call genotypes with bcftools.
#
# Requirements:
#   bcftools

# create a list of BAM files sorted by population
realpath $2/*sorted.bam >> $3/bamlist

# set minimum and maximum depth thresholds
#min_dp=$(grep -Po '\(MEDIAN \- 5 \* MAD\): \K\-*\d+' $3)
#max_dp=$(grep -Po '\(MEDIAN \+ 5 \* MAD\): \K\d+' $3)
# if minimum depth threshold is negative make it 1
#if [ ${min_dp} -lt 0 ]; then min_dp=1; fi

# parallel genotype calling and sort all variable sites per chromosome of clean BAM files
#parallel -j $5 --tmpdir ~/Scripts/ \
/home/soft/samtools-20211022/bcftools/bcftools mpileup --threads $4 -b $3/bamlist -C 50 -f $1 -q 30 -Q 30 --rf 2 --ff 4,256,512,1024 -Ou | /home/soft/samtools-20211022/bcftools/bcftools call --threads $4 -mv -f GQ,GP -Ou | /home/soft/samtools-20211022/bcftools/bcftools sort -Ob -o $3/snps.sorted.bcf

# All sites
#bcftools mpileup --threads $5 -b $4/bamlist -C 50 -f $1 -q 30 -Q 30 --rf 2 --ff 4,256,512,1024 -Ou | bcftools call --threads $5 -mv -a GQ,GP | bcftools sort -Ob -o $4/snps.sorted.bcf -
# ANGSD sites
#bcftools mpileup --threads $5 -b $4/bamlist -C 50 -f $1 -T sites.txt -q 30 -Q 30 --rf 2 --ff 4,256,512,1024 -Ou | bcftools call --threads $5 -mv -f GQ,GP -Ob -o $4/snps.sorted.bcf -

# index all sorted VCFs
#/home/soft/samtools-20211022/bcftools/bcftools index $3/{}

# Concatenate all sorted VCFs of all chromosomes:
#/home/soft/samtools-20211022/bcftools/bcftools concat --threads $4 $3/*.sorted.bcf -Ov -o $3/snps.sorted.bcf

# filter multisample BCF
/home/soft/samtools-20211022/bcftools/bcftools filter --threads $4 -e "DP<=5 || DP>=20 || MQ<=30 || QUAL<=30" -g 3 -s 'LowQual' -Ou $3/snps.sorted.bcf \
  | /home/soft/samtools-20211022/bcftools/bcftools view --threads $4 -m 2 -M 2 -v snps -c 1:minor -i 'FILTER="PASS"' -Ob -o $3/snps.filtered.sorted.bcf -

# filter multisample VCF by genotype quality of SNPs and include only biallelic SNPs ***MORE STRICT FILTERING***
#bcftools filter --threads $5 -e "DP<${min_dp} || DP>${max_dp} || GQ<20" -g 3 -s 'LowQual' -Ou $4/snps.sorted.bcf \
#  | bcftools view --threads $5 -m 2 -M 2 -v snps -c 1:minor -i 'FILTER="PASS"' -Ob -o $4/snps.filtered.sorted.bcf -

# index BCF
/home/soft/samtools-20211022/bcftools/bcftools index $3/snps.filtered.sorted.bcf

# extract all filtered SNPs per chromosome from the filtered multisample VCF
/home/soft/samtools-20211022/bcftools/bcftools convert --threads $4 $3/snps.filtered.sorted.bcf -Oz -o $3/snps.filtered.sorted.vcf.gz
# index all sorted VCFs
/home/soft/samtools-20211022/bcftools/bcftools index $3/snps.filtered.sorted.vcf.gz
