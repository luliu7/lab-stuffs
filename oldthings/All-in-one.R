#All plots on one plot... 



library(ggplot2)
###This program creates a simple box and whisker plot of negative and original for percent sensitivity and redfly recovery (for all methods together, imm only, and for each individual method) 

#This adds the imm files into the enviornment
negimmData <-read.table("neg_imm_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origimmData <- read.table("orig-imm-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")

negallData <-read.table("neg_all_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origallData <- read.table("orig-all-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")
all = TRUE
par(mfrow=c(1,4)) #puts 4 graphs on same thingy

if (all){
  
  #Creating the list of "original" or "neg" onto one dataframe for easier access
  lenall <- length(unlist(negallData['PercentageTrainingSetSensitivity']))
  
  alllineofnegs = rep("Negative", lenall)
  negallData$Dset <- alllineofnegs
  alllineoforig = c(rep("Original", lenall))
  origallData$Dset <- alllineoforig
  
  cumalldata <-rbind(origallData, negallData)
  
  
  ###### For all methods only ###
  
  #Percentage Training Set sensitiity
  
  allsen = boxplot(PercentageTrainingSetSensitivity ~ Dset, 
                   cumalldata,
                   main = "all Percent sensitivity")
  
  
  #Percent redfly recovery
  
  allrec = boxplot(PercentageRedflyRecovered ~ Dset, 
                   cumalldata,
                   main = "all Percent Redfly Recovery")
  
  
  #Percent Expression Pattern Recall
  allexp = boxplot(percentageExpressionPatternRecall ~ Dset, 
                   cumalldata,
                   main = "all Percent Expression Pattern Recall")
  
  #Percent Expression Pattern Precision
  
  allper = boxplot(percentageExpressionPatternPrecision ~ Dset, 
                   cumalldata,
                   main = "all Percent Expression Pattern Precision")
  
  
  
  
  
  #  par(mfrow=c(1,4)) #puts 4 graphs on same thingy
  #  boxplot(percentageExpressionPatternRecall ~ Dset, 
  #          cumalldata,
  #          main = "all Percent Expression Pattern Recall")
  #  boxplot(percentageExpressionPatternPrecision ~ Dset, 
  #          cumalldata,
  #          main = "all Percent Expression Pattern Precision")
  #  boxplot(PercentageTrainingSetSensitivity ~ Dset, 
  #          cumalldata,
  #          main = "all Percent sensitivity")
  #  boxplot(PercentageRedflyRecovered ~ Dset, 
  #            cumalldata,
  #          main = "all Percent Redfly Recovery")
  
}
################################################################


#Creating the list of "original" or "neg" onto one dataframe for easier access
lenimm <- length(unlist(negimmData['PercentageTrainingSetSensitivity']))

immlineofnegs = rep("Negative", lenimm)
negimmData$Dset <- immlineofnegs
immlineoforig = c(rep("Original", lenimm))
origimmData$Dset <- immlineoforig

cumimmdata <-rbind(origimmData, negimmData)


###### For imm only ###

#Percentage Training Set sensitiity

immsen = boxplot(PercentageTrainingSetSensitivity ~ Dset, 
                 cumimmdata,
                 main = "imm Percent sensitivity")


#Percent redfly recovery

immrec = boxplot(PercentageRedflyRecovered ~ Dset, 
                 cumimmdata,
                 main = "imm Percent Redfly Recovery")


#Percent Expression Pattern Recall
immexp = boxplot(percentageExpressionPatternRecall ~ Dset, 
                 cumimmdata,
                 main = "imm Percent Expression Pattern Recall")

#Percent Expression Pattern Precision

immper = boxplot(percentageExpressionPatternPrecision ~ Dset, 
                 cumimmdata,
                 main = "imm Percent Expression Pattern Precision")





#par(mfrow=c(1,4)) #puts 4 graphs on same thingy
#boxplot(percentageExpressionPatternRecall ~ Dset, 
#        cumimmdata,
#        main = "imm Percent Expression Pattern Recall")
#boxplot(percentageExpressionPatternPrecision ~ Dset, 
#        cumimmdata,
#        main = "imm Percent Expression Pattern Precision")
#boxplot(PercentageTrainingSetSensitivity ~ Dset, 
#        cumimmdata,
#        main = "imm Percent sensitivity")
#boxplot(PercentageRedflyRecovered ~ Dset, 
#        cumimmdata,
#        main = "imm Percent Redfly Recovery")
