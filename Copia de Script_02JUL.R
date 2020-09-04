##Library import
library(readr)
library(superheat)
library(ggplot2)
library(cluster)
library(tidyselect)
library(dplyr)
library(tibble)

##File import and preparation #if imported manually
DSS <- read_csv("MatchDS_21JUN.csv",  stringsAsFactors=FALSE)
#DSS <- as.data.frame(DSS) 
#row.names(DSS) <- DSS$Name
#DSS <- DSS[,-1] #remove first column
DSSm <- as.matrix(DSS)

PDS <- read_csv("PerturbationDS_30JUN.csv", header=FALSE, row.names=NULL)
PDSm <- as.matrix(PDS)

##Heatmap with missing values
superheat(DSSm, scale = FALSE, heat.na.col = "black",
          heat.pal= c("black", "deeppink4", "lightgreen"))

##Dendograms
superheat(DSSm, scale = FALSE, heat.na.col = "black",
          col.dendrogram = TRUE)

#Generating clusters {not added}
set.seed(2)
superheat(DSSm, scale = FALSE, heat.na.col = "black",
          pretty.order.rows = TRUE,
          n.clusters.rows = 3,
          left.label = 'variable')

##Titles
superheat(DSSm, scale = FALSE, heat.na.col = "black",
          title = "Expression of macrophage markers in different conditions",
          title.size = 5, title.aligment = "center")

#Row and column titles
superheat(DSSm, scale = FALSE, heat.na.col = "black",
          title = "Expression of macrophage markers in different conditions",
          title.size = 5, title.aligment = "center",
          row.title = "Condition", row.title.size = 4,
          column.title = "Marker", column.title.size = 4)

##Adding text 
superheat(X = DSSm, scale = FALSE, heat.na.col = "black",
          title = "Expression of macrophage markers in different conditions",
          title.size = 5,
          row.title = "Condition", row.title.size = 4,
          column.title = "Marker", column.title.size = 4,
          X.text = round(PDSm,1), X.text.size = 2) #here I get the error
        
##Labels
superheat(DSSm, scale = FALSE, heat.na.col = "black",
          title = "Expression of macrophage markers in different conditions",
          title.size = 5, title.alignment = "center",
          row.title = "Condition", row.title.size = 4,
          column.title = "Marker", column.title.size = 4,
          force.bottom.label = TRUE, force.left.label = TRUE,
          bottom.label.size = 0.2, left.label.size = 0.2,
          bottom.label.text.size = 3, left.label.text.size = 3,
          bottom.label.text.alignment = "center",
          bottom.label.text.angle = 90, bottom.label.col = "white",
          left.label.text.alignment = "left", left.label.col = "white")

##Grids
superheat(DSSm, scale = FALSE, heat.na.col = "black",
          title = "Expression of macrophage markers in different conditions",
          title.size = 5, title.alignment = "center",
          row.title = "Condition", row.title.size = 4,
          column.title = "Marker", column.title.size = 4,
          force.bottom.label = TRUE, force.left.label = TRUE,
          bottom.label.size = 0.2, left.label.size = 0.2,
          bottom.label.text.size = 3, left.label.text.size = 3,
          bottom.label.text.alignment = "center",
          bottom.label.text.angle = 90, bottom.label.col = "white",
          left.label.text.alignment = "left", left.label.col = "white",
          grid.hline.col = "black", grid.vline.col = "black")

##Legend
superheat(DSSm, scale = FALSE, X.text = round(PDSm,1), X.text.size = 2,
          heat.pal= c("coral1", "lightgreen"),
          title = "Expression of macrophage markers in different conditions",
          title.size = 5,
          heat.na.col = "black",
          heat.lim = c(0,1),
          row.title = "Condition", row.title.size = 4,
          column.title = "Marker", column.title.size = 4,
          force.bottom.label = TRUE, force.left.label = TRUE,
          bottom.label.size = 0.2, left.label.size = 0.2,
          bottom.label.text.size = 3, left.label.text.size = 3,
          bottom.label.text.alignment = "center",
          bottom.label.text.angle = 90, bottom.label.col = "white",
          left.label.text.alignment = "left", left.label.col = "white",
          grid.hline.col = "black", grid.vline.col = "black",
          legend = FALSE)

# Create png file in your directory
png("superheat_21JUN_perturbations.png", height = 500, width = 900)

# Save the plot in the image created
superheat(DSSm, scale = FALSE, heat.na.col = "black",
          title = "Expression of macrophage markers in different conditions",
          title.size = 5, title.alignment = "center",
          row.title = "Condition", row.title.size = 4,
          column.title = "Marker", column.title.size = 4,
          force.bottom.label = TRUE, force.left.label = TRUE,
          bottom.label.size = 0.2, left.label.size = 0.2,
          bottom.label.text.size = 3, left.label.text.size = 3,
          bottom.label.text.alignment = "center",
          bottom.label.text.angle = 90, bottom.label.col = "white",
          left.label.text.alignment = "left", left.label.col = "white",
          grid.hline.col = "black", grid.vline.col = "black",
          legend.breaks = c(0,1), legend.text.size = 8)
          
# Close the image
dev.off()
