library(ggplot2)
###This program creates a simple box and whisker plot of negative and original for percentageExpressionPatternRecall and percentageExpressionPatternPrecision (for all methods together, imm only, and for each individual method) 

#This adds the imm and all files into the enviornment
negimmData <-read.table("neg_imm_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origimmData <- read.table("orig-imm-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")

negallData <-read.table("neg_all_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origallData <- read.table("orig-all-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")
all = TRUE

if (all){
  
  #Creating the list of "original" or "neg" onto one dataframe for easier access
  lenall <- length(unlist(negallData['PercentageTrainingSetSensitivity']))
  
  alllineofnegs = rep("Negative", lenall)
  negallData$Dset <- alllineofnegs
  alllineoforig = c(rep("Original", lenall))
  origallData$Dset <- alllineoforig
  
  cumalldata <-rbind(origallData, negallData)
  
  
  ###### For all methods only ###

  
  #Percent Expression Pattern Recall
  allexp = boxplot(percentageExpressionPatternRecall ~ Dset, 
                   cumalldata,
                   main = "all Percent Expression Pattern Recall")
  
  #Percent Expression Pattern Precision
  
  allper = boxplot(percentageExpressionPatternPrecision ~ Dset, 
                   cumalldata,
                   main = "all Percent Expression Pattern Precision")
  
  
  
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

#Percent Expression Pattern Recall
immexp = boxplot(percentageExpressionPatternRecall ~ Dset, 
                 cumimmdata,
                 main = "imm Percent Expression Pattern Recall")

#Percent Expression Pattern Precision

immper = boxplot(percentageExpressionPatternPrecision ~ Dset, 
                 cumimmdata,
                 main = "imm Percent Expression Pattern Precision")



#############################
#Using all data and analysis for each method

if (all){
  
  ###### For all original data (percents for each method)###
  
  thing3 = boxplot(percentageExpressionPatternRecall ~ Method, 
                   origallData,
                   main = "Original Percent Expression Pattern Recall per method")
  
  
  thing3rec = boxplot(percentageExpressionPatternPrecision ~ Method, 
                      origallData,
                      main = "Original Percent Expression Pattern Precision per method")
  
  ###### For all negative data (percents for each method)###
  
  thing2 = boxplot(percentageExpressionPatternRecall ~ Method, 
                   negallData,
                   main = "Neg Percent Expression Pattern Recall per method")
  
  
  thing2rec = boxplot(percentageExpressionPatternPrecision ~ Method, 
                      negallData,
                      main = "Neg Percent Expression Pattern Precision per method")
}