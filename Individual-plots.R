library(ggplot2)

#This adds the imm files into the enviornment
negimmData <-read.table("neg_all_imm_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origimmData <- read.table("orig_imm_pCRMeval.txt.bed", header=TRUE, sep = "\t")

negallData <-read.table("neg_all_methods_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origallData <- read.table("orig_allmethods_pCRMeval.txt.bed", header=TRUE, sep = "\t")


#Creating data frames to put the data into one graph
#I need to create an individual data 
thing3rec <- ggplot(data = origallData, aes(x = TsetName, y = PercentageRedflyRecovered, fill = Method)) +
  geom_bar(stat = "identity", position=position_dodge()) +
  geom_col(width = 0.5)
thing3rec+ coord_flip()
