###Makes a bar graph of the % Redfly recovery and sensitivity for original vs negative
### Only compares between original and negative for these graphs
#NOTE: Sometimes All Methods Percent Redfly recovery does not show on the plot (idk why)
#You must rerun line 37 individually (The functions and whatnot work, it's just R acting weird?)

library(ggplot2)
all = TRUE


#This adds the imm files into the environment
negimmData <-read.table("neg_imm_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origimmData <- read.table("orig-imm-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")

if (all){
  negallData <-read.table("neg_all_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
  origallData <- read.table("orig-all-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")

#Creating data frames to put the list of "neg" or "orig" into one graph

#For all data concat
lenall <- length(unlist(negallData['PercentageTrainingSetSensitivity']))

alllineofnegs = rep("Negative", lenall)
negallData$Dset <- alllineofnegs
alllineoforig = c(rep("Original", lenall))
origallData$Dset <- alllineoforig

cumalldata <-rbind(origallData, negallData)



#Making a graph of all methods % Redfly recovery for each tset (Comparing original to negative)
alls1 <- ggplot(data = cumalldata, aes(x = TsetName, y = PercentageRedflyRecovered, fill = Dset)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) 

#RERUN THE FOLLOWING LINE IF PLOT DOES NOT SHOW
alls1 + coord_flip() + labs(title = " All methods Percent Redfly Recovery")


#Making a graph of all methods % sensitivity for each tset (Comparing original to negative)
alls2 <- ggplot(data = cumalldata, aes(x = TsetName, y = PercentageTrainingSetSensitivity, fill = Dset)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.5)) 
alls2 + coord_flip() + labs(title = " All methods Percent Trainign sensitiviity")

}

########################################

#For imm data concat

lenimm <- length(unlist(negimmData['PercentageTrainingSetSensitivity']))

immlineofnegs = rep("Negative", lenimm)
negimmData$Dset <- immlineofnegs
immlineoforig = c(rep("Original", lenimm))
origimmData$Dset <- immlineoforig

cumimmdata <-rbind(origimmData, negimmData)


#Making a graph of all methods % Redfly recovery for each tset (Comparing original to negative)
alls3 <- ggplot(data = cumimmdata, aes(x = TsetName, y = PercentageRedflyRecovered, fill = Dset)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) 
alls3 + coord_flip() + labs(title = " imm methods Percent Redfly Recovery")

#Making a graph of all methods % sensitivity for each tset (Comparing original to negative)
alls4 <- ggplot(data = cumimmdata, aes(x = TsetName, y = PercentageTrainingSetSensitivity, fill = Dset)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) 
alls4 + coord_flip() + labs(title = " imm methods Percent Trainign sensitiviity")




