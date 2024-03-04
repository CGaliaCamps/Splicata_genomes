#!/bin/bash

basepath=/piec2/cgalia/Styela_mundial/WGS_world/4genotyping/bwa/vcffiles/filtered

for num in {2,4,11,16};
	do
		cd $basepath/chr$num\_vcf/plink

		/piec1/software/plink-1.9/plink --noweb --file $num\_2allele_allchr_100_5-25DP_10maf_tots.plink --make-bed --out chr$num\_tots

		/piec1/software/plink-1.9/plink --noweb --bfile chr$num\_tots --cluster --mds-plot 50 --out MDS_chr$num\_tots

		cd $basepath
	done

