###  Read in Math 221 Excel Data files and make CSV and RDS files #####
###  Needs to check consistency of names of files ###
### save out csv and r data files  #####


### libraries & functions #####
pacman::p_load(openxlsx, fs, downloader, lubridate, tidyverse)
source("../data/1_scripts/_funcs.R")



# fix weird issue with Feb 29th in Excel file
dd <- read_csv("Draft_vietnam/Draft_vietnam.csv")
tempf <- file_temp("Draft_vietnam_-_", ext = ".csv")
write_csv(dd, tempf)
csvExport(tempf, export_format=c(".RDS",".xlsx",".sav",".dta",".csv"), export_folder="../data")


# remove the number in front of the contest period
md <- read_csv("Dart_Expert_Dow_6month_anova/Dart_Expert_Dow_6month_anova.csv")
md <- md %>%
  mutate(contest_period = str_replace_all(contest_period, "^[:digit:]+", "")) %>%
  filter(contest_period != "Average")

tempf <- file_temp("Dart_Expert_Dow_6month_anova_-_", ext = ".csv")

write_csv(md, tempf)

csvExport(tempf, export_format=c(".RDS",".xlsx",".sav",".dta",".csv"), export_folder="../data")


# tempf <- file_temp("census2015_-_", ext = ".csv")
# downloader::download("https://webmailbyui-my.sharepoint.com/personal/harmkenn_byui_edu/_layouts/15/download.aspx?docid=0286e71c4ffb7463d9b1aad42776f351f&authkey=AXGOIib8rmhObBALCyN4i3Y&e=7de8e92d505343abb1d74a4882d82bba", tempf)
# 
# #windows "C:/git/github/byuistats/data"
# #mac "../data"
# 
# csvExport(tempf, export_format=c(".RDS",".xlsx",".sav",".dta",".csv"), export_folder="../data")
# csvExport(file.choose(), export_format=c(".RDS",".xlsx",".sav",".dta",".csv"), export_folder="../data")
