library(ggplot2)
###This program creates a simple box and whisker plot of negative and original for percent sensitivity and redfly recovery (for all methods together, imm only, and for each individual method) 

#This adds the imm files into the enviornment
negimmData <-read.table("neg_imm_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origimmData <- read.table("orig-imm-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")

negallData <-read.table("neg_all_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origallData <- read.table("orig-all-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")
all = TRUE

if (all){
  
  #Creating data frames to put the data into one graph
  
  #box = boxplot(x values ~ y values) 
  #box = boxplot(all vs imm ~ actual percentage sensitivity) 
  
  negallsensitivity = c(negallData['percentageExpressionPatternRecall'])
  negallrecovery = c(negallData['percentageExpressionPatternPrecision'])
  
  origallsensitivity = c(origallData['percentageExpressionPatternRecall'])
  origallrecovery = c(origallData['percentageExpressionPatternPrecision'])
  
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
                   main = "all Percent Expression Pattern Recall")
  
  #Percent redfly recovery
  
  allrecovery = append(unlist(negallrecovery), unlist(origallrecovery))
  allfinlen <- append(alllineofnegs, alllineoforig)
  
  allrecoveryframe <- data.frame(allfinlen, allrecovery)
  
  
  allrec = boxplot(allrecovery ~ allfinlen, 
                   allrecoveryframe,
                   main = "all Percent Expression Pattern Precision")
  
}
################################################################



negimmsensitivity = c(negimmData['percentageExpressionPatternRecall'])
negimmrecovery = c(negimmData['percentageExpressionPatternPrecision'])

origimmsensitivity = c(origimmData['percentageExpressionPatternRecall'])
origimmrecovery = c(origimmData['percentageExpressionPatternPrecision'])

lenimm <- length(unlist(negimmsensitivity))

immlineofnegs = rep("Negative", lenimm)
immlineoforig = c(rep("Original", lenimm))



###### For imm only ###

#Percentage Training Set sensitiity
immsensitivity = append(unlist(negimmsensitivity), unlist(origimmsensitivity))
immfinlen <- append(immlineofnegs, immlineoforig)

immsensitivityframe <- data.frame(immfinlen, immsensitivity)


immsen = boxplot(immsensitivity ~ immfinlen, 
                 immsensitivityframe,
                 main = "imm Percent Expression Pattern Recall")

#Percent redfly recovery

immrecovery = append(unlist(negimmrecovery), unlist(origimmrecovery))
immfinlen <- append(immlineofnegs, immlineoforig)

immrecoveryframe <- data.frame(immfinlen, immrecovery)


immrec = boxplot(immrecovery ~ immfinlen, 
                 immrecoveryframe,
                 main = "imm Percent Expression Pattern Precision")

















if (all){
  
  #boxrec = boxplot(PercentageRedflyRecovered ~ Method, 
  #              negimmData,
  #              main = "Percent redfly")
  #boxrec
  ##
  
  ###### For all originalk data (percents for each method)###
  
  thing3 = boxplot(PercentageTrainingSetSensitivity ~ Method, 
                   origallData,
                   main = "Original Percent Expression Pattern Recall per method")
  
  
  thing3rec = boxplot(PercentageRedflyRecovered ~ Method, 
                      origallData,
                      main = "Original Percent Expression Pattern Precision per method")
  
  ###### For all negative data (percents for each method)###
  
  thing2 = boxplot(PercentageTrainingSetSensitivity ~ Method, 
                   negallData,
                   main = "Neg Percent Expression Pattern Recall per method")
  
  
  thing2rec = boxplot(PercentageRedflyRecovered ~ Method, 
                      negallData,
                      main = "Neg Percent Expression Pattern Precision per method")
}