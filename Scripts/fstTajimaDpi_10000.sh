#!/bin/bash

cd /piec2/cgalia/Styela_mundial/WGS_world/4genotyping/bwa/vcffiles/filtered/all_Chr_No_Unplaced/

#Calcula la pi al llarg dels cromosoma
vcftools --vcf 2allele_allchr_100_5-25DP_10maf_tots.vcf --window-pi 10000 --window-pi-step 2500 --out tot_pi_10000
vcftools --vcf 2allele_allchr_100_5-25DP_10maf_NC.vcf --window-pi 10000 --window-pi-step 2500 --out noNC_pi_10000

#Calcula tajima's D
vcftools --vcf 2allele_allchr_100_5-25DP_10maf_tots.vcf --TajimaD 10000 --out tot_D_10000
vcftools --vcf 2allele_allchr_100_5-25DP_10maf_NC.vcf --TajimaD 10000 --out noNC_D_10000

#Calcula la global fst entre els 3 mitogrups
#vcftools --vcf 2allele_allchr_100_5-25DP_10maf_tots.vcf --weir-fst-pop ../group_splits/mitoA.txt --weir-fst-pop ../group_splits/mitoB.txt --weir-fst-pop ../group_splits/mitoC.txt --fst-window-size 10000 --fst-window-step 2500 --out tot_SNP_mitoglobal_10000
#vcftools --vcf 2allele_allchr_100_5-25DP_10maf_NC.vcf --weir-fst-pop ../group_splits/mitoA.txt --weir-fst-pop ../group_splits/mitoC.txt --fst-window-size 10000 --fst-window-step 2500 --out NC_SNP_mitoglobal_10000

#Calcula la fst entre mitogrups
#vcftools --vcf 2allele_allchr_100_5-25DP_10maf_tots.vcf --weir-fst-pop ../group_splits/mitoA.txt --weir-fst-pop ../group_splits/mitoB.txt --fst-window-size 10000 --fst-window-step 2500 --out tot_SNP_fstAB_10000
vcftools --vcf 2allele_allchr_100_5-25DP_10maf_tots.vcf --weir-fst-pop ../group_splits/mitoA.txt --weir-fst-pop ../group_splits/mitoC.txt --fst-window-size 10000 --fst-window-step 2500 --out tot_AvsC_10000
#vcftools --vcf 2allele_allchr_100_5-25DP_10maf_tots.vcf --weir-fst-pop ../group_splits/mitoB.txt --weir-fst-pop ../group_splits/mitoC.txt --fst-window-size 10000 --fst-window-step 2500 --out tot_SNP_fstBC_10000


#Calcula la global fst entre poblacions

vcftools --vcf 2allele_allchr_100_5-25DP_10maf_tots.vcf --weir-fst-pop ../group_splits/CA.txt --weir-fst-pop ../group_splits/BRA.txt --weir-fst-pop ../group_splits/NC.txt --weir-fst-pop ../group_splits/FE.txt --weir-fst-pop ../group_splits/PE.txt --weir-fst-pop ../group_splits/MIS.txt --fst-window-size 10000 --fst-window-step 2500 --out tot_globalfst_10000


#calcula fst entre NC i others

vcftools --vcf 2allele_allchr_100_5-25DP_10maf_tots.vcf --weir-fst-pop ../group_splits/NC.txt --weir-fst-pop ../group_splits/others.txt --fst-window-size 10000 --fst-window-step 2500 --out tot_fst_NCvsOthers_10000

vcftools --vcf 2allele_allchr_100_5-25DP_10maf_tots.vcf --weir-fst-pop ../group_splits/NC.txt --weir-fst-pop ../group_splits/BRA.txt --fst-window-size 10000 --fst-window-step 2500 --out tot_fst_NCvsX_10000
vcftools --vcf 2allele_allchr_100_5-25DP_10maf_tots.vcf --weir-fst-pop ../group_splits/NC.txt --weir-fst-pop ../group_splits/Y.txt --fst-window-size 10000 --fst-window-step 2500 --out tot_fst_NCvsY_10000
vcftools --vcf 2allele_allchr_100_5-25DP_10maf_tots.vcf --weir-fst-pop ../group_splits/NC.txt --weir-fst-pop ../group_splits/Z.txt --fst-window-size 10000 --fst-window-step 2500 --out tot_fst_NCvsZ_10000


#calcula la fst entre grups inexplicables del MDS (inversions?)

vcftools --vcf 2allele_allchr_100_5-25DP_10maf_tots.vcf --weir-fst-pop ../group_splits/Y.txt --weir-fst-pop ../group_splits/Z.txt --fst-window-size 10000 --fst-window-step 2500 --out tot_fst_YvsZ_10000
vcftools --vcf 2allele_allchr_100_5-25DP_10maf_tots.vcf --weir-fst-pop ../group_splits/BRA.txt --weir-fst-pop ../group_splits/Z.txt --fst-window-size 10000 --fst-window-step 2500 --out tot_fst_BRAvsZ_10000
vcftools --vcf 2allele_allchr_100_5-25DP_10maf_tots.vcf --weir-fst-pop ../group_splits/Y.txt --weir-fst-pop ../group_splits/BRA.txt --fst-window-size 10000 --fst-window-step 2500 --out tot_fst_YvsBRA_10000

#calcula la fst entre med i atl sense

vcftools --vcf 2allele_allchr_100_5-25DP_10maf_tots.vcf --weir-fst-pop ../group_splits/ATL.txt --weir-fst-pop ../group_splits/PAC.txt --fst-window-size 10000 --fst-window-step 2500 --out tot_fst_PACvsATL_10000



