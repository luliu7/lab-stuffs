#All plots on one plot... 


library(ggpubr)
library(ggplot2)
###This program creates a simple box and whisker plot of negative and original for percent sensitivity and redfly recovery (for all methods together, imm only, and for each individual method) 

#This adds the imm files into the enviornment
negimmData <-read.table("neg_imm_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origimmData <- read.table("orig-imm-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")
all = TRUE

if (all){
negallData <-read.table("neg_all_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origallData <- read.table("orig-all-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")

#par(mfrow=c(1,4)) #puts 4 graphs on same thingy


  
  #Creating the list of "original" or "neg" onto one dataframe for easier access
  lenall <- length(unlist(negallData['PercentageTrainingSetSensitivity']))
  
  alllineofnegs = rep("Negative", lenall)
  negallData$Dset <- alllineofnegs
  alllineoforig = c(rep("Original", lenall))
  origallData$Dset <- alllineoforig
  
  cumalldata <-rbind(origallData, negallData)
  
  
  ###### For all methods only ###
  
  library(plyr)
  mu <- ddply(cumalldata, "Dset", summarise, grp.mean=mean(SCRMs))
  head(mu)
  
  #Makes a histogram to compare number of scrmshaw hits
  ggplot(cumalldata, aes(x=SCRMs, color=Dset, fill=Dset)) +stat_compare_means(method = "t.test")+
    geom_histogram(position="identity", alpha=0.5)+
    #geom_histogram(aes(y=..density..), position="identity", alpha=0.5)+
    geom_density(alpha=0.2)+
    geom_vline(data=mu, aes(xintercept=grp.mean, color=Dset),
               linetype="dashed")+
    scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
    scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
    labs(title="Comparing Number of Hits Between Negative and Original",x="Number of hits from SCRMshaw", y = "Count")+
    #labs(title="Comparing Number of Hits Between Negative and Original",x="Number of hits from SCRMshaw", y = "Density")+
    #stat_compare_means(method = "t.test", aes(label =  ..p.format..))+
    theme_classic()
  
  #Makes density plot for compare scrmshaw hits
  ggplot(cumalldata, aes(x=SCRMs, color=Dset, fill = Dset)) +
    geom_density( alpha = 0.2)+
    geom_vline(data=mu, aes(xintercept=grp.mean, color=Dset),
               linetype="dashed")+
    scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
    
    scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))
    
  
  ggplot(cumalldata, aes(x = Dset, y = SCRMs, fill = Dset)) +
    geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("Number of hits from SCRMshaw")+ stat_compare_means(method = "t.test", aes(label =  ..p.format..))+  geom_signif(
      y_position = c(1200), xmin = c(0.8), xmax = c(2.2),
      annotation = c("**"), tip_length = 0.01) 
  
  
  
#  #Percentage Training Set sensitiity
  
  ggplot(cumalldata, aes(x = Method, y = PercentageTrainingSetSensitivity, fill = Dset)) +
    geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("All Percent Sensitivity")+ stat_compare_means(method = "t.test", aes(label =  ..p.format..))+  geom_signif(
      y_position = c(0.92, 1.05, 0.8), xmin = c(0.8, 1.8, 2.8), xmax = c(1.2, 2.2, 3.2),
      annotation = c("***", "*", "NS"), tip_length = 0.01) 

  ggplot(cumalldata, aes(x = "", y = PercentageTrainingSetSensitivity, fill = Dset)) +
    geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("All Percent Sensitivity")+ xlab("Cumulative")+ stat_compare_means(method = "t.test", aes(label =  ..p.format..))+  geom_signif(
      y_position = c(1.05), xmin = c(0.8), xmax = c(1.2),annotation = c("***"), tip_length = 0.01) 
  
  #Percent redfly recovery
  
  ggplot(cumalldata, aes(x = Method, y = PercentageRedflyRecovered, fill = Dset)) +
    geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("all Percent Redfly Recovery")+ stat_compare_means(method = "t.test", aes(label =  ..p.format..))+  geom_signif(
      y_position = c(0.6, 0.52, 0.5), xmin = c(0.8, 1.8, 2.8), xmax = c(1.2, 2.2, 3.2),
      annotation = c("****", "****", "****"), tip_length = 0.01) 
  
  
  ggplot(cumalldata, aes(x = "", y = PercentageRedflyRecovered, fill = Dset)) +
    geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("all Percent Redfly Recovery")+ xlab("Cumulative") + stat_compare_means(method = "t.test", aes(label =  ..p.format..))+  geom_signif(
      y_position = c(0.6), xmin = c(0.8), xmax = c(1.2),annotation = c("****"), tip_length = 0.01) 
  
  
  #Percent Expression Pattern Recall
  
  ggplot(cumalldata, aes(x = Method, y = percentageExpressionPatternRecall, fill = Dset)) +
    geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("All Percent Expression Pattern Recall")+ stat_compare_means(method = "t.test", aes(label =  ..p.format..))+  geom_signif(
      y_position = c(0.155, 0.18, 0.13), xmin = c(0.8, 1.8, 2.8), xmax = c(1.2, 2.2, 3.2),
      annotation = c("NS", "*", "NS"), tip_length = 0.01) 
  
  ggplot(cumalldata, aes(x = "", y = percentageExpressionPatternRecall, fill = Dset)) +
    geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("All Percent Expression Pattern Recall")+ xlab("Cumulative")+ stat_compare_means(method = "t.test", aes(label =  ..p.format..))+  geom_signif(
      y_position = c(0.18), xmin = c(0.8), xmax = c(1.2),annotation = c("NS"), tip_length = 0.01) 
  
  #Percent Expression Pattern Precision
  #par(mfrow=c(1,2))
  ggplot(cumalldata, aes(x = Method, y = percentageExpressionPatternPrecision, fill = Dset)) +
    geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("All Percent Expression Pattern Precision")+ stat_compare_means(method = "t.test", aes(label =  ..p.format..))+  geom_signif(
      y_position = c(0.6, 0.6, 0.5), xmin = c(0.8, 1.8, 2.8), xmax = c(1.2, 2.2, 3.2),
      annotation = c("NS", "NS", "NS"), tip_length = 0.01) 
  
  ggplot(cumalldata, aes(x = "", y = percentageExpressionPatternPrecision, fill = Dset)) +
    geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("All Percent Expression Pattern Precision") + xlab("Cumulative")+ stat_compare_means(method = "t.test", aes(label =  ..p.format..))+  geom_signif(
      y_position = c(0.6), xmin = c(0.8), xmax = c(1.2),annotation = c("*"), tip_length = 0.01) 
  
  
  
  
 #   par(mfrow=c(1,4)) #puts 4 graphs on same thingy
#    boxplot(percentageExpressionPatternRecall ~ Dset, 
#            cumalldata,
#            main = "all Percent Expression Pattern Recall")
#    boxplot(percentageExpressionPatternPrecision ~ Dset, 
#            cumalldata,
#            main = "all Percent Expression Pattern Precision")
  #  boxplot(PercentageTrainingSetSensitivity ~ Dset, 
  #          cumalldata,
  #          main = "all Percent sensitivity")
  #  boxplot(PercentageRedflyRecovered ~ Dset, 
  #            cumalldata,
  #          main = "all Percent Redfly Recovery")
  

################################################################


#Creating the list of "original" or "neg" onto one dataframe for easier access
#lenimm <- length(unlist(negimmData['PercentageTrainingSetSensitivity']))

#immlineofnegs = rep("Negative", lenimm)
#negimmData$Dset <- immlineofnegs
#immlineoforig = c(rep("Original", lenimm))
#origimmData$Dset <- immlineoforig

#cumimmdata <-rbind(origimmData, negimmData)

#dataB <- dataA[, c("P1", "xyz", "acdc")]


###### For imm only ###

#Percentage Training Set sensitiity

#immsen = boxplot(PercentageTrainingSetSensitivity ~ Dset, 
#                 cumimmdata,
#                 main = "imm Percent sensitivity")


#Percent redfly recovery

#immrec = boxplot(PercentageRedflyRecovered ~ Dset, 
#                 cumimmdata,
#                 main = "imm Percent Redfly Recovery")


#Percent Expression Pattern Recall
#immexp = boxplot(percentageExpressionPatternRecall ~ Dset, 
#                 cumimmdata,
#                 main = "imm Percent Expression Pattern Recall")

#Percent Expression Pattern Precision

#immper = boxplot(percentageExpressionPatternPrecision ~ Dset, 
#                 cumimmdata,
#                 main = "imm Percent Expression Pattern Precision")





#par(mfrow=c(1,4)) #puts 4 graphs on same thingy
#boxplot(percentageExpressionPatternRecall ~ Dset, 
#        cumimmdata,
#        main = "imm Percent Expression Pattern Recall")
#boxplot(percentageExpressionPatternPrecision ~ Dset, 
#        cumimmdata,
#        main = "imm Percent Expression Pattern Precision")
#boxplot(PercentageTrainingSetSensitivity ~ Dset, 
#        cumimmdata,
#        main = "imm Percent sensitivity")
#boxplot(PercentageRedflyRecovered ~ Dset, 
#        cumimmdata,
#        main = "imm Percent Redfly Recovery")


#par(mfrow=c(1,1))
}

negallData <-read.table("neg_all_modified_pCRMeval.txt.bed", header=TRUE, sep= "\t")
origallData <- read.table("orig-all-modified_pCRMeval.txt.bed", header=TRUE, sep = "\t")

#Creating the list of "original" or "neg" onto one dataframe for easier access
lenall <- length(unlist(negallData['PercentageTrainingSetSensitivity']))

alllineofnegs = rep("Negative", lenall)
negallData$Dset <- alllineofnegs
alllineoforig = c(rep("Original", lenall))
origallData$Dset <- alllineoforig

cumalldata <-rbind(origallData, negallData)

  
  

#Creating the list of headers: "percentageExpressionPatternRecall", "percentageExpressionPatternPrecision", "PercentageTrainingSetSensitivity", "PercentageRedflyRecovered" onto one dataframe for easier access

lineoftsests <- c(rep(cumalldata$TsetName, 4))

newcumalldata <- data.frame(TsetName = lineoftsests)

newalllineofrecall = rep("percentageExpressionPatternRecall", lenall * 2)
newname <- c(newalllineofrecall)
newstuffs <- c(cumalldata$percentageExpressionPatternRecall)
dsetline <- c(cumalldata$Dset)

newalllineofprecision = c(rep("percentageExpressionPatternPrecision", lenall * 2))
newname <- c(newname, newalllineofprecision)
newstuffs <- c(newstuffs, cumalldata$percentageExpressionPatternPrecision)
dsetline <- c(dsetline, cumalldata$Dset)

newalllineofsens = c(rep("PercentageTrainingSetSensitivity", lenall * 2))
newname <- c(newname,newalllineofsens)
newstuffs <- c(newstuffs, cumalldata$PercentageTrainingSetSensitivity)
dsetline <- c(dsetline, cumalldata$Dset)

newalllineofrec = c(rep("PercentageRedflyRecovered", lenall * 2))
newname <- c(newname,newalllineofrec)
newstuffs <- c(newstuffs, cumalldata$PercentageRedflyRecovered)
dsetline <- c(dsetline, cumalldata$Dset)

newcumalldata$names <- newname
newcumalldata$stuffs <- newstuffs
newcumalldata$Dset <- dsetline
#newcumalldata <-rbind(cumallData, negallData)



#Same graph, using T test instead
ggplot(newcumalldata, aes(x=names, y=stuffs, fill=Dset)) + geom_point(position=position_jitterdodge(), size = 0.2) +
  geom_boxplot(alpha = 0.8) + labs(fill = "Type of\nDataset", title="Plot of percentages for different parts",
                                   x ="", y = "Percentage") + theme(axis.text.x = element_text(size = 6)) +  geom_signif(
                                     y_position = c(0.6, 0.2,0.6,1.05), xmin = c(0.8, 1.8, 2.8, 3.8), xmax = c(1.2, 2.2, 3.2, 4.2),
                                     annotation = c("**", "NS", "****", "***"), tip_length = 0
                                   ) +stat_compare_means(method = "t.test",aes(label =  ..p.format..))

#Shrinking the dset to 220 units (average of all three methods)
#for(x in negallData$TsetName)
#dataframe <- data.frame(negimmData$TsetName)


# Change line types and point shapes
recallplot <- ggplot(cumalldata, aes(x=Dset, y=percentageExpressionPatternRecall, group=TsetName))+ geom_line(aes(color=TsetName))

recallplot + scale_color_grey() + theme_classic() + theme(legend.position="none") + ggtitle("Percent Expression Pattern Recall per tset")


precisionplot <- ggplot(cumalldata, aes(x=Dset, y=percentageExpressionPatternPrecision, group=TsetName))+ geom_line(aes(color=TsetName))

precisionplot + scale_color_grey() + theme_classic() + theme(legend.position="none") + ggtitle("Percent Expression Pattern Precision per tset")


recoveryplot <- ggplot(cumalldata, aes(x=Dset, y=PercentageRedflyRecovered, group=TsetName))+ geom_line(aes(color=TsetName))

recoveryplot + scale_color_grey() + theme_classic() + theme(legend.position="none") + ggtitle("Percent Redfly Recovery per tset")



# Sensitivity plot for imm only
negses <- c(unlist(negimmData['PercentageTrainingSetSensitivity']))
origses <- c(unlist(origimmData['PercentageTrainingSetSensitivity']))
tsetlis <- c(unlist(origimmData['TsetName']))

ts <- c(rep(tsetlis, 2))
listses <- c(negses,origses)

alllineofnegs = c(rep("Negative", length(tsetlis)))
alllineoforig = c(rep("Original", length(tsetlis)))

listlin <- c(alllineofnegs,alllineoforig)

df <- data.frame(listses, listlin,ts)
senssplot <- ggplot(df, aes(x=listlin, y=listses, group=ts))+ geom_line(aes(color=ts))

senssplot + theme_minimal() + theme(legend.position="none") + ggtitle("Percent Training Set Sensitivity per tset")



sensplot <- ggplot(cumalldata, aes(x=Dset, y=PercentageTrainingSetSensitivity, group=TsetName))+ geom_line(aes(color=TsetName))

sensplot + scale_color_grey() + theme_classic() + theme(legend.position="none") + ggtitle("Percent Training Set Sensitivity per tset")

#sensss <- lines(cumalldata$TsetName, cumalldata$PercentageTrainingSetSensitivity, type='l') 
#ggplot(cumalldata, aes(x=Dset, y=PercentageTrainingSetSensitivity, group=TsetName, color=TsetName)) +
#  geom_line()
