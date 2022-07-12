library(ggplot2)

#This adds the imm files into the enviornment
negimmData <-read.table("neg_all_imm_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origimmData <- read.table("orig_imm_pCRMeval.txt.bed", header=TRUE, sep = "\t")

negallData <-read.table("neg_all_methods_pCRMeval.txt.bed", header=TRUE, sep= "\t")
#origallData <- read.table("orig_negallmethods_pCRMeval.txt.bed", header=TRUE, sep = "\t")


#Creating data frames to put the data into one graph

#box = boxplot(x values ~ y values) 
#box = boxplot(all vs imm ~ actual percentage sensitivity) 

negallsensitivity = c(negallData[8])
negallrecovery = c(negallData[14])

origallsensitivity = c(origallData[8])
#origallrecovery = c(origallData[14])


negimmsensitivity = c(negimmData[8])
negimmrecovery = c(negimmData[14])

origimmsensitivity = c(origimmData[8])
#origimmrecovery = c(origimmData[14])

len <- length(unlist(negimmsensitivity))

lineofnegs = rep("Negative", len)
lineoforig = c(rep("Original", len))



sensitivity = append(unlist(negimmsensitivity), unlist(origimmsensitivity))
finlen <- append(lineofnegs, lineoforig)

immsensitivityframe <- data.frame(finlen, sensitivity)

print(immsensitivityframe)
###### For imm only ###

immsen = boxplot(sensitivity ~ finlen, immsensitivityframe)




box = boxplot(PercentageTrainingSetSensitivity ~ Method, 
              negimmData,
              notch = TRUE,
              main = "Percent sensitivity")
box

boxrec = boxplot(PercentageRedflyRecovered ~ Method, 
              negimmData,
              notch = TRUE,
              main = "Percent redfly")
boxrec


###### For all data ###

thing2 = boxplot(PercentageTrainingSetSensitivity ~ Method, 
                 negallData,
                 notch = TRUE,
                 main = "Percent sensitivity")
thing2


thing2rec = boxplot(PercentageRedflyRecovered ~ Method, 
                 negallData,
                 notch = TRUE,
                 main = "Percent redfly")
thing2rec