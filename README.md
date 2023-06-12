# 96_well_R_Code
Code used to analyze absorbance data from 96 well plates
This is code that I'm using to examine pathogen resistance to various antifungal agents. 
Please cite this code if you're using it. 

IMPORTANT
Data must be set up in 2 columns in Excel so it can be read and easily plotted in ggplots, this also allows for ANOVA tests to be performed

PROGRAM DESCRIPTIONS
Barplot Biofilms/Microbroth
  Both create barplots for respective data sources, only requires 2-column format in excel when pulling in from plate reader.
  Fairly straightforward with edit areas easily accessible.
  
Heatmap Microbroth
  Creates heatmap from 96 well plates, requires absorbance values to be averaged out prior to import from excel (Will work on this)
  
