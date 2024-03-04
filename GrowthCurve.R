#Code to visualize growth curve

#Packages
library(ggplot2)
library(ggprism)
library(dplyr)
library(ggforce)


#Get data
Dataset = X72hGC
attach(Dataset)
names(Dataset)

#How long did the experiment last in hours
Duration = 72

#Get averages for each strain at each timepoint, also have sd for error bars
d = data.frame(Dataset)
mean.aggs = aggregate(Absorbance ~ Strain + Time, data = d, FUN = "mean")
sd.aggs = aggregate(Absorbance ~ Strain + Time, data = d, FUN = "sd")

#Check to see if you did the math wrong :(
mean.aggs
sd.aggs


#Make growth curve
GC = ggplot(data = mean.aggs, aes(x = Time, y = Absorbance, group = Strain)) +
  geom_path(aes(col = Strain)) +
  geom_point(stat = "identity", aes(col = Strain, shape = Strain), size = 3) +
  scale_size_manual(values = 3) +
  xlab("Time (h)") +
  ylab("Absorbance") +
  scale_x_continuous(breaks = seq(0, Duration, by = 12)) + 
  theme_prism() +
  theme(legend.position = "top",
        legend.key.width = unit(60, "pt"),
        legend.title = element_text(),
        legend.text = element_text(size = 16))

GC
#Add error bars if feeling spicy
GC + geom_errorbar(aes(ymin = mean.aggs$Absorbance - sd.aggs$Absorbance,
                  ymax = mean.aggs$Absorbance + sd.aggs$Absorbance))


tapply(Absorbance, Strain, max)
tapply(Absorbance, Strain, sd)

            