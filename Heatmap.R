#Create heatmap from data when you don't have enough for a barplot
#Averages must be calculated in excel!
#using ggplot for this

#Packages
library(ggplot2)
library(reshape2)
library(ggprism)
library(readxl)

#Get data installed and rename to Dataset
Ds1 = read_excel("D:/Research/Romo/Data/Project2Summary.xlsx", 
                                    sheet = "Planktonic Heatmap",
                 range = "C40:O51")
Dataset = Ds1
attach(Dataset)
names (Dataset)

#Antifungal used
AMB = "Amphotericin B"
FLC = "Fluconazole"
AF = AMB
AFlabel = paste(AF, "Concentration (ug/mL)", sep=" ")


#Converts into a long format which is needed by ggplot
Dataset_melt = melt(Dataset,value.name = "Absorbance")

#Checks to see first 6 lines of table
head(Dataset_melt)

plot = ggplot(Dataset_melt,aes(variable, ID)) +
  geom_tile(aes(fill = Absorbance)) +
  coord_fixed() +
  scale_fill_gradient(low = "black", high = "green2" )+
  xlab(AFlabel ) +
  ylab("Isolate") + 
  theme_prism(base_size = 16,
              axis_text_angle = 45) +
  theme(legend.position = "right") +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.key.width = unit(1, 'cm'), #change legend key width
        legend.title = element_text(size=14), #change legend title font size
        legend.text = element_text(size=14))

plot

#Check to see if plotting averages or all datapoints at once
plot + geom_text(aes(label = round(Absorbance, 3))) 

Dataset_melt

