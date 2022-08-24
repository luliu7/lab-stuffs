#Making a 3D graph to show neg to random vs orig to random changes (in how good the tset is)

#install.packages("scatterplot3d")
#install.packages("readxl")
#library(ggplot2)
library(rgl)
library(magick)
library("readxl")
library("scatterplot3d")

#loads file into enviornment
randcompallData <-read_excel("compwithrandomcomb.xlsx")
randcompnegData <- randcompallData[1:110,]
randcomporigData <- randcompallData[111:220,]

colors <- c("#999999", "#E69F00", "#56B4E9")
colors <- colors[as.numeric(randcompallData$extra)]
scatterplot3d(randcompallData[,2:4],pch = 1, color = colors,
              main="Tset ranking",
              xlab = "Training Set Sensitivity",
              ylab = "Redfly Recovered",
              zlab = "Expression Pattern Recall(Specificity)") + transition_time(type)


# Neg chart
plot3d(randcompnegData[,2:4], col = randcompnegData$extra, type = "s", radius = .01 )


# Orig chart
plot3d(randcompnegData[,2:4], col = randcomporigData$extra, type = "s", radius = .01 )
