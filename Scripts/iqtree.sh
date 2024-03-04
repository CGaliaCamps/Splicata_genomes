#!/bin/bash

cd /piec2/cgalia/Styela_mundial/WGS_world/5phylogenies/mitogenomes/coses_noves_paper_final
for part in *.nex;
	do
		prebase=${part%%.nex}
		base=${prebase##*_}
		/home/soft/iqtree-2.2.0-Linux/bin/iqtree2 -p $part -m GTR+I+G -nt AUTO -B 50000 -pre $base
	done



##proteins

#cd /piec2/cgalia/Styela_mundial/WGS_world/5phylogenies/mitogenomes/aminoacid/


#for alig in *.fasta;
#	do
#		base=${alig%%_mafft*}
#		/home/soft/iqtree-2.2.0-Linux/bin/iqtree2 -s $alig -m mtZOA+FO -B 50000 -nt AUTO -redo -pre $base
#	done

#/home/soft/iqtree-2.2.0-Linux/bin/iqtree2 -p partition_file_aa.nex -m mtZOA+FO -B 50000 -nt AUTO -redo -pre all_genes









#/home/soft/iqtree-2.2.0-Linux/bin/iqtree2 -p partition_file_cox3.nex -m GTR+I+G -nt AUTO -B 50000 -redo -pre cox3







#nucleotides
#/home/soft/iqtree-2.2.0-Linux/bin/iqtree2 -p /piec2/cgalia/Dendrodoris/Genomics/6Phylogenies/mitochondrial/partition_file_nt_pos1.nex -m GTR+I+G -nt AUTO -B 1000 -redo
