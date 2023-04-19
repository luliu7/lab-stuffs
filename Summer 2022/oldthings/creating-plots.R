library(ggplot2)
###This program creates a simple box and whisker plot of negative and original for percent sensitivity and redfly recovery (for all methods together, imm only, and for each individual method) 

#This adds the imm files into the enviornment
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
  
  #Percentage Training Set sensitivity
  
  allsen = boxplot(PercentageTrainingSetSensitivity ~ Dset, 
                   cumalldata,
                   main = "all Percent sensitivity")
  
  
  #Percent redfly recovery
  
  allrec = boxplot(PercentageRedflyRecovered ~ Dset, 
                   cumalldata,
                   main = "all Percent Redfly Recovery")
  

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




if (all){

###### For all original data (percents for each method)###

thing3 = boxplot(PercentageTrainingSetSensitivity ~ Method, 
                 origallData,
                 main = "Original Percent sensitivity per method")


thing3rec = boxplot(PercentageRedflyRecovered ~ Method, 
                    origallData,
                    main = "Original Percent redfly per method")

###### For all negative data (percents for each method)###

thing2 = boxplot(PercentageTrainingSetSensitivity ~ Method, 
                 negallData,
                 main = "Neg Percent sensitivity per method")


thing2rec = boxplot(PercentageRedflyRecovered ~ Method, 
                 negallData,
                 main = "Neg Percent redfly per method")
}