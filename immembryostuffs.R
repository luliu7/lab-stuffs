library("readxl")
library(ggpubr)
library(ggplot2)
library(plotly)

#loads file into environment
allimmdata <-read_excel("immall_1-17-23.xlsx")
squishedimmdata <-read_excel("immsmol1-17-23.xlsx")

library(plyr)
#mu <- ddply(allimmdata, "Type", summarise, grp.mean=mean(scrmshawhits))
#head(mu)

#Makes a histogram to compare number of scrmshawhitshaw hits
#ggplot(allimmdata, aes(x=scrmshawhits, color=Type, fill=Type)) +#stat_compare_means(method = "t.test")+
#  geom_histogram(position="identity", alpha=0.5)+
#geom_histogram(aes(y=..density..), position="identity", alpha=0.5)+
#  geom_density(alpha=0.2)+
#  geom_vline(data=mu, aes(xintercept=grp.mean, color=Type),
#             linetype="dashed")+
#  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
#  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))+
#  labs(title="Comparing Number of Hits Between Negative and Original",x="Number of hits from scrmshawhitshaw", y = "Count")+
#labs(title="Comparing Number of Hits Between Negative and Original",x="Number of hits from scrmshawhitshaw", y = "Density")+
#stat_compare_means(method = "t.test", aes(label =  ..p.format..))+
#  theme_classic()

#Makes density plot for compare scrmshawhitshaw hits
#ggplot(allimmdata, aes(x=scrmshawhits, color=Type, fill = Type)) +
#  geom_density( alpha = 0.2)+
#  geom_vline(data=mu, aes(xintercept=grp.mean, color=Type),
#             linetype="dashed")+
#  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"))+

#  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))


#ggplot(allimmdata, aes(x = Type, y = scrmshawhits, fill = Type)) +
#  geom_boxplot() + ggtitle("Number of hits from scrmshaw")+ 
#  stat_compare_means(method = "t.test", aes(label =  ..p.format..))+  geom_signif(
#    y_position = c(2700), xmin = c(0.8), xmax = c(2.2),
#    annotation = c("*"), tip_length = 0.01) 



### Putting all graphs on one thing ###


#Same graph, using T test instead
ggplot(squishedimmdata, aes(x=Method, y=Recovery, fill=Type)) + geom_point(position=position_jitterdodge(), size = 0.2) +
  geom_boxplot(alpha = 0.8) + labs(fill = "Type of\nDataset", title="Plot of percentages for different measures",
                                   x ="", y = "Percentage (%)") + theme(axis.text.x = element_text(size = 6)) +  geom_signif(
                                     y_position = c(90, 7, 7, 75, 60), xmin = c(0.8, 1.8, 2.8, 3.8, 4.8), xmax = c(1.2, 2.2, 3.2, 4.2, 5.2),
                                     annotation = c("NS", "****", "****", "****", "NS"), tip_length = 0
                                   ) + stat_compare_means(method = "t.test",aes(label =  ..p.format..))



### Bar graphs ###
#Recovery
ggplot(allimmdata, aes(x=Type, y=Recovery, fill=Type)) + geom_point(position=position_jitterdodge(), size = 0.2) +
  geom_boxplot(alpha = 0.8) + labs(fill = "Type of\nDataset", title="Recovery Percentage",
                                   x ="", y = "Recovery") + theme(axis.text.x = element_text(size = 6)) +  geom_signif(
                                     y_position = c(80), xmin = c(1), xmax = c(2),
                                     annotation = c("****"), tip_length = 0.05
                                   ) +stat_compare_means(method = "t.test")#, aes(label =  ..p.format..))

#Sensitivity
ggplot(allimmdata, aes(x=Type, y=Sensitivity, fill=Type)) + geom_point(position=position_jitterdodge(), size = 0.2) +
  geom_boxplot(alpha = 0.8) + labs(fill = "Type of\nDataset", title="Sensitivity Percentage",
                                   x ="", y = "Sensitivity") + theme(axis.text.x = element_text(size = 6)) +  geom_signif(
                                     y_position = c(67), xmin = c(1), xmax = c(2),
                                     annotation = c("NS"), tip_length = 0.05
                                   ) +stat_compare_means(method = "t.test")#,aes(label =  ..p.format..))


#Precision
ggplot(allimmdata, aes(x=Type, y=Precision, fill=Type)) + geom_point(position=position_jitterdodge(), size = 0.2) +
  geom_boxplot(alpha = 0.8) + labs(fill = "Type of\nDataset", title="Precision Percentage",
                                   x ="", y = "Precision") + theme(axis.text.x = element_text(size = 6)) +  geom_signif(
                                     y_position = c(97), xmin = c(1), xmax = c(2),
                                     annotation = c("NS"), tip_length = 0.05
                                   ) +stat_compare_means(method = "t.test")#,aes(label =  ..p.signif..))

#Recall1
ggplot(allimmdata, aes(x=Type, y=Recall1, fill=Type)) + geom_point(position=position_jitterdodge(), size = 0.2) +
  geom_boxplot(alpha = 0.8) + labs(fill = "Type of\nDataset", title="Recall1 Percentage",
                                   x ="", y = "Recall1") + theme(axis.text.x = element_text(size = 6)) +  geom_signif(
                                     y_position = c(8), xmin = c(1), xmax = c(2),
                                     annotation = c("****"), tip_length = 0.05
                                   ) +stat_compare_means(method = "t.test")#,aes(label =  ..p.signif..))


#Recall2
ggplot(allimmdata, aes(x=Type, y=Recall2, fill=Type)) + geom_point(position=position_jitterdodge(), size = 0.2) +
  geom_boxplot(alpha = 0.8) + labs(fill = "Type of\nDataset", title="Recall2 Percentage",
                                   x ="", y = "Recall2") + theme(axis.text.x = element_text(size = 6)) +  geom_signif(
                                     y_position = c(7), xmin = c(1), xmax = c(2),
                                     annotation = c("****"), tip_length = 0.05
                                   ) +stat_compare_means(method = "t.test")#,aes(label =  ..p.signif..))




###########################
#Old




immexp = boxplot(Recall2 ~ Type, 
                 allimmdata,
                 main = "Percent Recall")

#Percent Expression Pattern Precision

immper = boxplot(Precision ~ Type, 
                 allimmdata,
                 main = "Percent Precision")



immsens = boxplot(Sensitivity ~ Type, 
                  allimmdata,
                  main = "Percent Sensitivity")

#Percent Expression Pattern Precision

immrec = boxplot(Recovery ~ Type, 
                 allimmdata,
                 main = "Percent Recovery")





### Line graphs ###
recallplot <- ggplot(allimmdata, aes(x=Type, y=Recall2, group=Tset))+ geom_line(aes(color=Tset))
ggplotly(recallplot)
recallplot  + theme_classic() + theme(legend.position="none") + ggtitle("Percent Recall per tset")


precisionplot <- ggplot(allimmdata, aes(x=Type, y=Precision, group=Tset))+ geom_line(aes(color=Tset))
ggplotly(precisionplot)
precisionplot  + theme_classic() + theme(legend.position="none") + ggtitle("Percent Precision per tset")


recoveryplot <- ggplot(allimmdata, aes(x=Type, y=Recovery, group=Tset))+ geom_line(aes(color=Tset))
ggplotly(recoveryplot)
recoveryplot  + theme_classic() + theme(legend.position="none") + ggtitle("Percent Recovery per tset")


sensplot <- ggplot(allimmdata, aes(x=Type, y=Sensitivity, group=Tset))+ geom_line(aes(color=Tset))
ggplotly(sensplot)
sensplot  + theme_classic() + theme(legend.position="none") + ggtitle("Percent Sensitivity per tset")
