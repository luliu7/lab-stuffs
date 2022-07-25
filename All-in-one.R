#All plots on one plot... hmm


library(ggplot2)
###This program creates a simple box and whisker plot of negative and original for percent sensitivity and redfly recovery (for all methods together, imm only, and for each individual method) 

#This adds the imm files into the enviornment
negimmData <-read.table("neg_imm_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origimmData <- read.table("orig-imm-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")

negallData <-read.table("neg_all_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origallData <- read.table("orig-all-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")
all = FALSE

if (all){
  
  #Creating data frames to put the data into one graph
  
  #box = boxplot(x values ~ y values) 
  #box = boxplot(all vs imm ~ actual percentage sensitivity) 
  
  negallsensitivity = c(negallData[10])
  negallrecovery = c(negallData[16])
  
  origallsensitivity = c(origallData[10])
  origallrecovery = c(origallData[16])
  
  lenall <- length(unlist(negallsensitivity))
  
  alllineofnegs = rep("Negative", lenall)
  alllineoforig = c(rep("Original", lenall))
  
  
  ###### For all methods only ###
  
  #Percentage Training Set sensitiity
  allsensitivity = append(unlist(negallsensitivity), unlist(origallsensitivity))
  allfinlen <- append(alllineofnegs, alllineoforig)
  
  allsensitivityframe <- data.frame(allfinlen, allsensitivity)
  
  
  allsen = boxplot(allsensitivity ~ allfinlen, 
                   allsensitivityframe,
                   main = "all Percent sensitivity")
  
  #Percent redfly recovery
  
  allrecovery = append(unlist(negallrecovery), unlist(origallrecovery))
  allfinlen <- append(alllineofnegs, alllineoforig)
  
  allrecoveryframe <- data.frame(allfinlen, allrecovery)
  
  
  allrec = boxplot(allrecovery ~ allfinlen, 
                   allrecoveryframe,
                   main = "all Percent Redfly Recovery")
  
}
################################################################



#negimmsensitivity = c(negimmData[PercentageTrainingSetSensitivity])
#negimmrecovery = c(negimmData[PercentageRedflyRecovered])

#origimmsensitivity = c(origimmData[PercentageTrainingSetSensitivity])
#origimmrecovery = c(origimmData[PercentageRedflyRecovered])


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





par(mfrow=c(1,4)) #puts 4 graphs on same thingy
boxplot(percentageExpressionPatternRecall ~ Dset, 
        cumimmdata,
        main = "imm Percent Expression Pattern Recall")
boxplot(percentageExpressionPatternPrecision ~ Dset, 
        cumimmdata,
        main = "imm Percent Expression Pattern Precision")
boxplot(PercentageTrainingSetSensitivity ~ Dset, 
        cumimmdata,
        main = "imm Percent sensitivity")
boxplot(PercentageRedflyRecovered ~ Dset, 
        cumimmdata,
        main = "imm Percent Redfly Recovery")
