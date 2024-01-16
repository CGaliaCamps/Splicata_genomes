#install.packages("CMplot")
library("CMplot")
source("https://raw.githubusercontent.com/YinLiLin/CMplot/master/R/CMplot.r")
library("dplyr")
library("scales")


setwd("E:/styela/Molecular/Genomica poblacions/DNA mundial/WGS_mundial/all_chr_pi_fst_TajimaD/fst")
options(scipen=999)


#### manhhattan PAC contra ATL ####
#### llegir dades ####

df2 <- read.table(file="ATL_PAC_fst.windowed.weir.fst", 
                  sep = "\t", header=TRUE)

#### converteix cada dataset a un fitxer independent ####
df2bo <- df2[,c(1,2,5)]
df2bo <- cbind(df2bo, "SNP"= 1:nrow(df2bo)) 
df2bo$CHROM<-gsub("chrPGA_chromosome_","",as.character(df2bo$CHROM))
df2bo <- df2bo %>% select(SNP, everything())
df2bo$SNP <- as.character(df2bo$SNP)
colnames(df2bo) <- c("SNP", "chr", "position", "PAC_vs_ATL")
head(df2bo)


#### defineix primer les regions dels cromosomes####
SNPchr3 <- df2bo[df2bo$chr==3 & df2bo$position > 4000000 & df2bo$position < 9500000 & df2bo$PAC_vs_ATL > -1, 1]


#### plot ####
CMplot(df2bo, plot.type="m", type="p",r=0.5, band=1, outward=T, col=c("grey30","grey60"), 
       threshold=list(c(0.333)), ylim=list(c(-0.1,0.65)), 
       signal.line = NULL,  cir.band = 0.1, LOG10=F, chr.border=FALSE,
       # highlight.col="darkred", highlight.cex = 0.30,
       threshold.col=c("#d35400"), signal.col=c("#d35400"), 
       chr.labels=paste("Chr",c(1:16),sep=""), signal.cex=c(0.20), 
       ylab=c("FST Pacific vs. Atlantic"), 
       #chr.den.col=c("lightblue","lightblue", "#1f618d", "black"), 
       cex=c(0.15), 
       #bin.range=c(1, 400), cir.legend=FALSE,
       file="pdf", height=3.5, width=15)
