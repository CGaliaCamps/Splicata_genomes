library("ggplot2")
library("tidyr")
library("plotly")

setwd("G:/styela/Molecular/Genomica poblacions/DNA mundial/mitogenomes/Coverages_data_plots")
options(scipen=999)


#### you need a edited output from tablet without name and adding Na to complete the matrix ####
df1 <- read.table(file="NC18_MIS6_map.bam.txt",  header=F)

#df1 <- df1[,2:51]
vector <- as.vector(t(df1))
df1bo <- as.data.frame(vector)

df1bo <- as.numeric(df1bo$vector)
df1bo <- as.data.frame(df1bo)

df1bo <- cbind(df1bo, "position"= 1:nrow(df1bo)) 
colnames(df1bo) <- c("coverage", "position")
df_plot <- na.omit(df1bo)



### COLORS DELS GRUPS ###

  #mitoA=#1976d2
  #mitoB=#f9a825
  #mitoC=#d32f2f

  #mitoA vs mitoB = #a3e4d7 
  #mitoA vs mitoC = #d7bde2 

  #mitoB vs mitoA = #a3e4d7
  #mitoB vs mitoC =

  #mitoC vs mitoB = #edbb99
  #mitoC vs mitoA = #d7bde2 




pdf(file="NC18tempvsMIS6map.pdf", width=15, height=10)
ggplot(df_plot,aes(x=position, y=coverage)) + 
  geom_area(fill="#808080") +
  xlab("")+
  ylab("")+
  theme_minimal()+
  scale_y_continuous(limits = c(0, 1070), 
                     breaks= c(0,250,500,750,1000))+
  scale_x_continuous(breaks = seq(0, max(df_plot$position), by =2500),
                     limits = c(0, max(df_plot$position))) +
  theme(text=element_text(size=50, face = "bold"),
      axis.text.y = element_text(angle=0),
      axis.text.x = element_text(angle=90))
dev.off()





pdf(file="NC18tempvsMIS6map_ZOOM.pdf", width=5, height=5)
ggplot(df_plot,aes(x=position, y=coverage)) + 
  geom_area(fill="#808080") +
  xlab("")+
  ylab("")+
  theme_minimal()+
  scale_y_continuous(limits = c(0, 1070), 
                     breaks= c(0,250,500,750,1000))+
  scale_x_continuous(limits = c(2800, 3450)) +
  theme(text=element_text(size=25,face = "bold", angle=45, hjust=0.6),
axis.text.y = element_text())
dev.off()



