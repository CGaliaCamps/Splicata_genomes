install.packages("CMplot")
library("CMplot")
source("https://raw.githubusercontent.com/YinLiLin/CMplot/master/R/CMplot.r")
library("dplyr")
library("scales")


setwd("E:/styela/Molecular/Genomica poblacions/DNA mundial/WGS_mundial/all_chr_pi_fst_TajimaD/fst/popglobal")
options(scipen=999)


#### manhhattan NC contra la resta ####
#### llegir dades ####

df1 <- read.table(file="tot_SNP_popglobal.windowed.weir.fst", 
                  sep = "\t", header=TRUE)

#### converteix cada dataset a un fitxer independent ####
df1bo <- df1[,c(1,2,5)]
df1bo <- cbind(df1bo, "SNP"= 1:nrow(df1bo)) 
df1bo$CHROM<-gsub("chrPGA_chromosome_","",as.character(df1bo$CHROM))
df1bo <- df1bo %>% select(SNP, everything())
df1bo$SNP <- as.character(df1bo$SNP)
colnames(df1bo) <- c("SNP", "chr", "position", "Global_Fst_tots")
head(df1bo)


#### plot ####
CMplot(df1bo, plot.type="m", type="p",r=0.5, band=1.5, outward=T, col=c("grey30","grey60"), 
       threshold=c(0.90814,0.48), ylim=c(-0.2,1), 
       signal.line = NULL,  cir.band = 0, LOG10=F, chr.border=F, 
       threshold.col=c("#c62828","#d35400"), signal.col=c("#c62828","#d35400"), points.alpha=10,
       chr.labels=paste("Chr",c(1:16),sep=""), signal.cex=c(0.5,0.25), 
       ylab=c("Global Fst"), cex.axis=1, lwd.axis=3, 
       chr.den.col=c("lightblue","lightblue", "#1f618d", "black"), cex=c(0.15), 
       file="pdf", width=8, height=4, chr.labels.angle=45, cex.lab=2)
    

#### manhhattan PAC contra ATL ####
#### llegir dades ####

df2 <- read.table(file="NC_SNP_popglobal.windowed.weir.fst", 
                  sep = "\t", header=TRUE)

#### converteix cada dataset a un fitxer independent ####
df2bo <- df2[,c(1,2,5)]
df2bo <- cbind(df2bo, "SNP"= 1:nrow(df2bo)) 
df2bo$CHROM<-gsub("chrPGA_chromosome_","",as.character(df2bo$CHROM))
df2bo <- df2bo %>% select(SNP, everything())
df2bo$SNP <- as.character(df2bo$SNP)
colnames(df2bo) <- c("SNP", "chr", "position", "Global_Fst_NC")
head(df2bo)



#### plot ####
CMplot(df2bo, plot.type="m", type="p",r=0.5, band=1.5, outward=T, col=c("grey30","grey60"), 
       threshold=c(0.5065,0.2499), ylim=c(-0.2,1), 
       signal.line = NULL,  cir.band = 0, LOG10=F, chr.border=F, 
       threshold.col=c("#c62828","#d35400"), signal.col=c("#c62828","#d35400"), points.alpha=10,
       chr.labels=paste("Chr",c(1:16),sep=""), signal.cex=c(0.5,0.25), 
       ylab=c("Global Fst"), cex.axis=1, lwd.axis=3, 
       chr.den.col=c("lightblue","lightblue", "#1f618d", "black"), cex=c(0.15), 
       file="tiff", width=8, height=4, chr.labels.angle=45, cex.lab=2)
