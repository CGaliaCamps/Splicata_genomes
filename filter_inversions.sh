#!/bin/bash

awk '$4>2117501' chr2_splicata_round3_lnc_sno_trna_notracks.gff | awk '$5<16215000' > inv_chr2_splicata.gff
awk '$4<2117501' chr2_splicata_round3_lnc_sno_trna_notracks.gff > pre_inv_chr2_splicata.gff
awk '$5>16215000' chr2_splicata_round3_lnc_sno_trna_notracks.gff > post_inv_chr2_splicata.gff
cat pre_inv_chr2_splicata.gff post_inv_chr2_splicata.gff > noinv_chr2_splicata.gff
