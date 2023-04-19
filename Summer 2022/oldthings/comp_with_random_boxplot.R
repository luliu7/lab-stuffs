library("readxl")
library(ggplot2)

library(ggpubr)
#loads file into enviornment
randrawcompallData <-read_excel("compwithrandomcombraw.xlsx")

#sensitivity
ggplot(randrawcompallData, aes(x = type, y = PercentageTrainingSetSensitivity,fill= type)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + 
  ggtitle("Sensitivity compared with random")

#Redfly Recovery
ggplot(randrawcompallData, aes(x = type, y = PercentageRedflyRecovered,fill= type)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + 
  ggtitle("Redfly Recovery compared with random")

#Recall
ggplot(randrawcompallData, aes(x = type, y = PercentageSpecificity_recall,fill= type)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + 
  ggtitle("Recall compared with random")

#Precision
ggplot(randrawcompallData, aes(x = type, y = PercentageSpecificity_pre,fill= type)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + 
  ggtitle("Precision compared with random")

  