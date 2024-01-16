library("ggpubr")

setwd("E:/styela/Molecular/Genomica poblacions/DNA mundial/WGS_mundial/all_chr_pi_fst_TajimaD/TajimaD")

Inv <- read.table(file="TajimaD_Inv.txt", header=F)
NOInv <- read.table(file="TajimaD_NoInv.txt", header=F)

Inv <- na.omit(Inv)
NOInv <- na.omit(NOInv)

NOInv <- as.numeric(NOInv$V4)

Inv <- as.data.frame(Inv[,4])
NOInv <- as.data.frame(NOInv)


Inv$Chr_type <- "Inside blocks"
NOInv$Chr_type <- "Outside blocks"

colnames(Inv) <- c("TajimasD Value", "Chromosome Region")
colnames(NOInv) <- c("TajimasD Value", "Chromosome Region")

TajimaD_comp <- rbind(Inv,NOInv)

pdf(file="Tajima's D wilcox test.pdf", width=4.5, height=4.5)
ggboxplot(TajimaD_comp, x = "Chromosome Region", y = "TajimasD Value",
          fill = "Chromosome Region", palette = c("darkred", "Grey50"),
          ylab = "TajimasD Value", xlab = "Chromosome Region")
dev.off()

colnames(TajimaD_comp) <-c("TajimasD_Value", "Chromosome_Region") 
res <- wilcox.test(TajimasD_Value ~ Chromosome_Region,
                   data = TajimaD_comp, 
                   exact = FALSE, correct=TRUE)
res

