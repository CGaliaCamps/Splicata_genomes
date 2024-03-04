#!/bin/bash

PATH=/piec2/cgalia/Styela_mundial/WGS_world/4genotyping/bwa/vcffiles/filtered/all_Chr_No_inv

cd $PATH

#for num in {1..16};
#	do
#		PLINK=$PATH/chr$num\_vcf/plink

#		cd $PATH/chr$num\_vcf

#		for file in *tots.recode.vcf.recode.vcf

#			do
#				base=${file%%.recode*}

#				/home/soft/vcftools/bin/vcftools --vcf $file --plink --out $PLINK/$base.plink
#			done

#		cd $PLINK

#		for file in *.ped;

#			do
#				base=${file%.ped}
 #               		nom=${file%.recode.plink}

#				/piec1/software/plink-1.9/plink --noweb --file $base --recodeA --out $nom
#			done
#	done



mkdir plink

for file in *.vcf;
		 	do
                                base=${file%%.recode*}

                                /home/soft/vcftools/bin/vcftools --vcf $file --plink --out ./plink/$base.plink
                        done

                cd plink

                for file in *.ped;

                        do
                                base=${file%.ped}
                                nom=${file%.recode.plink}

                                /piec1/software/plink-1.9/plink --noweb --file $base --recodeA --out $nom
                        done
        done

