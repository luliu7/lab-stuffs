#After intersecting with validated data, figure out counts

library(ggpubr)
library(ggplot2)

#Negative back, with new set
neg_new_other_pos <-read.table("neg-new-posnonspecific.bed", header=FALSE, sep= "\t")
neg_new_true_pos <-read.table("neg-new-truepos.bed", header=FALSE, sep= "\t")
neg_new_true_neg <-read.table("neg-new-trueneg.bed", header=FALSE, sep= "\t")

#Orig back, with new set
orig_new_other_pos <-read.table("orig-new-posnonspecific.bed", header=FALSE, sep= "\t")
orig_new_true_pos <-read.table("orig-new-truepos.bed", header=FALSE, sep= "\t")
orig_new_true_neg <-read.table("orig-new-trueneg.bed", header=FALSE, sep= "\t")

#Negative back, original set
neg_old_other_pos <-read.table("neg-old-posnonspecific.bed", header=FALSE, sep= "\t")
neg_old_true_pos <-read.table("neg-old-truepos.bed", header=FALSE, sep= "\t")
neg_old_true_neg <-read.table("neg-old-trueneg.bed", header=FALSE, sep= "\t")

#Orig back, original set
orig_old_other_pos <-read.table("orig-old-posnonspecific.bed", header=FALSE, sep= "\t")
orig_old_true_pos <-read.table("orig-old-truepos.bed", header=FALSE, sep= "\t")
orig_old_true_neg <-read.table("orig-old-trueneg.bed", header=FALSE, sep= "\t")



#Nonspecific for added new set
nonspecific_pos_new <- c(length(neg_new_other_pos$V1),length(orig_new_other_pos$V1))
dset <- c("Negative", "Original")
df <- data.frame(nonspecific_pos_new, dset)
a<-ggplot(data=df, aes(x = dset, y=nonspecific_pos_new))+ 
  geom_bar(stat="identity")+
  labs(title="Plot of nonspecific found for added new set",
       x="", y = "Number of intersections with validated")+
  geom_text(aes(label=nonspecific_pos_new), vjust=1.6, color="white", size=3.5)+
  theme_minimal()


#Nonspecific for original old set (no new tset)
nonspecific_pos_old <- c(length(neg_old_other_pos$V1),length(orig_old_other_pos$V1))
dset <- c("Negative", "Original")
df <- data.frame(nonspecific_pos_old, dset)
b<-ggplot(data=df, aes(x = dset, y=nonspecific_pos_old))+ 
  geom_bar(stat="identity")+
  labs(title="Plot of nonspecific found for original sets",
       x="", y = "Number of intersections with validated")+
  geom_text(aes(label=nonspecific_pos_old), vjust=1.3, color="white", size=3.5)+
  theme_minimal()

ggarrange(a,b, ncol = 2, nrow = 1)



##########################


#true negative for added new set
neg_true_new <- c(length(neg_new_true_neg$V1),length(orig_new_true_neg$V1))
dset <- c("Negative", "Original")
df <- data.frame(neg_true_new, dset)
c<-ggplot(data=df, aes(x = dset, y=neg_true_new))+ 
  geom_bar(stat="identity")+
  labs(title="Plot of true negative found for added new set",
       x="", y = "Number of intersections with validated")+
  geom_text(aes(label=neg_true_new), vjust=1.6, color="white", size=3.5)+
  theme_minimal()


#true negative for original old set (no new tset)
neg_true_old <- c(length(neg_old_true_neg$V1),length(orig_old_true_neg$V1))
dset <- c("Negative", "Original")
df <- data.frame(neg_true_old, dset)
d<-ggplot(data=df, aes(x = dset, y=neg_true_old))+ 
  geom_bar(stat="identity")+
  labs(title="Plot of true negative found for original sets",
       x="", y = "Number of intersections with validated")+
  geom_text(aes(label=neg_true_old), vjust=1.3, color="white", size=3.5)+
  theme_minimal()

ggarrange(c,d, ncol = 2, nrow = 1)


##########################


#true positive for added new set
neg_true_pos_new <- c(length(neg_new_true_pos$V1),length(orig_new_true_pos$V1))
dset <- c("Negative", "Original")
df <- data.frame(neg_true_pos_new, dset)
c<-ggplot(data=df, aes(x = dset, y=neg_true_pos_new))+ 
  geom_bar(stat="identity")+
  labs(title="Plot of true positives found for added new set",
       x="", y = "Number of intersections with validated")+
  geom_text(aes(label=neg_true_pos_new), vjust=1.6, color="white", size=3.5)+
  theme_minimal()


#true positives for original old set (no new tset)
neg_true_pos_old <- c(length(neg_old_true_pos$V1),length(orig_old_true_pos$V1))
dset <- c("Negative", "Original")
df <- data.frame(neg_true_pos_old, dset)
d<-ggplot(data=df, aes(x = dset, y=neg_true_pos_old))+ 
  geom_bar(stat="identity")+
  labs(title="Plot of true Positives found for original sets",
       x="", y = "Number of intersections with validated")+
  geom_text(aes(label=neg_true_pos_old), vjust=1.3, color="white", size=3.5)+
  theme_minimal()

ggarrange(c,d, ncol = 2, nrow = 1)
