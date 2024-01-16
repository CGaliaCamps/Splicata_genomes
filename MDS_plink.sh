#!/bin/bash

cd /piec2/cgalia/Styela_mundial/WGS_world/4genotyping/bwa/vcffiles/filtered/all_Chr_No_inv/plink

#mkdir MDS

/piec1/software/plink-1.9/plink --noweb --file noInv_100_5-25DP_10maf_tots.plink --make-bed --out noInv_tots
/piec1/software/plink-1.9/plink --noweb --file noInv_100_5-25DP_10maf_NC.plink --make-bed --out noInv_NC


/piec1/software/plink-1.9/plink --noweb --bfile noInv_tots --cluster --mds-plot 50 --out ./MDS/noInv_tots
/piec1/software/plink-1.9/plink --noweb --bfile noInv_NC --cluster --mds-plot 50 --out ./MDS/noInv_NC

