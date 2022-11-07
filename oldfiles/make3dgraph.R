#Making a 3D graph to show neg to random vs orig to random changes (in how good the tset is)

#Code based off of: (citing sourcesish)
#Basic graph format: https://plotly.com/r/3d-hover/
#Changing hover text: https://stackoverflow.com/questions/65840085/how-to-overwrite-and-edit-the-hover-template-of-a-plotly-3d-object-in-r 

library("readxl")
library(plotly)

#loads file into environment
randcompallData <-read_excel("oldfiles/compwithrandomcomb.xlsx")
randcompnegData <- randcompallData[1:110,]
randcomporigData <- randcompallData[111:220,]


#makes an interactive 3d plot which you can hover and get info on set quality, tset name, and whether it is negative or original
fig <- plot_ly(randcompallData, x = ~PercentageTrainingSetSensitivity, y = ~PercentageRedflyRecovered, z = ~percentageExpressionPatternRecall, 
               hoverinfo = 'text',
               text = ~paste0(setthing, "<br>", type, "<br>", TsetName, "<br>"),
               size = 1, opacity = 0.8, color = ~setthing)#, colors = c('#BF382A', '#0C4B8E')) 
fig <- fig %>%
  add_markers() 
fig <- fig %>%
  layout(
    scene = list(
      xaxis = list(
        spikecolor = '#a009b5',
        spikesides = FALSE,
        spikethickness = 6
      ),
      yaxis = list(
        spikecolor = '#a009b5',
        spikesides = FALSE,
        spikethickness = 6        
      ),
      zaxis = list(
        spikecolor = '#a009b5',
        spikethickness = 6
      )
    )
  )

#Shows the figure
fig




#############
#Discarded code


#install.packages("scatterplot3d")
#install.packages("readxl")
#library(ggplot2)
#library(rgl)
#library(magick)
#library("scatterplot3d")

#colors <- c("#999999", "#E69F00", "#56B4E9")
#colors <- colors[as.numeric(randcompallData$extra)]
#scatterplot3d(randcompallData[,2:4],pch = 1, color = colors,
#              main="Tset ranking",
#              xlab = "Training Set Sensitivity",
#              ylab = "Redfly Recovered",
#              zlab = "Expression Pattern Recall(Specificity)") + transition_time(type)




# Neg chart
#plot3d(randcompnegData[,2:4], col = randcompnegData$extra, type = "s", radius = .01 )


# Orig chart
#plot3d(randcompnegData[,2:4], col = randcomporigData$extra, type = "s", radius = .01 )

