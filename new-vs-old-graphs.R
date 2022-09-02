#Compares new and old neg stuffs

oldnegallData <-read.table("neg-old-all_pCRMeval.txt.bed", header=TRUE, sep= "\t")
newnegallData <-read.table("neg-new-all-_pCRMeval.txt.bed", header=TRUE, sep= "\t")

#Creating the list of "original" or "neg" onto one dataframe for easier access
lenall <- length(unlist(oldnegallData['PercentageTrainingSetSensitivity']))

alllineofold = rep("Old", lenall)
oldnegallData$Dset <- alllineofold
alllineofnew = c(rep("New", lenall))
newnegallData$Dset <- alllineofnew

cumalldata <-rbind(oldnegallData, newnegallData)


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
  #stat_compare_means(method = "t.test", aes(label =  ..p.signif..))+
  theme_classic()

#Makes density plot for compare scrmshaw hits
ggplot(cumalldata, aes(x=SCRMs, color=Dset, fill = Dset)) +
  geom_density( alpha = 0.2)+
  geom_vline(data=mu, aes(xintercept=grp.mean, color=Dset),
             linetype="dashed")+
  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
  
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))


ggplot(cumalldata, aes(x = Dset, y = SCRMs, fill = Dset)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("Number of hits from SCRMshaw")+ 
  stat_compare_means(method = "t.test", aes(label =  ..p.signif..))+  geom_signif(
    y_position = c(1000), xmin = c(0.8), xmax = c(2.2),
    annotation = c("**"), tip_length = 0.01) 



#  #Percentage Training Set sensitiity

ggplot(cumalldata, aes(x = Method, y = PercentageTrainingSetSensitivity, fill = Dset)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("All Percent Sensitivity")+ 
  stat_compare_means(method = "t.test", aes(label =  ..p.signif..))+  geom_signif(
    y_position = c(0.92, 1.05, 0.8), xmin = c(0.8, 1.8, 2.8), xmax = c(1.2, 2.2, 3.2),
    annotation = c("**", "*", "NS"), tip_length = 0.01) 

ggplot(cumalldata, aes(x = "", y = PercentageTrainingSetSensitivity, fill = Dset)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("All Percent Sensitivity")+ xlab("Cumulative")+ 
  stat_compare_means(method = "t.test", aes(label =  ..p.signif..))+  geom_signif(
    y_position = c(1.05), xmin = c(0.8), xmax = c(1.2),annotation = c("**"), tip_length = 0.01) 

#Percent redfly recovery

ggplot(cumalldata, aes(x = Method, y = PercentageRedflyRecovered, fill = Dset)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("all Percent Redfly Recovery")+ 
  stat_compare_means(method = "t.test", aes(label =  ..p.signif..))+  geom_signif(
    y_position = c(0.6, 0.52, 0.5), xmin = c(0.8, 1.8, 2.8), xmax = c(1.2, 2.2, 3.2),
    annotation = c("****", "****", "****"), tip_length = 0.01) 


ggplot(cumalldata, aes(x = "", y = PercentageRedflyRecovered, fill = Dset)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("all Percent Redfly Recovery")+ xlab("Cumulative") + 
  stat_compare_means(method = "t.test", aes(label =  ..p.signif..))+  geom_signif(
    y_position = c(0.6), xmin = c(0.8), xmax = c(1.2),annotation = c("****"), tip_length = 0.01) 


#Percent Expression Pattern Recall

ggplot(cumalldata, aes(x = Method, y = percentageExpressionPatternRecall, fill = Dset)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("All Percent Expression Pattern Recall")+ 
  stat_compare_means(method = "t.test", aes(label =  ..p.signif..))+  geom_signif(
    y_position = c(0.155, 0.18, 0.13), xmin = c(0.8, 1.8, 2.8), xmax = c(1.2, 2.2, 3.2),
    annotation = c("NS", "NS", "NS"), tip_length = 0.01) 

ggplot(cumalldata, aes(x = "", y = percentageExpressionPatternRecall, fill = Dset)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("All Percent Expression Pattern Recall")+ xlab("Cumulative")+ 
  stat_compare_means(method = "t.test", aes(label =  ..p.signif..))+  geom_signif(
    y_position = c(0.18), xmin = c(0.8), xmax = c(1.2),annotation = c("NS"), tip_length = 0.01) 

#Percent Expression Pattern Precision
#par(mfrow=c(1,2))
ggplot(cumalldata, aes(x = Method, y = percentageExpressionPatternPrecision, fill = Dset)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("All Percent Expression Pattern Precision")+ 
  stat_compare_means(method = "t.test", aes(label =  ..p.signif..))+  geom_signif(
    y_position = c(0.6, 0.6, 0.5), xmin = c(0.8, 1.8, 2.8), xmax = c(1.2, 2.2, 3.2),
    annotation = c("NS", "NS", "NS"), tip_length = 0.01) 

ggplot(cumalldata, aes(x = "", y = percentageExpressionPatternPrecision, fill = Dset)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("All Percent Expression Pattern Precision") + xlab("Cumulative")+ 
  stat_compare_means(method = "t.test", aes(label =  ..p.signif..))+  geom_signif(
    y_position = c(0.6), xmin = c(0.8), xmax = c(1.2),annotation = c("NS"), tip_length = 0.01) 

#Change line types and point shapes

immalldata <- data.frame()
immalldata <-rbind(cumalldata[1:110,], cumalldata[331:440,])
#colnames(immalldata) <- c(names(cumalldata))
#c <- 0
#for(i in 1:lenall){
#  if(cumalldata[i,]$Method == "imm"){
#    c = c + 1
#    immalldata[c,] <- cumalldata[i,]
#  }
#}

recallplot <- ggplot(immalldata, aes(x=Dset, y=percentageExpressionPatternRecall, group=TsetName))+ geom_line(aes(color=TsetName))

recallplot + scale_color_grey() + theme_classic() + theme(legend.position="none") + ggtitle("Percent Expression Pattern Recall per tset")


precisionplot <- ggplot(immalldata, aes(x=Dset, y=percentageExpressionPatternPrecision, group=TsetName))+ geom_line(aes(color=TsetName))

precisionplot + scale_color_grey() + theme_classic() + theme(legend.position="none") + ggtitle("Percent Expression Pattern Precision per tset")


recoveryplot <- ggplot(immalldata, aes(x=Dset, y=PercentageRedflyRecovered, group=TsetName))+ geom_line(aes(color=TsetName))

recoveryplot + scale_color_grey() + theme_classic() + theme(legend.position="none") + ggtitle("Percent Redfly Recovery per tset")


tset <- newnegallData[1:330,]$TsetName
nam <- "percentageExpressionPatternRecall"

for (a in 1:lenall){
  #for (nam in c("percentageExpressionPatternRecall", "percentageExpressionPatternPrecision", "PercentageRedflyRecovered")){
    b = newnegallData[a,nam]
  #}
}
