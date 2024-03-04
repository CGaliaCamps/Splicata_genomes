library("CMplot")
source("https://raw.githubusercontent.com/YinLiLin/CMplot/master/R/CMplot.r")
library("dplyr")
library("scales")
setwd("E:/styela/Molecular/Genomica poblacions/DNA mundial/WGS_mundial/all_chr_pi_fst_TajimaD/fst_inv_enriquiment")
options(scipen=999)
chr2 <- read.table(file="chr2_altvsref_10000.windowed.weir.fst",
                   sep = "\t", header=TRUE)
enrich2 <- read.table(file="sweep_enriched_invchr2.gff",
                      sep = "\t", header=FALSE)
nsenrich2 <- read.table(file="enriched_invchr2.gff",
                        sep = "\t", header=FALSE)
#### converteix cada dataset a un fitxer independent ####
df1bo <- chr2[,c(1,2,5)]
df1bo <- cbind(df1bo, "SNP"= 1:nrow(df1bo))
df1bo$CHROM<-gsub("chrPGA_chromosome_","",as.character(df1bo$CHROM))
df1bo <- df1bo %>% select(SNP, everything())
df1bo$SNP <- as.character(df1bo$SNP)
colnames(df1bo) <- c("SNP", "chr", "position", "ref2_vs_alt2")
####selecciona la inversió####
df1bo <- df1bo[df1bo$position < 19480816,]
####modifica els teu gff####
colnames(enrich2) <- c("chr", "maker", "region", "start", "stop", "no", "strand", "se", "info")
enrich3 <- enrich2[enrich2$region == "gene",]
colnames(nsenrich2) <- c("chr", "maker", "region", "start", "stop", "no", "strand", "se", "info")
nsenrich2 <- nsenrich2[nsenrich2$region == "gene",]
SweepNPs <- c()
for (i in 1:nrow(enrich2)){
  sweep <- df1bo[df1bo$chr==2 &  df1bo$position >= enrich3$start[i] & df1bo$position <= enrich3$stop[i],1]
  SweepNPs <- rbind(SweepNPs,sweep)
}
SweepNPs <- c(t(SweepNPs))
nSweepNPs <- c()
for (n in 1:nrow(nsenrich2)){
  nsweep <- df1bo[df1bo$chr==2 &  df1bo$position >= nsenrich2$start[n] & df1bo$position <= nsenrich2$stop[n],1]
  nSweepNPs <- rbind(nSweepNPs,nsweep)
}
nSweepNPs <- c(t(nSweepNPs))
#### plot ####
CMplot(df1bo, plot.type="m", type="p",r=0.5, band=1, outward=T, col=c("grey50","grey50"),
       #threshold=list(c(0.73)),
       ylim=list(c(-0.2,1)),
       signal.line = NULL,  cir.band = 0.1, LOG10=F, chr.border=FALSE,
       highlight=nSweepNPs, highlight.col=list(c("#DDA0DD")), highlight.cex = c(0.6), highlight.type = "p", highlight.pch = c(15),
       # threshold.col=c("yellow1"), signal.col=c("#d35400"),
       #chr.labels=paste("Chr",c(1:16),sep=""), #signal.cex=c(0.35),
       ylab=c("ref.2_vs_alt.2_nosweep_ref2_vs_alt2"),
       chr.den.col=c("lightblue","lightblue", "#1f618d", "black"), cex=c(0.4), points.alpha=(100),
       file="pdf", height=2, width=4)

CMplot(df1bo, plot.type="m", type="p",r=0.5, band=1, outward=T, col=c("grey50","grey50"),
       #threshold=list(c(0.73)),
       ylim=list(c(-0.2,1)),
       signal.line = NULL,  cir.band = 0.1, LOG10=F, chr.border=FALSE,
       highlight=SweepNPs, highlight.col=list(c("#C71585")), highlight.cex = c(0.8), highlight.type = "p", highlight.pch = c(16),
       # threshold.col=c("yellow1"), signal.col=c("#d35400"),
       #chr.labels=paste("Chr",c(1:16),sep=""), #signal.cex=c(0.35),
       ylab=c("reference 2 vs. alternative 2"),
       chr.den.col=c("lightblue","lightblue", "#1f618d", "black"), cex=c(0.4), points.alpha=(100),
       file="pdf", height=2, width=4)



chr4 <- read.table(file="chr4_altvsref_10000.windowed.weir.fst",
                   sep = "\t", header=TRUE)
enrich4 <- read.table(file="sweep_enriched_invchr4.gff",
                      sep = "\t", header=FALSE)
nsenrich4 <- read.table(file="enriched_invchr4.gff",
                        sep = "\t", header=FALSE)
#### converteix cada dataset a un fitxer independent ####
df4bo <- chr4[,c(1,2,5)]
df4bo <- cbind(df4bo, "SNP"= 1:nrow(df4bo))
df4bo$CHROM<-gsub("chrPGA_chromosome_","",as.character(df4bo$CHROM))
df4bo <- df4bo %>% select(SNP, everything())
df4bo$SNP <- as.character(df4bo$SNP)
colnames(df4bo) <- c("SNP", "chr", "position", "ref4_vs_alt4")
####selecciona la inversió####
df4bo <- df4bo[ df4bo$position < 16999389,]
####modifica el teu gff####
colnames(enrich4) <- c("chr", "maker", "region", "start", "stop", "no", "strand", "se", "info")
enrich4 <- enrich4[enrich4$region == "gene",]
colnames(nsenrich4) <- c("chr", "maker", "region", "start", "stop", "no", "strand", "se", "info")
nsenrich4 <- nsenrich4[nsenrich4$region == "gene",]
#### defineix primer les regions dels cromosomes####
SweepNPs4 <- c()
for (i in 1:nrow(enrich4)){
  sweep4 <- df4bo[df4bo$chr==4 &  df4bo$position >= enrich4$start[i] & df4bo$position <= enrich4$stop[i],1]
  SweepNPs4 <- rbind(SweepNPs4,sweep4)
}
SweepNPs4 <- c(t(SweepNPs4))
nSweepNPs4 <- c()
for (n in 1:nrow(nsenrich4)){
  nsweep4 <- df4bo[df4bo$chr==4 &  df4bo$position >= nsenrich4$start[n] & df4bo$position <= nsenrich4$stop[n],1]
  nSweepNPs4 <- rbind(nSweepNPs4,nsweep4)
}
nSweepNPs4 <- c(t(nSweepNPs4))
#### plot ####
CMplot(df4bo, plot.type="m", type="p",r=0.5, band=1, outward=T, col=c("grey50","grey50"),
       #threshold=list(c(0.73)),
       ylim=list(c(-0.2,1)),
       signal.line = NULL,  cir.band = 0.1, LOG10=F, chr.border=FALSE,
       highlight=nSweepNPs4, highlight.col=list(c("#DDA0DD")), highlight.cex = c(0.6), highlight.type = "p", highlight.pch = c(15),
       # threshold.col=c("yellow1"), signal.col=c("#d35400"),
       #chr.labels=paste("Chr",c(1:16),sep=""), #signal.cex=c(0.35),
       ylab=c("reference 4 vs. alternative 4"),
       chr.den.col=c("lightblue","lightblue", "#1f618d", "black"), cex=c(0.4), points.alpha=(100),
       file="pdf", height=2, width=4)
CMplot(df4bo, plot.type="m", type="p",r=0.5, band=1, outward=T, col=c("grey50","grey50"),
       #threshold=list(c(0.73)),
       ylim=list(c(-0.2,1)),
       signal.line = NULL,  cir.band = 0.1, LOG10=F, chr.border=FALSE,
       highlight=SweepNPs4, highlight.col=list(c("#C71585")), highlight.cex = c(0.8), highlight.type = "p", highlight.pch = c(16),
       # threshold.col=c("yellow1"), signal.col=c("#d35400"),
       #chr.labels=paste("Chr",c(1:16),sep=""), #signal.cex=c(0.35),
       ylab=c("reference 4 vs. alternative 4"),
       chr.den.col=c("lightblue","lightblue", "#1f618d", "black"), cex=c(0.4), points.alpha=(100),
       file="pdf", height=2, width=4)


chr11 <- read.table(file="chr11_altvsref_10000.windowed.weir.fst",
                    sep = "\t", header=TRUE)
enrich11 <- read.table(file="sweep_enriched_invchr11.gff",
                       sep = "\t", header=FALSE)
nsenrich11 <- read.table(file="enriched_invchr11.gff",
                         sep = "\t", header=FALSE)
#### converteix cada dataset a un fitxer independent ####
df11bo <- chr11[,c(1,2,5)]
df11bo <- cbind(df11bo, "SNP"= 1:nrow(df11bo))
df11bo$CHROM<-gsub("chrPGA_chromosome_","",as.character(df11bo$CHROM))
df11bo <- df11bo %>% select(SNP, everything())
df11bo$SNP <- as.character(df11bo$SNP)
colnames(df11bo) <- c("SNP", "chr", "position", "ref11_vs_alt11")
####selecciona la inversió####
df11bo <- df11bo[ df11bo$position < 10440662,]
####modifica el teu gff####
colnames(enrich11) <- c("chr", "maker", "region", "start", "stop", "no", "strand", "se", "info")
enrich11 <- enrich11[enrich11$region == "gene",]
colnames(nsenrich11) <- c("chr", "maker", "region", "start", "stop", "no", "strand", "se", "info")
nsenrich11 <- nsenrich11[nsenrich11$region == "gene",]
#### defineix primer les regions dels cromosomes####
SweepNPs11 <- c()
for (i in 1:nrow(enrich11)){
  sweep11 <- df11bo[df11bo$chr==11 &  df11bo$position >= enrich11$start[i] & df11bo$position <= enrich11$stop[i],1]
  SweepNPs11 <- rbind(SweepNPs11,sweep11)
}
SweepNPs11 <- c(t(SweepNPs11))
nSweepNPs11 <- c()
for (n in 1:nrow(nsenrich11)){
  nsweep11 <- df11bo[df11bo$chr==11 &  df11bo$position >= nsenrich11$start[n] & df11bo$position <= nsenrich11$stop[n],1]
  nSweepNPs11 <- rbind(nSweepNPs11,nsweep11)
}
nSweepNPs11 <- c(t(nSweepNPs11))
#### plot ####
CMplot(df11bo, plot.type="m", type="p",r=0.5, band=1, outward=T, col=c("grey50","grey50"),
       #threshold=list(c(0.73)),
       ylim=list(c(-0.2,1)),
       signal.line = NULL,  cir.band = 0.1, LOG10=F, chr.border=FALSE,
       highlight=nSweepNPs11, highlight.col=list(c("#DDA0DD")), highlight.cex = c(0.6), highlight.type = "p", highlight.pch = c(15),
       # threshold.col=c("yellow1"), signal.col=c("#d35400"),
       #chr.labels=paste("Chr",c(1:16),sep=""), #signal.cex=c(0.35),
       ylab=c("reference 11 vs. alternative 11"),
       chr.den.col=c("lightblue","lightblue", "#1f618d", "black"), cex=c(0.4), points.alpha=(100),
       file="pdf", height=2, width=4)
CMplot(df11bo, plot.type="m", type="p",r=0.5, band=1, outward=T, col=c("grey50","grey50"),
       #threshold=list(c(0.73)),
       ylim=list(c(-0.2,1)),
       signal.line = NULL,  cir.band = 0.1, LOG10=F, chr.border=FALSE,
       highlight=SweepNPs11, highlight.col=list(c("#C71585")), highlight.cex = c(0.8), highlight.type = "p", highlight.pch = c(16),
       # threshold.col=c("yellow1"), signal.col=c("#d35400"),
       #chr.labels=paste("Chr",c(1:16),sep=""), #signal.cex=c(0.35),
       ylab=c("reference 11 vs. alternative 11"),
       chr.den.col=c("lightblue","lightblue", "#1f618d", "black"), cex=c(0.4), points.alpha=(100),
       file="pdf", height=2, width=4)


chr16 <- read.table(file="chr16_altvsref_10000.windowed.weir.fst",
                    sep = "\t", header=TRUE)
enrich16 <- read.table(file="sweep_enriched_invchr16.gff",
                       sep = "\t", header=FALSE)
nsenrich16 <- read.table(file="enriched_invchr16.gff",
                         sep = "\t", header=FALSE)
#### converteix cada dataset a un fitxer independent ####
df16bo <- chr16[,c(1,2,5)]
df16bo <- cbind(df16bo, "SNP"= 1:nrow(df16bo))
df16bo$CHROM<-gsub("chrPGA_chromosome_","",as.character(df16bo$CHROM))
df16bo <- df16bo %>% select(SNP, everything())
df16bo$SNP <- as.character(df16bo$SNP)
colnames(df16bo) <- c("SNP", "chr", "position", "ref16_vs_alt16")
####selecciona la inversió####
df16bo <- df16bo[ df16bo$position > 4371327,]
####modifica el teu gff####
colnames(enrich16) <- c("chr", "maker", "region", "start", "stop", "no", "strand", "se", "info")
enrich16 <- enrich16[enrich16$region == "gene",]
colnames(nsenrich16) <- c("chr", "maker", "region", "start", "stop", "no", "strand", "se", "info")
nsenrich16 <- nsenrich16[nsenrich16$region == "gene",]
#### defineix primer les regions dels cromosomes####
SweepNPs16 <- c()
for (i in 1:nrow(enrich16)){
  sweep16 <- df16bo[df16bo$chr==16 &  df16bo$position >= enrich16$start[i] & df16bo$position <= enrich16$stop[i],1]
  SweepNPs16 <- rbind(SweepNPs16,sweep16)
}
SweepNPs16 <- c(t(SweepNPs16))
nSweepNPs16 <- c()
for (n in 1:nrow(nsenrich16)){
  nsweep16 <- df16bo[df16bo$chr==16 &  df16bo$position >= nsenrich16$start[n] & df16bo$position <= nsenrich16$stop[n],1]
  nSweepNPs16 <- rbind(nSweepNPs16,nsweep16)
}
nSweepNPs16 <- c(t(nSweepNPs16))
#### plot ####
CMplot(df16bo, plot.type="m", type="p",r=0.5, band=1, outward=F, col=c("grey50","grey50"),
       #threshold=list(c(0.73)),
       ylim=list(c(-0.3,1)),
       signal.line = NULL,  cir.band = 0.1, LOG10=F, chr.border=FALSE,
       highlight=nSweepNPs16, highlight.col=list(c("#DDA0DD")), highlight.cex = c(0.6), highlight.type = "p", highlight.pch = c(15),
       # threshold.col=c("yellow1"), signal.col=c("#d35400"),
       #chr.labels=paste("Chr",c(1:16),sep=""), #signal.cex=c(0.35),
       ylab=c("reference 16 vs. alternative 16"), 
       chr.den.col=c("lightblue","lightblue", "#1f618d", "black"), cex=c(0.4), points.alpha=(100),
       file="pdf", height=2, width=4)
CMplot(df16bo, plot.type="m", type="p",r=0.5, band=1, outward=T, col=c("grey50","grey50"),
       #threshold=list(c(0.73)),
       ylim=list(c(-0.3,1)),
       signal.line = NULL,  cir.band = 0.1, LOG10=F, chr.border=FALSE,
       highlight=SweepNPs16, highlight.col=list(c("#C71585")), highlight.cex = c(0.8), highlight.type = "p", highlight.pch = c(16),
       # threshold.col=c("yellow1"), signal.col=c("#d35400"),
       #chr.labels=paste("Chr",c(1:16),sep=""), #signal.cex=c(0.35),
       ylab=c("reference 16 vs. alternative 16"),
       chr.den.col=c("lightblue","lightblue", "#1f618d", "black"), cex=c(0.4), points.alpha=(100),
       file="pdf", height=2, width=4)


