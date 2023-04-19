#Garbage code



#For redfly recovery
##### For orig set #####
if (showmethods) {
  #Making a graph of all methods for each tset (for each method)
  thing3rec <- ggplot(data = origimmData, aes(x = TsetName, y = PercentageRedflyRecovered, fill = Method)) +
    geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) 
  thing3rec+ coord_flip() + labs(title = "Original Imm methods Percent Redfly Recovery") + scale_fill_brewer(palette="Pastel2")
} else {
  #Makes a graph for the highest recovery of each method per tset
  thing4rec <- ggplot(data = origimmData, aes(x = TsetName, y = PercentageRedflyRecovered)) +
    geom_bar(stat = "identity", fill = "#F1BF58", width = 0.5, position = position_dodge(0.6)) #Needed position dodge otherwise it just adds everything i think
  thing4rec+ coord_flip() + labs(title = "Original Imm methods Overall Percent Redfly Recovery")
}

##### For neg set #####
if (showmethods) {
  #Making a graph of all methods for each tset (for each method)
  thing7rec <- ggplot(data = negimmData, aes(x = TsetName, y = PercentageRedflyRecovered, fill = Method)) +
    geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6)) 
  thing7rec+ coord_flip() + labs(title = "Negative Imm methods Percent Redfly Recovery") + scale_fill_brewer(palette="Pastel2")
} else {
  #Makes a graph for the highest recovery of each method per tset
  thing8rec <- ggplot(data = negimmData, aes(x = TsetName, y = PercentageRedflyRecovered)) +
    geom_bar(stat = "identity", fill = "#4CE73E", width = 0.5, position = position_dodge(0.6)) #Needed position dodge otherwise it just adds everything i think
  thing8rec+ coord_flip()+ labs(title = "Negative Imm methods Overall Percent Redfly Recovery")
}


##################################
# For sensitivity

##### For imm set #####
if (showmethods) {
  #Making a graph of all methods for each tset (for each method)
  thing5rec <- ggplot(data = origimmData, aes(x = TsetName, y = PercentageTrainingSetSensitivity, fill = Method)) +
    geom_bar(stat = "identity",width = 0.5, position = position_dodge(0.6))
  thing5rec + coord_flip() + labs(title = "Original Imm methods Percent Sensitivity") + scale_fill_brewer(palette="Pastel1")
} else {
  ##Makes a graph for the highest recovery of each method per tset
  thing6rec <- ggplot(data = origimmData, aes(x = TsetName, y = PercentageTrainingSetSensitivity)) +
    #geom_text(aes(label=PercentageTrainingSetSensitivity), vjust=-0.3, size=1.5)+
    geom_bar(stat = "identity", fill = "#C494EA", width = 0.5, position = position_dodge(0.6)) #Needed position dodge otherwise it just adds everything i think
  thing6rec + coord_flip() + labs(title = "Original Imm methods Overall Percent Sensitivity")
}

##### For neg set #####
if (showmethods) {
  #Making a graph of all methods for each tset (for each method)
  thing9rec <- ggplot(data = negimmData, aes(x = TsetName, y = PercentageTrainingSetSensitivity, fill = Method)) +
    geom_bar(stat = "identity", width = 0.5, position = position_dodge(0.6))
  thing9rec+ coord_flip()+ labs(title = "Negative Imm methods Percent Sensitivity") + scale_fill_brewer(palette="Pastel1")
} else {
  #Makes a graph for the highest recovery of each method per tset
  thing10rec <- ggplot(data = negimmData, aes(x = TsetName, y = PercentageTrainingSetSensitivity)) +
    geom_bar(stat = "identity", fill = "#5DA7F8", width = 0.5, position = position_dodge(0.6)) #Needed position dodge otherwise it just adds everything i think
  thing10rec+ coord_flip()+ labs(title = "Negative Imm methods Overall Percent Sensitivity")
}