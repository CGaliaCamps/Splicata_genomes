#!/bin/bash
cd /piec2/cgalia/Styela_mundial/WGS_world/4genotyping/bwa/vcffiles/filtered

base=chrPGA_chromosome_

mkdir all_Chr_No_inv

#/home/soft/vcftools/bin/vcftools --vcf 100_5-25DP_10maf_tots.vcf.recode.vcf --chr $base\1 --chr $base\2 --chr $base\3 --chr $base\4 --chr $base\5 --chr $base\6 --chr $base\7 --chr $base\8 --chr $base\9 --chr $base\10 --chr $base\11 --chr $base\12 --chr $base\13 --chr $base\14 --chr $base\15 --chr $base\16 --recode --out ./all_Chr_No_Unplaced/allchr_100_5-25DP_10maf_tots.vcf.recode.vcf

#/home/soft/vcftools/bin/vcftools --vcf 100_5-25DP_10maf_NC.vcf.recode.vcf --chr $base\1 --chr $base\2 --chr $base\3 --chr $base\4 --chr $base\5 --chr $base\6 --chr $base\7 --chr $base\8 --chr $base\9 --chr $base\10 --chr $base\11 --chr $base\12 --chr $base\13 --chr $base\14 --chr $base\15 --chr $base\16 --recode --out ./all_Chr_No_Unplaced/allchr_100_5-25DP_10maf_NC.vcf.recode.vcf





#for file in *recode.vcf;
#	do
#		for n in {1..16};
#			do
#				#mkdir chr$n\_vcf
#				/home/soft/vcftools/bin/vcftools --vcf $file --chr chrPGA_chromosome_$n --recode --out ../chr$n\_vcf/2allele_$n\_$file
#			done
#	done





/home/soft/vcftools/bin/vcftools --vcf 100_5-25DP_10maf_tots.vcf.recode.vcf --chr $base\1 --chr $base\3 --chr $base\5 --chr $base\6 --chr $base\7 --chr $base\8 --chr $base\9 --chr $base\10 --chr $base\12 --chr $base\13 --chr $base\14 --chr $base\15 --recode --out ./all_Chr_No_inv/noInv_100_5-25DP_10maf_tots
/home/soft/vcftools/bin/vcftools --vcf 100_5-25DP_10maf_NC.vcf.recode.vcf --chr $base\1 --chr $base\3 --chr $base\5 --chr $base\6 --chr $base\7 --chr $base\8 --chr $base\9 --chr $base\10 --chr $base\12 --chr $base\13 --chr $base\14 --chr $base\15 --recode --out ./all_Chr_No_inv/noInv_100_5-25DP_10maf_NC



#/piec1/software/plink-1.9/plink --noweb --file 100_10maf_tots_bo.plink --chr 13 --make-bed --out chr13_tots
#/piec1/software/plink-1.9/plink --noweb --file 100_10maf_NC_bo.plink --chr 13 --make-bed --out chr13_NC






