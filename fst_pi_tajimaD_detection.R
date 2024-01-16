library(ggplot2)
if (!require("EnvStats")) {
  install.packages("EnvStats", dependencies = TRUE)
  library(EnvStats)}
if (!require("car")) {
  install.packages("car", dependencies = TRUE)
  library(car)}

#################################################################################
###!!!!!!Els fitxers d'entrada s'han danar modificant aix? com els plots!!!!!!###
#################################################################################


setwd("E:/styela/Molecular/Genomica poblacions/DNA mundial/WGS_mundial/all_chr_pi_fst_TajimaD")

# plots dels outliers de la MEAN_FST

files <- read.table(file = "BRA_NEG_fst.windowed.weir.fst", 
                    sep = "\t", header=TRUE)

summary(files$MEAN_FST)

pdf("BRA_NEG_fst_outlier_boxplot.box")

print(ggplot(files) +
        aes(x = "16 Chromosomes", y = MEAN_FST) +
        geom_boxplot(fill = "steelblue", outlier.alpha = 0.1) +
        theme_minimal())
dev.off()


outlier <- boxplot.stats(files$MEAN_FST)$out
out_position <- which(files$MEAN_FST %in% c(outlier))
table <- files[out_position, ]
write.table(table, file="BRA_NEG_fst_outliers_table.txt")

test <- rosnerTest(files$MEAN_FST,
                   k = 2000, alpha = 0.01
)
write.table(test$all.stats, file="BRA_NEG_fst_0.01outlierstest_table.txt", row.names = T)









