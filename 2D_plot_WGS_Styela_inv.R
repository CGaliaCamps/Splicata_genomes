if (!require("ggplot2")) {
  install.packages("ggplot2", dependencies = TRUE)
  library(ggplot2)}


setwd("E:/styela/Molecular/GenomaStyela/GOTerms/PAIRWISE/plot enriquiment")
library(ggrepel)

####load your data####
MDS_2 <- read.table(file = "MDS_chr2_tots.mds", 
                      sep = "",header=TRUE)
MDS_2 <- as.data.frame(MDS_2)

MDS_4 <- read.table(file = "MDS_chr4_tots.mds", 
                    sep = "",header=TRUE)
MDS_4 <- as.data.frame(MDS_4)

MDS_11 <- read.table(file = "MDS_chr11_tots.mds", 
                    sep = "",header=TRUE)
MDS_11 <- as.data.frame(MDS_11)

MDS_16 <- read.table(file = "MDS_chr16_tots.mds", 
                    sep = "",header=TRUE)
MDS_16 <- as.data.frame(MDS_16)


####add your pops####
MDS_2$POP <- c("BRA","BRA","BRA","BRA","CA","CA","CA","CA","FE","FE","FE","FE","MIS","MIS","MIS","MIS","NC","NC","NC","NC","PE","PE","PE","PE")
MDS_4$POP <- c("BRA","BRA","BRA","BRA","CA","CA","CA","CA","FE","FE","FE","FE","MIS","MIS","MIS","MIS","NC","NC","NC","NC","PE","PE","PE","PE")
MDS_11$POP <- c("BRA","BRA","BRA","BRA","CA","CA","CA","CA","FE","FE","FE","FE","MIS","MIS","MIS","MIS","NC","NC","NC","NC","PE","PE","PE","PE")
MDS_16$POP <- c("BRA","BRA","BRA","BRA","CA","CA","CA","CA","FE","FE","FE","FE","MIS","MIS","MIS","MIS","NC","NC","NC","NC","PE","PE","PE","PE")


head(MDS_2)
#colnames(MDS_tot) <- c("FID", "Population", "Mitogroup", "C1", "C2", "C3","C4", "C5", "C6", "C7", "C8","C9","C10","C11","C12","C13","C14","C15","C16","C17","C18","C19","C20","C21","C22","C23","C24" )

pdf(file="MDS_2_inv.pdf", bg = NULL, width = 4, height = 4)
ggplot(MDS_2,aes(x=C1, y=C2, color=POP, label=FID)) + 
  geom_point(size=6, alpha=1) +
  theme_classic() +
  theme(legend.position='none')+
  scale_shape_manual(values = c(16,16,16,16,16,16)) +   #16,7,8,17,15,4
  scale_color_manual(values = c("#bb8fce", "#d35400", "#229954", "#e59866","#7d3c98","#a9dfbf")) +
  geom_text_repel(size=2.5, color="black", box.padding=0.3, max.overlaps=100)+
  xlab("MDS 1") +
  ylab("MDS 2") +
  theme(axis.text=element_text(size=12, face="bold"),
        axis.title=element_text(size=16,face="bold"))
dev.off()

pdf(file="MDS_4_inv.pdf", bg = NULL, width = 4, height = 4)
ggplot(MDS_4,aes(x=C1, y=C2, color=POP, label=FID)) + 
  geom_point(size=6, alpha=1) +
  theme_classic() +
  theme(legend.position='none')+
  scale_shape_manual(values = c(16,16,16,16,16,16)) +   #16,7,8,17,15,4
  scale_color_manual(values = c("#bb8fce", "#d35400", "#229954", "#e59866","#7d3c98","#a9dfbf")) +
  geom_text_repel(size=2.5, color="black", box.padding=0.1, max.overlaps=100)+
   xlab("MDS 1") +
  ylab("MDS 2") +
  theme(axis.text=element_text(size=12, face="bold"),
        axis.title=element_text(size=16,face="bold"))
dev.off()

pdf(file="MDS_11_inv.pdf", bg = NULL, width = 4, height = 4)
ggplot(MDS_11,aes(x=C1, y=C2, color=POP, label=FID)) + 
  geom_point(size=6, alpha=1) +
  theme_classic() +
  theme(legend.position='none')+
  scale_shape_manual(values = c(16,16,16,16,16,16)) +   #16,7,8,17,15,4
  scale_color_manual(values = c("#bb8fce", "#d35400", "#229954", "#e59866","#7d3c98","#a9dfbf")) +
  geom_text_repel(size=2.5, color="black", box.padding=0.3, max.overlaps=100)+
  xlab("MDS 1") +
  ylab("MDS 2") +
  theme(axis.text=element_text(size=12, face="bold"),
        axis.title=element_text(size=16,face="bold"))
dev.off()

pdf(file="MDS_16_inv.pdf", bg = NULL, width = 4, height = 4)
ggplot(MDS_16,aes(x=C1, y=C2, color=POP, label=FID)) + 
  geom_point(size=6, alpha=1) +
  theme_classic() +
  theme(legend.position='none')+
  scale_shape_manual(values = c(16,16,16,16,16,16)) +   #16,7,8,17,15,4
  scale_color_manual(values = c("#bb8fce", "#d35400", "#229954", "#e59866","#7d3c98","#a9dfbf")) +
  geom_text_repel(size=2.5, color="black", box.padding=0.3, max.overlaps=100)+
  xlab("MDS 1") +
  ylab("MDS 2") +
  theme(axis.text=element_text(size=12, face="bold"),
        axis.title=element_text(size=16,face="bold"))
dev.off()

