library(ggplot2)

#This adds the imm files into the enviornment
immData <-read.table("all_imm_pCRMeval.txt.bed", header=TRUE, sep= "\t")

#allData <-read.table("all_methods_pCRMeval.txt.bed", header=TRUE, sep= "\t")


#plot = ggplot(data = immData, mapping = aes(x = PercentageRecallREDflyRecovery, y = PercentageTrainingSetSensitivity)) + geom_boxplot()

#boxy = boxplot(~P_value, data = immData, xlab = "X LABEL", ylab = "Y LABEL", main = "QAQ")
#boxy

box = boxplot(PercentageTrainingSetSensitivity ~ Method, 
              immData,
              notch = TRUE)
box
