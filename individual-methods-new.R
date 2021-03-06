###Makes a bar graph of the Percent Expression Pattern Recall and Percent Expression Pattern Precision for original vs negative
### Only compares between original and negative for these graphs

#NOTE: Sometimes All Methods Percent Expression Pattern Precision does not show on the plot (idk why)
#You must rerun line 37 individually (The functions and whatnot work, it's just R acting weird?)

library(ggplot2)
all = TRUE


#This adds the imm files into the environment
negimmData <-read.table("neg_imm_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origimmData <- read.table("orig-imm-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")

if (all){
  negallData <-read.table("neg_all_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
  origallData <- read.table("orig-all-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")
  
  #Creating data frames to put the data into one graph
  
  #For all data concat
  lenall <- length(unlist(negallData['percentageExpressionPatternPrecision']))
  
  alllineofnegs = rep("Negative", lenall)
  negallData$Dset <- alllineofnegs
  alllineoforig = c(rep("Original", lenall))
  origallData$Dset <- alllineoforig
  
  cumalldata <-rbind(origallData, negallData)
  
  
  #Making a graph of all methods % Expression Pattern Precision for each tset (Comparing original to negative)
  alls1 <- ggplot(data = cumalldata, aes(x = TsetName, y = percentageExpressionPatternPrecision, fill = Dset)) +
    geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) 

  #RERUN THE FOLLOWING LINE IF PLOT DOES NOT SHOW
  alls1 + coord_flip() + labs(title = " All methods Percent Expression Pattern Precision")
  
  #Making a graph of all methods % Expression Pattern Recall for each tset (Comparing original to negative)
  alls2 <- ggplot(data = cumalldata, aes(x = TsetName, y = percentageExpressionPatternRecall, fill = Dset)) +
    geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) 
  alls2 + coord_flip() + labs(title = " All methods Percent Expression Pattern Recall")
  
}
#

#For imm data concat

lenimm <- length(unlist(negimmData['percentageExpressionPatternPrecision']))

immlineofnegs = rep("Negative", lenimm)
negimmData$Dset <- immlineofnegs
immlineoforig = c(rep("Original", lenimm))
origimmData$Dset <- immlineoforig

cumimmdata <-rbind(origimmData, negimmData)


#Making a graph of all methods % Expression Pattern Precision for each tset (Comparing original to negative)
alls3 <- ggplot(data = cumimmdata, aes(x = TsetName, y = percentageExpressionPatternPrecision, fill = Dset)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) 
alls3 + coord_flip() + labs(title = " imm methods Percent Expression Pattern Precision")

#Making a graph of all methods % Expression Pattern Recall for each tset (Comparing original to negative)
alls4 <- ggplot(data = cumimmdata, aes(x = TsetName, y = percentageExpressionPatternRecall, fill = Dset)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) 
alls4 + coord_flip() + labs(title = " imm methods Percent Expression Pattern Recall")




