
library(ggplot2)
library(ggpubr)

###This program creates a simple box and whisker plot of negative and original for percent sensitivity and redfly recovery (for all methods together, imm only, and for each individual method) 

#x <- read.table("clipboard", sep="\t", row.names=TRUE)

#This adds the imm files into the enviornment
#negimmData <-read.table("neg_imm_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
#origimmData <- read.table("orig-imm-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")


negallData <-read.table("neg_all_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origallData <- read.table("orig-all-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")
lenall <- length(unlist(negallData['PercentageTrainingSetSensitivity']))

alllineofnegs = rep("Negative", lenall)
negallData$Dset <- alllineofnegs
alllineoforig = c(rep("Original", lenall))
origallData$Dset <- alllineoforig

cumalldata <-rbind(origallData, negallData)


#immalldata <-cumalldata[(lenall/3*5 + 1):(lenall/3*6),]

#Creates the individual methods for line plot so R doesn't crash on me and give me bogus graphs
immalldata <-rbind(cumalldata[1:(lenall/3),], cumalldata[(lenall + 1):(lenall/3*4),])
hexalldata <-rbind(cumalldata[(lenall/3 + 1):(lenall/3*2),], cumalldata[(lenall/3*4 + 1):(lenall/3*5),])
pacalldata <-rbind(cumalldata[(lenall/3*2 + 1):(lenall/3*3),], cumalldata[(lenall/3*5 + 1):(lenall/3*6),])


#####Below line has boxplot with lineplot
#ggpaired(immalldata, x = "Dset", y = "PercentageRedflyRecovered", color = "Dset")+stat_compare_means(paired = TRUE)


#Sensitivity
#imm
sensimmsplot <- ggplot(immalldata, aes(x=Dset, y=PercentageTrainingSetSensitivity, group=TsetName))+ geom_line(aes(color=TsetName))

sensimmsplot + theme_minimal() + theme(legend.position="none") + ggtitle("Percent Training Set Sensitivity per tset for imm")

#Hex
senshexsplot <- ggplot(hexalldata, aes(x=Dset, y=PercentageTrainingSetSensitivity, group=TsetName))+ geom_line(aes(color=TsetName))

senshexsplot + theme_minimal() + theme(legend.position="none") + ggtitle("Percent Training Set Sensitivity per tset for hexmcd")

#pac
senspacsplot <- ggplot(pacalldata, aes(x=Dset, y=PercentageTrainingSetSensitivity, group=TsetName))+ geom_line(aes(color=TsetName))

senspacsplot + theme_minimal() + theme(legend.position="none") + ggtitle("Percent Training Set Sensitivity per tset for pac")

ggarrange(sensimmsplot+ theme(legend.position="none"),senshexsplot+ theme(legend.position="none"),senspacsplot+ theme(legend.position="none"), labels = c("Imm", "Hexmcd", "Pac"), ncol = 3, nrow = 1)



#Redfly Recovery
#imm
rrimmplot <- ggplot(immalldata, aes(x=Dset, y=PercentageRedflyRecovered, group=TsetName))+ geom_line(aes(color=TsetName))

rrimmplot + theme_minimal() + theme(legend.position="none") + ggtitle("Percent Redfly Recovery per tset for imm")

#Hex
rrhexplot <- ggplot(hexalldata, aes(x=Dset, y=PercentageRedflyRecovered, group=TsetName))+ geom_line(aes(color=TsetName))

rrhexplot + theme_minimal() + theme(legend.position="none") + ggtitle("Percent Redfly Recovery per tset for hexmcd")

#pac
rrpacplot <- ggplot(pacalldata, aes(x=Dset, y=PercentageRedflyRecovered, group=TsetName))+ geom_line(aes(color=TsetName))

rrpacplot + theme_minimal() + theme(legend.position="none") + ggtitle("Percent Redfly Recovery per tset for pac")
ggarrange(rrimmplot+ theme(legend.position="none"),rrhexplot+ theme(legend.position="none"),rrpacplot+ theme(legend.position="none"), labels = c("Imm", "Hexmcd", "Pac"), ncol = 3, nrow = 1)


#Expression Pattern Precision
#imm
preimmplot <- ggplot(immalldata, aes(x=Dset, y=ExpectedpercentageExpressionPatternPrecision, group=TsetName))+ geom_line(aes(color=TsetName))

preimmplot + theme_minimal() + theme(legend.position="none") + ggtitle("Percent Expression Pattern Precision per tset for imm")

#Hex
prehexplot <- ggplot(hexalldata, aes(x=Dset, y=ExpectedpercentageExpressionPatternPrecision, group=TsetName))+ geom_line(aes(color=TsetName))

prehexplot + theme_minimal() + theme(legend.position="none") + ggtitle("Percent Expression Pattern Precision per tset for hexmcd")

#pac
prepacplot <- ggplot(pacalldata, aes(x=Dset, y=ExpectedpercentageExpressionPatternPrecision, group=TsetName))+ geom_line(aes(color=TsetName))

prepacplot + theme_minimal() + theme(legend.position="none") + ggtitle("Percent Expression Pattern Precision per tset for pac")
ggarrange(preimmplot+ theme(legend.position="none"),prehexplot+ theme(legend.position="none"),prepacplot+ theme(legend.position="none"), labels = c("Imm", "Hexmcd", "Pac"), ncol = 3, nrow = 1)



#Recall
#imm
recimmplot <- ggplot(immalldata, aes(x=Dset, y=percentageExpressionPatternRecall, group=TsetName))+ geom_line(aes(color=TsetName))

recimmplot + theme_minimal() + theme(legend.position="none") + ggtitle("Percent Training Set Recall per tset for imm")

#Hex
rechexplot <- ggplot(hexalldata, aes(x=Dset, y=percentageExpressionPatternRecall, group=TsetName))+ geom_line(aes(color=TsetName))

rechexplot + theme_minimal() + theme(legend.position="none") + ggtitle("Percent Training Set Recall per tset for hexmcd")

#pac
recpacplot <- ggplot(pacalldata, aes(x=Dset, y=percentageExpressionPatternRecall, group=TsetName))+ geom_line(aes(color=TsetName))

recpacplot + theme_minimal() + theme(legend.position="none") + ggtitle("Percent Training Set Recall per tset for pac")
ggarrange(recimmplot+ theme(legend.position="none"),rechexplot+ theme(legend.position="none"),recpacplot+ theme(legend.position="none"), labels = c("Imm", "Hexmcd", "Pac"), ncol = 3, nrow = 1)

