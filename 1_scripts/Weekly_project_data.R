###  Read in Math 221 Excel Data files and make CSV and RDS files #####
###  Needs to check consistency of names of files ###
### save out csv and r data files  #####


### libraries & functions #####
library(openxlsx)
library(readr)
library(fs)
library(downloader)
source("../data/1_scripts/_funcs.R")

tempf <- file_temp("census2015_-_", ext = ".csv")
downloader::download("https://webmailbyui-my.sharepoint.com/personal/harmkenn_byui_edu/_layouts/15/download.aspx?docid=0286e71c4ffb7463d9b1aad42776f351f&authkey=AXGOIib8rmhObBALCyN4i3Y&e=7de8e92d505343abb1d74a4882d82bba", tempf)

#windows "C:/git/github/byuistats/data"
#mac "../data"

csvExport(tempf, export_format=c(".RDS",".xlsx",".sav",".dta",".csv"), export_folder="../data")

csvExport(file.choose(), export_format=c(".RDS",".xlsx",".sav",".dta",".csv"), export_folder="../data")
