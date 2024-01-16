if (!require("ggplot2")) {
  install.packages("ggplot2", dependencies = TRUE)
  library(ggplot2)}
if (!require("ggpubr")) {
    install.packages("ggpubr", dependencies = TRUE)
    library(ggpubr)}
if (!require("dplyr")) {
  install.packages("dplyr", dependencies = TRUE)
  library(dplyr)}
if (!require("pacman")) {
  install.packages("pacman", dependencies = TRUE)
  library(pacman)}

p_load("tidyverse")

data_wd = "E:/styela/Molecular/Genomica poblacions/DNA mundial/WGS_mundial/RoH"
setwd(data_wd)

#### original ####
options(scipen=999)

#carrega la taula de GT, noms i posicions
table <-read.table(file = "2allele_tots_012_chr1.012", 
                   sep = "\t", header=FALSE)
noms <- read.table(file = "2allele_tots_012_chr1.012.indv", 
                   sep = "\t", header=FALSE)
posicio <- read.table(file = "2allele_tots_012_chr1.012.pos", 
                      sep = "\t", header=FALSE) 

table <- as.data.frame(table)
noms <- as.data.frame(noms)
head(noms)
posicio <- as.data.frame(posicio)
head(posicio)

#afegeix i elimina columnes sobrants
posiciohead <- c("CHR", "POS")
colnames(posicio) <- posiciohead
head(posicio)
table <- select(table, c(-1))


#transposa la matriu i converteix-la a txt
genotips <- t(table)
genotips <- as.data.frame(genotips)

noms <- t(noms)
noms <- as.data.frame(noms)

posicio <- as.data.frame(posicio)

colnames(genotips) <- noms

TS <- cbind(posicio,genotips)
head(TS)

#funcio que et fa sliding windows acord al dataset, mida de finestra (window) i moviment (step)
slideFunct <- function(data, window, step){
  total <- length(data)
  spots <- seq(from=1, to=(total-window), by=step)
  result <- vector(length = length(spots))
  for(i in 1:length(spots)){
    result[i] <- mean(data[spots[i]:(spots[i]+window)])
  }
  return(result)
}

#aplica la funció a tot
position <- slideFunct(data=TS$POS, window=10000, step = 2500)
valuesBRA10 <- slideFunct(data=TS$BRA10 , window=10000, step = 2500)
valuesBRA11 <- slideFunct(data=TS$BRA11  , window=10000, step = 2500)
valuesBRA16 <- slideFunct(data=TS$BRA16  , window=10000, step = 2500)
valuesBRA26 <- slideFunct(data=TS$BRA26  , window=10000, step = 2500)
valuesCA3 <- slideFunct(data=TS$CA3  , window=10000, step = 2500)
valuesCA4 <- slideFunct(data=TS$CA4  , window=10000, step = 2500)
valuesCA8 <- slideFunct(data=TS$CA8  , window=10000, step = 2500)
valuesCA9 <- slideFunct(data=TS$CA9  , window=10000, step = 2500)
valuesFE12 <- slideFunct(data=TS$FE12  , window=10000, step = 2500)
valuesFE22 <- slideFunct(data=TS$FE22  , window=10000, step = 2500)
valuesFE6 <- slideFunct(data=TS$FE6  , window=10000, step = 2500)
valuesFE8 <- slideFunct(data=TS$FE8 , window=10000, step = 2500)
valuesMIS17 <- slideFunct(data=TS$MIS17  , window=10000, step = 2500)
valuesMIS22 <- slideFunct(data=TS$MIS22  , window=10000, step = 2500)
valuesMIS3 <- slideFunct(data=TS$MIS3  , window=10000, step = 2500)
valuesMIS6 <- slideFunct(data=TS$MIS6   , window=10000, step = 2500)
valuesNC11 <- slideFunct(data=TS$NC11   , window=10000, step = 2500)
valuesNC18 <- slideFunct(data=TS$NC18   , window=10000, step = 2500)
valuesNC23 <- slideFunct(data=TS$NC23  , window=10000, step = 2500)
valuesNC25 <- slideFunct(data=TS$NC25   , window=10000, step = 2500)
valuesPE10 <- slideFunct(data=TS$PE10   , window=10000, step = 2500)
valuesPE4 <- slideFunct(data=TS$PE4   , window=10000, step = 2500)
valuesPE7 <- slideFunct(data=TS$PE7    , window=10000, step = 2500)
valuesPE8 <- slideFunct(data=TS$PE8   , window=10000, step = 2500)

#comverteix els valors de la funció a dataframes
position <- as.data.frame(position)
valuesBRA10 <- as.data.frame(valuesBRA10)
valuesBRA11 <- as.data.frame(valuesBRA11)
valuesBRA16 <- as.data.frame(valuesBRA16)
valuesBRA26 <- as.data.frame(valuesBRA26)
valuesCA3 <- as.data.frame(valuesCA3)
valuesCA4 <- as.data.frame(valuesCA4)
valuesCA8 <- as.data.frame(valuesCA8)
valuesCA9 <- as.data.frame(valuesCA9)
valuesFE12 <- as.data.frame(valuesFE12)
valuesFE22 <- as.data.frame(valuesFE22)
valuesFE6 <- as.data.frame(valuesFE6)
valuesFE8 <- as.data.frame(valuesFE8)
valuesMIS17 <- as.data.frame(valuesMIS17)
valuesMIS22 <- as.data.frame(valuesMIS22)
valuesMIS3 <- as.data.frame(valuesMIS3)
valuesMIS6 <- as.data.frame(valuesMIS6)
valuesNC11 <- as.data.frame(valuesNC11)
valuesNC18 <- as.data.frame(valuesNC18)
valuesNC23 <- as.data.frame(valuesNC23)
valuesNC25 <- as.data.frame(valuesNC25)
valuesPE10 <- as.data.frame(valuesPE10)
valuesPE4 <- as.data.frame(valuesPE4)
valuesPE7 <- as.data.frame(valuesPE7)
valuesPE8 <- as.data.frame(valuesPE8)

#concatena els dataframes
result <- cbind(position,
                valuesBRA10,valuesBRA11,valuesBRA16,valuesBRA26,
                valuesCA3,valuesCA4,valuesCA8,valuesCA9,
                valuesFE12,valuesFE22,valuesFE6,valuesFE8, 
                valuesMIS17,valuesMIS22,valuesMIS3,valuesMIS6, 
                valuesNC11,valuesNC18,valuesNC23,valuesNC25,
                valuesPE10,valuesPE4,valuesPE7,valuesPE8)

result <- as.data.frame(result)

labels=c("ref. homozygous", "heterozygous", "alt. heterozygous")


chr1m <- ggplot(data=result, aes(x=position)) +
  geom_line(aes(y=valuesBRA10), color="#d32f2f", size=1)+
  geom_line(aes(y=valuesBRA11), color="#d32f2f", size=1)+
  geom_line(aes(y=valuesBRA16), color="#1976d2", size=1)+
  geom_line(aes(y=valuesBRA26), color="#1976d2", size=1)+
  geom_line(aes(y=valuesCA3), color="#d32f2f", size=1)+
  geom_line(aes(y=valuesCA4), color="#1976d2", size=1)+
  geom_line(aes(y=valuesCA8), color="#1976d2", size=1)+
  geom_line(aes(y=valuesCA9), color="#d32f2f", size=1)+
  geom_line(aes(y=valuesFE12), color="#1976d2", size=1)+
  geom_line(aes(y=valuesFE22), color="#1976d2", size=1)+
  geom_line(aes(y=valuesFE6), color="#1976d2", size=1)+
  geom_line(aes(y=valuesFE8), color="#d32f2f", size=1)+
  geom_line(aes(y=valuesMIS17), color="#d32f2f", size=1)+
  geom_line(aes(y=valuesMIS22), color="#1976d2", size=1)+
  geom_line(aes(y=valuesMIS3), color="#d32f2f", size=1)+
    geom_line(aes(y=valuesMIS6), color="#d32f2f", size=1)+
  geom_line(aes(y=valuesNC11), color="#f9a825", size=1)+
  geom_line(aes(y=valuesNC18), color="black", size=1)+
  geom_line(aes(y=valuesNC23), color="#f9a825", size=1)+
  geom_line(aes(y=valuesNC25), color="#f9a825", size=1)+
  geom_line(aes(y=valuesPE10), color="#d32f2f", size=1)+
  geom_line(aes(y=valuesPE4), color="#1976d2", size=1)+
  geom_line(aes(y=valuesPE7), color="#d32f2f", size=1)+
  geom_line(aes(y=valuesPE8), color="#1976d2", size=1)+
    theme_classic()+
  scale_x_continuous(labels = scales::comma, breaks = c(5000000,
    #10000000
    15000000
    #,20000000
    ,25000000
  ))+                                                         
  scale_y_continuous(name="Homozygosity", limits=c(0, 2), breaks = c(0,1,2))+
  theme(axis.text=element_text(size=14, face="bold"),
  axis.title=element_text(size=20,face="bold"), axis.text.x =element_text(angle=0, hjust=1)) 

  
pdf(file="E:/styela/Molecular/Genomica poblacions/DNA mundial/WGS_mundial/RoH/chr1/chr1_m_inversions.pdf", width=4, height = 5)
plot(chr1m)
dev.off()



chr1p <- ggplot(data=result, aes(x=position)) +
  geom_line(aes(y=valuesBRA10), color="#bb8fce", size=1)+
  geom_line(aes(y=valuesBRA11), color="#bb8fce", size=1)+
  geom_line(aes(y=valuesBRA16), color="#bb8fce", size=1)+
  geom_line(aes(y=valuesBRA26), color="#bb8fce", size=1)+
  geom_line(aes(y=valuesCA3), color="#d35400", size=1)+
  geom_line(aes(y=valuesCA4), color="#d35400", size=1)+
  geom_line(aes(y=valuesCA8), color="#d35400", size=1)+
  geom_line(aes(y=valuesCA9), color="#d35400", size=1)+
  geom_line(aes(y=valuesFE12), color="#229954", size=1)+
  geom_line(aes(y=valuesFE22), color="#229954", size=1)+
  geom_line(aes(y=valuesFE6), color="#229954", size=1)+
  geom_line(aes(y=valuesFE8), color="#229954", size=1)+
  geom_line(aes(y=valuesMIS17), color="#e59866", size=1)+
  geom_line(aes(y=valuesMIS22), color="#e59866", size=1)+
  geom_line(aes(y=valuesMIS3), color="#e59866", size=1)+
  geom_line(aes(y=valuesMIS6), color="#e59866", size=1)+
  geom_line(aes(y=valuesNC11), color="#7d3c98", size=1)+
  geom_line(aes(y=valuesNC18), color="#7d3c98", size=1)+
  geom_line(aes(y=valuesNC23), color="#7d3c98", size=1)+
  geom_line(aes(y=valuesNC25), color="#7d3c98", size=1)+
  geom_line(aes(y=valuesPE10), color="#a9dfbf", size=1)+
  geom_line(aes(y=valuesPE4), color="#a9dfbf", size=1)+
  geom_line(aes(y=valuesPE7), color="#a9dfbf", size=1)+
  geom_line(aes(y=valuesPE8), color="#a9dfbf", size=1)+
  theme_classic()+
  scale_x_continuous(labels = scales::comma, breaks = c(5000000,
                                                        #10000000
                                                        15000000
                                                        #,20000000
                                                        ,25000000
                                                        ))+  
  scale_y_continuous(name="Homozygosity", limits=c(0, 2), breaks = c(0,1,2))+
  theme(axis.text=element_text(size=14, face="bold"),
        axis.title=element_text(size=20,face="bold"), axis.text.x =element_text(angle=0, hjust=1)) 

pdf(file="E:/styela/Molecular/Genomica poblacions/DNA mundial/WGS_mundial/RoH/chr1/chr1_p_inversions.pdf", width=4, height = 5)
plot(chr1p)
dev.off()

