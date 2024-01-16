#install.packages("CMplot")
library("CMplot")
source("https://raw.githubusercontent.com/YinLiLin/CMplot/master/R/CMplot.r")
library("dplyr")
library("scales")


setwd("E:/styela/Molecular/Genomica poblacions/DNA mundial/WGS_mundial/all_chr_pi_fst_TajimaD/Pi")
options(scipen=999)


#### manhhattan NC contra la resta ####
#### llegir dades ####

df1 <- read.table(file="tot_SNP_pi.windowed.pi", 
                  sep = "\t", header=TRUE)
head(df1)
#### converteix cada dataset a un fitxer independent ####
df1bo <- df1[,c(1,2,5)]
df1bo <- cbind(df1bo, "SNP"= 1:nrow(df1bo)) 
head(df1bo)
df1bo$CHROM<-gsub("chrPGA_chromosome_","",as.character(df1bo$CHROM))
head(df1bo)
df1bo <- df1bo %>% select(SNP, everything())
head(df1bo)
df1bo$SNP <- as.character(df1bo$SNP)
colnames(df1bo) <- c("SNP", "chr", "position", "Pi")
head(df1bo)


#### defineix primer les regions dels cromosomes####
SNPchr11 <- df1bo[df1bo$chr==11 & df1bo$position > "2500" & df1bo$position < 10440662 & df1bo$Pi > -1, 1]
SNPchr4 <- df1bo[df1bo$chr==4 & df1bo$position > "2500" & df1bo$position < 16999389 & df1bo$Pi > -1, 1]
SNPchr2 <- df1bo[df1bo$chr==2 & df1bo$position > "2500" & df1bo$position < 19480816 & df1bo$Pi > -1, 1]
SNPchr16 <- df1bo[df1bo$chr==16 & df1bo$position > 4371327 & df1bo$position < 20000000 & df1bo$Pi > -1, 1]

SNPs <- c(SNPchr11, SNPchr4, SNPchr2, SNPchr16)

#### plot ####
CMplot(df1bo, plot.type="m", type="p",r=0.5, band=1, outward=T, col=c("grey30","grey60"), 
       #threshold=list(c(0.0026)), 
       ylim=list(c(0,0.015)), 
       signal.line = NULL,  cir.band = 0.2, LOG10=F, chr.border=FALSE, 
       # highlight=SNPs, highlight.col="darkred", highlight.cex = 0.35,
       threshold.col=c("#d35400"), signal.col=c("#d35400"), 
       chr.labels=paste("Chr",c(1:16),sep=""), signal.cex=c(0.20), 
       ylab=c("Global Pi"), 
       #bin.range=c(1, 400),
       #chr.den.col=c("lightblue","lightblue", "#1f618d", "black"), 
       cex=c(0.15), 
       file="pdf", height=3.5, width=15)

CMplot(df1bo, plot.type="d", type="p",r=0.5, band=1, outward=T, col=c("grey30","grey60"), 
       #threshold=list(c(0.0026)), 
       ylim=list(c(0,0.015)), 
       signal.line = NULL,  cir.band = 0.2, LOG10=F, chr.border=FALSE, 
       # highlight=SNPs, highlight.col="darkred", highlight.cex = 0.35,
       threshold.col=c("#d35400"), signal.col=c("#d35400"), 
       chr.labels=paste("Chr",c(16:1),sep=""), signal.cex=c(0.35), 
       ylab=c("SNPs legend"), 
       chr.den.col=c("lightblue","lightblue", "#1f618d", "black"), cex=c(0.25), 
       bin.range=c(1, 400),
       file="pdf", height=6, width=8)
      

  