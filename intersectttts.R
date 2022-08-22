#intersect, intersectt, intersecttt
#Intersect with redfly results and intersect wit each other results
#Now to analyze

library(ggplot2)
library(ggpubr)

intersectsData <-read.table("orig-all-modified_pCRMevalstuffsss.txt", header=TRUE, sep= "\t")

#Neg and orig intersect, with redfly
#Numerator is number of intersects with each other (and redfly)
#Denominator is Redfly Recovered for the respective orig/neg 
ggplot(intersectsData, aes(x = Method, y = redflypercentoverlap, fill = Dset)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("Neg and orig intersect with redfly")+ stat_compare_means(method = "t.test", aes(label =  ..p.format..))+
  geom_signif(y_position = c(0.62, 0.54, 0.5), xmin = c(0.8, 1.8, 2.8), xmax = c(1.2, 2.2, 3.2), annotation = c("***", "****", "**"), tip_length = 0.01) 

ggplot(intersectsData, aes(x = "", y = redflypercentoverlap, fill = Dset)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("Neg and orig intersect with redfly cumulative")+ stat_compare_means(method = "t.test", aes(label =  ..p.format..))+
  geom_signif(y_position = c(0.62), xmin = c(0.8), xmax = c(1.2), annotation = c("****"), tip_length = 0.01) 




#Neg and orig intersect, with each other only
#Numerator is number of intersects with solely each other
#Denominator is total CRMs discovered
ggplot(intersectsData, aes(x = Method, y = negorigpercentoverlap, fill = Dset)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("Neg and orig intersect only")+ stat_compare_means(method = "t.test", aes(label =  ..p.format..))+
  geom_signif(y_position = c(0.75, 0.75, 0.63), xmin = c(0.8, 1.8, 2.8), xmax = c(1.2, 2.2, 3.2), annotation = c("NS", "NS", "NS"), tip_length = 0.01) 

ggplot(intersectsData, aes(x = "", y = negorigpercentoverlap, fill = Dset)) +
  geom_boxplot()+ geom_point(position=position_jitterdodge(), color = "black", size = 0.3) + ggtitle("Neg and orig intersect only cumulative")+ stat_compare_means(method = "t.test", aes(label =  ..p.format..))+
  geom_signif(y_position = c(0.75), xmin = c(0.8), xmax = c(1.2), annotation = c("NS"), tip_length = 0.01) 
