
###### Need to strip xlsx files of the data and then write a readme file with the data provenance.  Also need to write files to 
###### common folder with the different file types available in the folder.  We want the following formats.

# rds, csv, xlsx, sav, (should we have sas files?)
# going to make it build from csv
# will have a second function that strips data provenance from xlsx files


#'	@title Export csv files to other file formats as defined 
#' 	@param csv_file is a character string of the csv files (with its path)
#'	@param export_format is a character vector of formats to convert.  Defaults to ".RDS".  Potential file types are .xlsx, .RDS, .sav, .dta, and sas7bda
#'	@param export_folder is the folder where the exported data will be placed.  In this folder the a subfolder will be created for each csv file name and 
#'  selected export_format file types will be created in the folder.   
#'	@param details  If TRUE then information is printed to screen during the process.  Default is TRUE.
#'	@param readme is the data summary that describes the data.  Accepts a text string describing the provenance. 
#'	@notes Requires the use of the openxlsx  and haven package. See https://github.com/awalker89/openxlsx and  https://github.com/hadley/haven/
#'	@example csvExport()
#'	@export

csvExport  = function(csv_file, export_format=NULL, export_folder,details=TRUE,readme=NULL){
  
  library(haven)
  library(openxlsx)
  if (is.null(export_format))  stop("Don't you want to export something....")
  if(details==TRUE) print(csv_file)
  file_name = rev(strsplit(csv_file,"/")[[1]])[1]
  file_name = gsub("_-_(\\d|\\w){1,250}.", ".", file_name)  
  file_folder = gsub(".csv","",file_name)
  # read in the file 
  # looks like the standard format is to have a column with comments.  This column is removed. 
  temp.file = read.csv(csv_file,stringsAsFactors=F)
  colnames(temp.file) <- gsub("\\.", "_", tolower(colnames(temp.file)))
  if(details==TRUE){
    print(head(temp.file))	
  }
  dir.create(file.path(export_folder,file_folder))
  if(!is.null(readme)) cat(readme,file=file.path(export_folder,file_folder,gsub(".csv",".readme",file_name)))
  if(any(export_format%in%".RDS")==TRUE) saveRDS(temp.file,file=file.path(export_folder,file_folder,gsub(".csv",".RDS",file_name)))
  if(any(export_format%in%".xlsx")==TRUE) write.xlsx(temp.file,file=file.path(export_folder,file_folder,gsub(".csv",".xlsx",file_name)), row.names = FALSE)
  if(any(export_format%in%".sav")==TRUE) write_sav(temp.file,path=file.path(export_folder,file_folder,gsub(".csv",".sav",file_name)))
  if(any(export_format%in%".dta")==TRUE) write_dta(temp.file,path=file.path(export_folder,file_folder,gsub(".csv",".dta",file_name)))
  if(any(export_format%in%".csv")==TRUE) write.csv(temp.file,file=file.path(export_folder,file_folder,file_name),row.names=FALSE)
  
  if(details==TRUE) return(temp.file)
  
}

