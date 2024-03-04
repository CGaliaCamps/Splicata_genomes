#!/bin/bash

PATH=/piec2/cgalia/GenomaSplicata/functional_annot/inv_enrichment/

#general
#python fatigo.py noInv_geneid.txt allInv_geneid.txt geneid2goterm.txt > noInv_allInv.txt

#no inv vs chromosomes
#python fatigo.py noInv_geneid.txt chr2_geneid.txt geneid2goterm.txt > noInv_chr2.txt
#python fatigo.py noInv_geneid.txt chr4_geneid.txt geneid2goterm.txt > noInv_chr4.txt
#python fatigo.py noInv_geneid.txt chr11_geneid.txt geneid2goterm.txt > noInv_chr11.txt
#python fatigo.py noInv_geneid.txt chr16_geneid.txt geneid2goterm.txt > noInv_chr16.txt

#inverted
#python fatigo.py chr2_geneid.txt chr4_geneid.txt geneid2goterm.txt > chr2_chr4.txt
#python fatigo.py chr2_geneid.txt chr11_geneid.txt geneid2goterm.txt > chr2_chr11.txt
#python fatigo.py chr2_geneid.txt chr16_geneid.txt geneid2goterm.txt > chr2_chr16.txt
#python fatigo.py chr4_geneid.txt chr11_geneid.txt geneid2goterm.txt > chr4_chr11.txt
#python fatigo.py chr4_geneid.txt chr16_geneid.txt geneid2goterm.txt > chr4_chr16.txt
#python fatigo.py chr11_geneid.txt chr16_geneid.txt geneid2goterm.txt > chr11_chr16.txt

#crhomosome_vs_rest

#python fatigo.py nochr2_geneid.txt chr2_geneid.txt geneid2goterm.txt > nochr2_chr2.txt
#python fatigo.py nochr4_geneid.txt chr4_geneid.txt geneid2goterm.txt > nochr4_chr4.txt
#python fatigo.py nochr11_geneid.txt chr11_geneid.txt geneid2goterm.txt > nochr11_chr11.txt
#python fatigo.py nochr16_geneid.txt chr16_geneid.txt geneid2goterm.txt > nochr16_chr16.txt

#python /piec1/software/fatigo/fatigo.py tots_geneid.txt chr16_geneid.txt geneid2goterm.txt > tots_chr16.txt


#inversions vs la resta ### VELLLLL

#python /piec1/software/fatigo/fatigo.py $PATH/tot_menys_inversio_chr_2_geneid.txt $PATH/inv_chr2_splicata_round3_lnc_sno_trna_notracks_geneid.txt $PATH/geneid2goterm.txt > $PATH/nochr2_invchr2.txt
#python /piec1/software/fatigo/fatigo.py $PATH/tot_menys_inversio_chr_4_geneid.txt $PATH/inv_chr4_splicata_round3_lnc_sno_trna_notracks_geneid.txt $PATH/geneid2goterm.txt > $PATH/nochr4_invchr4.txt
#python /piec1/software/fatigo/fatigo.py $PATH/tot_menys_inversio_chr_11_geneid.txt $PATH/inv_chr11_splicata_round3_lnc_sno_trna_notracks_geneid.txt $PATH/geneid2goterm.txt > $PATH/nochr11_invchr11.txt
#python /piec1/software/fatigo/fatigo.py $PATH/tot_menys_inversio_chr_16_geneid.txt $PATH/inv_chr16_splicata_round3_lnc_sno_trna_notracks_geneid.txt $PATH/geneid2goterm.txt > $PATH/nochr16_invchr16.txt


#inversions vs la resta

python /piec1/software/fatigo/fatigo.py $PATH/geneID_mRNA_noinv_chr2_splicata.txt $PATH/geneID_mRNA_inv_chr2_splicata.txt $PATH/geneid2goterm.txt > $PATH/enrich_invchr2.txt
python /piec1/software/fatigo/fatigo.py $PATH/geneID_mRNA_noinv_chr4_splicata.txt $PATH/geneID_mRNA_inv_chr4_splicata.txt $PATH/geneid2goterm.txt > $PATH/enrich_invchr4.txt
python /piec1/software/fatigo/fatigo.py $PATH/geneID_mRNA_noinv_chr11_splicata.txt $PATH/geneID_mRNA_inv_chr11_splicata.txt $PATH/geneid2goterm.txt > $PATH/enrich_invchr11.txt
python /piec1/software/fatigo/fatigo.py $PATH/geneID_mRNA_noinv_chr16_splicata.txt $PATH/geneID_mRNA_inv_chr16_splicata.txt $PATH/geneid2goterm.txt > $PATH/enrich_invchr16.txt



