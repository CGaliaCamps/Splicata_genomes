#!/bin/bash

INPATH1=/piec2/cgalia/Styela_mundial/WGS_world/5phylogenies/mitogenomes/coses_noves_paper_final

cd $INPATH1


#the astral file input is just a concatenation of the single gene trees (the files with extension contree)
for file in *.astral
	do

		java -jar /home/soft/ASTRAL/astral.5.7.7.jar -i supertree.astral -o supertree.tree
	done


