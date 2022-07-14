library(ggplot2)

#Makes a truth value here so I won't have to keep uncommenting things (`^`#)
showmethods = FALSE

#This adds the imm files into the enviornment
negimmData <-read.table("neg_all_imm_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origimmData <- read.table("orig_imm_pCRMeval.txt.bed", header=TRUE, sep = "\t")

negallData <-read.table("neg_all_methods_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origallData <- read.table("orig_allmethods_pCRMeval.txt.bed", header=TRUE, sep = "\t")


########################################
#For redfly recovery

##### For original set #####
if (showmethods) {
#Making a graph of all methods for each tset (for each method)
  thing3rec <- ggplot(data = origallData, aes(x = TsetName, y = PercentageRedflyRecovered, fill = Method)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) 
  thing3rec+ coord_flip() + labs(title = "Original All methods Percent Redfly Recovery")
} else {
  #Makes a graph for the highest recovery of each method per tset
  thing4rec <- ggplot(data = origallData, aes(x = TsetName, y = PercentageRedflyRecovered)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) #Needed position dodge otherwise it just adds everything i think
  thing4rec+ coord_flip() + labs(title = "Original All methods Percent Redfly Recovery")
}

##### For neg set #####
if (showmethods) {
#Making a graph of all methods for each tset (for each method)
thing7rec <- ggplot(data = negallData, aes(x = TsetName, y = PercentageRedflyRecovered, fill = Method)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) 
thing7rec+ coord_flip() + labs(title = "Negative All methods Percent Redfly Recovery")
} else {
#Makes a graph for the highest recovery of each method per tset
thing8rec <- ggplot(data = negallData, aes(x = TsetName, y = PercentageRedflyRecovered)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) #Needed position dodge otherwise it just adds everything i think
thing8rec+ coord_flip()+ labs(title = "Negative All methods Percent Redfly Recovery")
}


##################################
# For sensitivity

##### For original set #####
if (showmethods) {
#Making a graph of all methods for each tset (for each method)
thing5rec <- ggplot(data = origallData, aes(x = TsetName, y = PercentageTrainingSetSensitivity, fill = Method)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6))
thing5rec+ coord_flip()+ labs(title = "Original All methods Percent Sensitivity")
} else {
##Makes a graph for the highest recovery of each method per tset
thing6rec <- ggplot(data = origallData, aes(x = TsetName, y = PercentageTrainingSetSensitivity)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) #Needed position dodge otherwise it just adds everything i think
thing6rec+ coord_flip()+ labs(title = "Original All methods Percent Sensitivity")
}

##### For neg set #####
if (showmethods) {
#Making a graph of all methods for each tset (for each method)
thing9rec <- ggplot(data = negallData, aes(x = TsetName, y = PercentageTrainingSetSensitivity, fill = Method)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6))
thing9rec+ coord_flip()+ labs(title = "Negative All methods Percent Sensitivity")
} else {
#Makes a graph for the highest recovery of each method per tset
thing10rec <- ggplot(data = negallData, aes(x = TsetName, y = PercentageTrainingSetSensitivity)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) #Needed position dodge otherwise it just adds everything i think
thing10rec+ coord_flip()+ labs(title = "Negative All methods Percent Sensitivity")
}