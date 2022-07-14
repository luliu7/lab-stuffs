library(ggplot2)

#This adds the imm files into the enviornment
negimmData <-read.table("neg_all_imm_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origimmData <- read.table("orig_imm_pCRMeval.txt.bed", header=TRUE, sep = "\t")

negallData <-read.table("neg_all_methods_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origallData <- read.table("orig_allmethods_pCRMeval.txt.bed", header=TRUE, sep = "\t")


########################################
#For redfly recovery

#Making a graph of all methods for each tset (for each method)
thing3rec <- ggplot(data = origallData, aes(x = TsetName, y = PercentageRedflyRecovered, fill = Method)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) #+
  #geom_bar()
thing3rec+ coord_flip()


#Makes a graph for the highest recovery of each method per tset
thing4rec <- ggplot(data = origallData, aes(x = TsetName, y = PercentageRedflyRecovered)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) #Needed position dodge otherwise it just adds everything i think
#geom_bar()
thing4rec+ coord_flip()




##################################
# For sensitivity

#Making a graph of all methods for each tset (for each method)
thing5rec <- ggplot(data = origallData, aes(x = TsetName, y = PercentageTrainingSetSensitivity, fill = Method)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) #+
#geom_bar()
thing5rec+ coord_flip()


#Makes a graph for the highest recovery of each method per tset
thing6rec <- ggplot(data = origallData, aes(x = TsetName, y = PercentageTrainingSetSensitivity)) +
  geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) #Needed position dodge otherwise it just adds everything i think
#geom_bar()
thing6rec+ coord_flip()
