library(ggplot2)

#This adds the imm files into the enviornment
negimmData <-read.table("neg_all_imm_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origimmData <- read.table("orig_imm_pCRMeval.txt.bed", header=TRUE, sep = "\t")

negallData <-read.table("neg_all_methods_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origallData <- read.table("orig_allmethods_pCRMeval.txt.bed", header=TRUE, sep = "\t")


#Creating data frames to put the data into one graph

#box = boxplot(x values ~ y values) 
#box = boxplot(all vs imm ~ actual percentage sensitivity) 

negallsensitivity = c(negallData[8])
negallrecovery = c(negallData[14])

origallsensitivity = c(origallData[8])
origallrecovery = c(origallData[14])

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
                 notch = TRUE,
                 main = "all Percent sensitivity")

#Percent redfly recovery

allrecovery = append(unlist(negallrecovery), unlist(origallrecovery))
allfinlen <- append(alllineofnegs, alllineoforig)

allrecoveryframe <- data.frame(allfinlen, allrecovery)


allrec = boxplot(allrecovery ~ allfinlen, 
                 allrecoveryframe,
                 notch = TRUE,
                 main = "all Percent Redfly Recovery")


################################################################



negimmsensitivity = c(negimmData[8])
negimmrecovery = c(negimmData[14])

origimmsensitivity = c(origimmData[8])
origimmrecovery = c(origimmData[14])

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
                 notch = TRUE,
                 main = "imm Percent sensitivity")

#Percent redfly recovery

immrecovery = append(unlist(negimmrecovery), unlist(origimmrecovery))
immfinlen <- append(immlineofnegs, immlineoforig)

immrecoveryframe <- data.frame(immfinlen, immrecovery)


immrec = boxplot(immrecovery ~ immfinlen, 
                 immrecoveryframe,
                 notch = TRUE,
                 main = "imm Percent Redfly Recovery")



















#boxrec = boxplot(PercentageRedflyRecovered ~ Method, 
#              negimmData,
#              notch = TRUE,
#              main = "Percent redfly")
#boxrec
##

###### For all data ###

#thing2 = boxplot(PercentageTrainingSetSensitivity ~ Method, 
#                 negallData,
#                 notch = TRUE,
#                 main = "Percent sensitivity")
#thing2


#thing2rec = boxplot(PercentageRedflyRecovered ~ Method, 
##                 negallData,
  #               notch = TRUE,
#                 main = "Percent redfly")
#thing2rec