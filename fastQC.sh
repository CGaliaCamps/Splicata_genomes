#!/bin/bash

#cd /piec1/cgalia/Styela_mundial/WGS_world/


#export PATH=/usr/lib/jvm/java-9-openjdk-amd64/bin/:$PATH
#export LD_LIBRARY_PATH=/usr/lib/jvm/java-9-openjdk-amd64/lib/:$LD_LIBRARY_PATH


/home/soft/FastQC/fastqc /piec2/cgalia/Styela_mundial/WGS_world/1rawdata/*fq -t 12 -o /piec2/cgalia/Styela_mundial/WGS_world/1rawdata/fastQC2/

#/home/soft/FastQC/fastqc /piec1/cgalia/Styela_mundial/WGS_world/2filtdata/trimmed_paired/_* -t 12 -o /piec1/cgalia/Styela_mundial/WGS_world/2filtdata/trimmed_paired/fastQC/
