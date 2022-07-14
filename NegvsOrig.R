#Test space

#This adds the imm files into the enviornment
negimmData <-read.table("neg_all_imm_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origimmData <- read.table("orig_imm_pCRMeval.txt.bed", header=TRUE, sep = "\t")

negallData <-read.table("neg_all_methods_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origallData <- read.table("orig_allmethods_pCRMeval.txt.bed", header=TRUE, sep = "\t")


#Creating data frames to put the data into one graph

#For all data concat
negallsensitivity = c(negallData[8])

lenall <- length(unlist(negallsensitivity))

alllineofnegs = rep("Negative", lenall)
negallData$Dset <- alllineofnegs
alllineoforig = c(rep("Original", lenall))
origallData$Dset <- alllineoforig


cumalldata <-rbind(origallData, negallData)


#Making a graph of all methods % Redfly recovery for each tset (Comparing original to negative)
alls1 <- ggplot(data = cumalldata, aes(x = TsetName, y = PercentageRedflyRecovered, fill = Dset)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) 
alls1 + coord_flip() + labs(title = " All methods Percent Redfly Recovery")

#Making a graph of all methods % sensitivity for each tset (Comparing original to negative)
alls2 <- ggplot(data = cumalldata, aes(x = TsetName, y = PercentageTrainingSetSensitivity, fill = Dset)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) 
alls2 + coord_flip() + labs(title = " All methods Percent Trainign sensitiviity")




#For imm data concat

negimmsensitivity = c(negimmData[8])

lenimm <- length(unlist(negimmsensitivity))

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




