library("readxl")
library(ggpubr)
library(ggplot2)

#loads file into environment
alldata <-read_excel("embryodatathing.xlsx")
squisheddata <-read_excel("allinone.xlsx")

library(plyr)
mu <- ddply(alldata, "Type", summarise, grp.mean=mean(scrmshawhits))
head(mu)

#Makes a histogram to compare number of scrmshawhitshaw hits
ggplot(alldata, aes(x=scrmshawhits, color=Type, fill=Type)) +#stat_compare_means(method = "t.test")+
  geom_histogram(position="identity", alpha=0.5)+
  #geom_histogram(aes(y=..density..), position="identity", alpha=0.5)+
  geom_density(alpha=0.2)+
  geom_vline(data=mu, aes(xintercept=grp.mean, color=Type),
             linetype="dashed")+
  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
  labs(title="Comparing Number of Hits Between Negative and Original",x="Number of hits from scrmshawhitshaw", y = "Count")+
  #labs(title="Comparing Number of Hits Between Negative and Original",x="Number of hits from scrmshawhitshaw", y = "Density")+
  #stat_compare_means(method = "t.test", aes(label =  ..p.format..))+
  theme_classic()

#Makes density plot for compare scrmshawhitshaw hits
ggplot(alldata, aes(x=scrmshawhits, color=Type, fill = Type)) +
  geom_density( alpha = 0.2)+
  geom_vline(data=mu, aes(xintercept=grp.mean, color=Type),
             linetype="dashed")+
  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
  
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))


ggplot(alldata, aes(x = Type, y = scrmshawhits, fill = Type)) +
  geom_boxplot() + ggtitle("Number of hits from scrmshaw")+ 
  stat_compare_means(method = "t.test", aes(label =  ..p.format..))+  geom_signif(
    y_position = c(2700), xmin = c(0.8), xmax = c(2.2),
    annotation = c("*"), tip_length = 0.01) 



### Putting all graphs on one thing ###


#Same graph, using T test instead
ggplot(squisheddata, aes(x=Method, y=Value, fill=Type)) + geom_point(position=position_jitterdodge(), size = 0.2) +
  geom_boxplot(alpha = 0.8) + labs(fill = "Type of\nDataset", title="Plot of percentages for different parts",
                                   x ="", y = "Percentage") + theme(axis.text.x = element_text(size = 6)) +  geom_signif(
                                     y_position = c(1.0, 0.05,0.2,0.2), xmin = c(0.8, 1.8, 2.8, 3.8), xmax = c(1.2, 2.2, 3.2, 4.2),
                                     annotation = c("*", "**", "**", "NS"), tip_length = 0
                                   ) +stat_compare_means(method = "t.test",aes(label =  ..p.format..))



### Bar graphs ###

immexp = boxplot(Recall2 ~ Type, 
                 alldata,
                 main = "Percent Recall")

#Percent Expression Pattern Precision

immper = boxplot(Precision ~ Type, 
                 alldata,
                 main = "Percent Precision")



immsens = boxplot(Sensitivity ~ Type, 
                 alldata,
                 main = "Percent Sensitivity")

#Percent Expression Pattern Precision

immrec = boxplot(Recovery ~ Type, 
                 alldata,
                 main = "Percent Recovery")





### Line graphs ###
recallplot <- ggplot(alldata, aes(x=Type, y=Recall2, group=Tset))+ geom_line(aes(color=Tset))

recallplot  + theme_classic() + theme(legend.position="none") + ggtitle("Percent Recall per tset")


precisionplot <- ggplot(alldata, aes(x=Type, y=Precision, group=Tset))+ geom_line(aes(color=Tset))

precisionplot  + theme_classic() + theme(legend.position="none") + ggtitle("Percent Precision per tset")


recoveryplot <- ggplot(alldata, aes(x=Type, y=Recovery, group=Tset))+ geom_line(aes(color=Tset))

recoveryplot  + theme_classic() + theme(legend.position="none") + ggtitle("Percent Recovery per tset")


sensplot <- ggplot(alldata, aes(x=Type, y=Sensitivity, group=Tset))+ geom_line(aes(color=Tset))

sensplot  + theme_classic() + theme(legend.position="none") + ggtitle("Percent Sensitivity per tset")
