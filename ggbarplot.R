# test stacked data method

#packages
library (gplots)
library (plyr)  
library (lattice) 
library (Rmisc) 
library (car) 
library (FSA) 
library (multcompView) 
library (multcomp) 
library (agricolae) 
library (DescTools)
library (rcompanion)
library (ggplot2)
library(ggsignif)
Columnsforgraph = (1:12)
Columnsforgraph

attach(CVtest)
names(CVtest)
CVtest
shapiro.test(CVtest$Absorbance)

# low p value so fail to reject that data is not normally distributed

#use this to get data summary
SUM = Summarize(Absorbance ~ Concentration)
SUM $ se = SUM $ sd /(sqrt(SUM$n))
SUM


#this is for statistical analysis but may not end up using
CVtest $ Concentration = as.factor(CVtest $ Concentration)
ANOVA = aov(Absorbance ~ Concentration, data = CVtest)
summary(ANOVA)
str(CVtest)
AO2 = glht(ANOVA, linfct = mcp (Concentration = "Tukey"))
summary (AO2)
letters= cld(AO2) 
letters




Data2 = summarySE(data = CVtest, "Absorbance", group = "Concentration", conf.interval = 0.95)
Data2


Xttnodrug = ggplot(Data2,
       aes(x = Columnsforgraph, y = Absorbance, ymax = 110, ymin = 0)) +
  geom_bar(stat = "identity", fill = "orange", col = "black", width = 0.7) +
  geom_errorbar(aes(ymin = Absorbance - se, ymax = Absorbance + se), 
                width = 0.2, 
                size = 0.5) +
  scale_y_continuous(name = "A495nm",breaks = seq(0,150,10)) + 
  scale_x_continuous(name = "Column", limits = Columnsforgraph) +
  theme_bw()

Xttnodrug
# use this to gather things together
grid.arrange(p1, p2,Xttnodrug, Xttdrug, ncol = 2, nrow = 2) 


