
#!/bin/bash

cd /piec2/cgalia/Styela_mundial/WGS_world/4genotyping/bwa/vcffiles/filtered/


#calcula fst homozigots inversions

vcftools --vcf ./chr2_vcf/2allele_2_2allele_allchr_100_5-25DP_10maf_tots.vcf.recode.vcf.recode.vcf --weir-fst-pop ./group_splits/ref2.txt --weir-fst-pop ./group_splits/alt2.txt --fst-window-size 10000 --fst-window-step 2500 --out ./chr2_vcf/chr2_altvsref_10000
vcftools --vcf ./chr4_vcf/2allele_4_2allele_allchr_100_5-25DP_10maf_tots.vcf.recode.vcf.recode.vcf --weir-fst-pop ./group_splits/ref4.txt --weir-fst-pop ./group_splits/alt4.txt --fst-window-size 10000 --fst-window-step 2500 --out ./chr4_vcf/chr4_altvsref_10000
vcftools --vcf ./chr11_vcf/2allele_11_2allele_allchr_100_5-25DP_10maf_tots.vcf.recode.vcf.recode.vcf --weir-fst-pop ./group_splits/ref11.txt --weir-fst-pop ./group_splits/alt11.txt --fst-window-size 10000 --fst-window-step 2500 --out ./chr11_vcf/chr11_altvsref_10000
vcftools --vcf ./chr16_vcf/2allele_16_2allele_allchr_100_5-25DP_10maf_tots.vcf.recode.vcf.recode.vcf --weir-fst-pop ./group_splits/ref16.txt --weir-fst-pop ./group_splits/alt16.txt --fst-window-size 10000 --fst-window-step 2500 --out ./chr16_vcf/chr16_altvsref_10000



