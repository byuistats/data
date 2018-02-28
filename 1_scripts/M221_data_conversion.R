###  Read in Math 221 Excel Data files and make CSV and RDS files #####
###  Needs to check consistency of names of files ###
### save out csv and r data files  #####


### libraries #####

library(xlsx)
library(readr)
source("1_scripts/_funcs.R")



### Original Data Import

excel_data_fnames = list.files("excel_data_original/")

for (i in excel_data_fnames){try(xlsxConvert(i,rds="RDS_Files",csv="CSV_Files"))}

wfiles = list.files("RDS_files")
#### These have errors in Excel read in
# [1] "Apollo.xlsx"                      "BabyBoom-JSE.xlsx"                "CauseOfDeath-Malnourished.xlsx"  
#  [4] "COPD-Rehab.xlsx"                  "Gratitude.xlsx"                   "IllinoisBirthWeights.xlsx"       
#  [7] "InsulinResistanceDepression.xlsx" "LASaturnWinter06.xlsx"            "MadisonCountyRealEstate.xlsx"    
# [10] "OreoDoubleStuf.xlsx"              "ZungSim.xlsx"                    

xlsxConvert("COPD-Rehab.xlsx",rds="RDS_Files", csv="CSV_Files")


# csv_files = list.files("C:/git/bitbucket/byuistatistics/data/csv",full.names=TRUE)
# #csvExport(csv_files[1],export_format=c(".RDS",".xlsx",".sav",".dta",".csv"),export_folder="C:/git/github/byuistats/data")


# for (i in 1:length(csv_files)){
# 	csvExport(csv_files[i],export_format=c(".RDS",".xlsx",".sav",".dta",".csv"),export_folder="C:/git/github/byuistats/data")	
# 	print(i)
# }


#csvExport("C:/Users/hathawayj/OneDrive/Documents/BYUI/M221_IntroStats/StudyTime_221.csv",export_format=c(".RDS",".xlsx",".sav",".dta",".csv"),export_folder="C:/git/github/byuistats/data")


# fpath = "C:/Users/hathawayj/OneDrive/Documents/BYUI/Data"
# files = c("HotDog_Health.txt","Music_Height.csv","Dart_Expert_Dow_6month_anova.txt")


# temp = tempdir()
# write.csv(read.table(file.path(fpath,files[1]),header=T),file=file.path(temp,gsub(".txt",".csv",files[1])),row.names=FALSE)
# csvExport(file.path(temp,gsub(".txt",".csv",files[1])),
# 	       export_format=c(".RDS",".xlsx",".sav",".dta",".csv"),export_folder="C:/git/github/byuistats/data")

# library(reshape)
# bob = read.csv(file.path(fpath,files[2]))
# write.csv(melt(bob,na.rm=TRUE),file=file.path(fpath,"Music_Height_long.csv")
# csvExport(file.path(fpath,"Music_Height_long.csv"),
# 	       export_format=c(".RDS",".xlsx",".sav",".dta",".csv"),export_folder="C:/git/github/byuistats/data")

# bob = read.table(file.path(fpath,files[3]),header=T)

# write.csv(melt(bob,id.vars="CONTEST.PERIOD"),file.path(temp,gsub(".txt",".csv",files[3])),row.names=FALSE)
# csvExport(file.path(temp,gsub(".txt",".csv",files[3])),
# 	       export_format=c(".RDS",".xlsx",".sav",".dta",".csv"),export_folder="C:/git/github/byuistats/data")


#csvExport("C:/Users/hathawayj/OneDrive/Documents/BYUI/Data/movies.csv",export_format=c(".RDS",".xlsx",".sav",".dta",".csv"),export_folder="C:/git/github/byuistats/data")


draft <- read_csv("C:/Users/hathawayj/odrive/OneDrive_BYUI/data/Draft_vietnam.csv", na = "#N/A")
write_csv(draft, "C:/Users/hathawayj/odrive/OneDrive_BYUI/data/Draft_vietnam.csv")

csvExport("C:/Users/hathawayj/odrive/OneDrive_BYUI/data/Draft_vietnam.csv",export_format=c(".RDS",".xlsx",".sav",".dta",".csv"),export_folder="C:/git/github/byuistats/data")


csvExport("C:/Users/hathawayj/Downloads/MathSelfEfficacy.csv",export_format=c(".RDS",".xlsx",".sav",".dta",".csv"),export_folder="C:/git/github/byuistats/data")

csvExport("https://github.com/byuistats/data/raw/master/Dart_Expert_Dow_6month_anova/Dart_Expert_Dow_6month_anova.csv",export_format=c(".RDS",".xlsx",".sav",".dta",".csv"),export_folder="C:/git/github/byuistats/data")

