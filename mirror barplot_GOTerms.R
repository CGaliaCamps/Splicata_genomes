#fem la taula maca
chr16$suma <- chr16$chr16L + chr16$chr16F
chr16 <- chr16[order(-chr16$suma),]
chr16 <- chr16[rowSums(chr16[, -(1)]) >0,]
chr16bo <- chr16[1:7,1:3]
chr16bo$chr16L <- chr16bo$chr16L*(-1)
chr16plot <- melt(chr16bo)
colnames(chr16plot) <- c("Function", "Inversion", "GOTerms")
rownames(chr16plot[])
chr16plot$Function <- as.character(chr16plot$Function) 


pdf(file="chr16_nums.pdf",width=4, height=2)
ggplot(chr16plot, aes(x=Function, y=GOTerms, fill = Inversion)) +
  geom_col(colour="black", lwd=0.5, width = 0.9) +
  geom_text(aes(label = GOTerms)) +
  geom_hline(aes(yintercept=0)) +
  scale_fill_manual(values = c("#D4A1C9", "#C61985")) +
  scale_x_discrete(limits = c("Others", "4", "12", "14", "13", "15", "Total")) +
  theme(legend.position = "bottom",
        axis.title.x = element_text(colour = "black"),
        axis.title.y = element_text(colour = "black")) +
  theme_classic()
dev.off()

pdf(file="chr16_GOTerms.pdf",width=4, height=2)
ggplot(chr16plot, aes(x=Function, y=GOTerms, fill = Inversion)) +
  geom_col(colour="black", lwd=0.5, width = 0.9) +
  # geom_text(aes(label = GOTerms)) +
  geom_hline(aes(yintercept=0)) +
  scale_fill_manual(values = c("#D4A1C9", "#C61985")) +
  theme(legend.position = "bottom",
        axis.title.x = element_text(colour = "black"),
        axis.title.y = element_text(colour = "black")) +
  scale_x_discrete(limits = c("Others", "4", "12", "14", "13", "15", "Total")) +
  theme_classic()
dev.off()