start_folder <- "in/UCI HAR Dataset/"
#--------------------------------------------------------------
# The auxiliary function reads and joins feature values with the respective
# activity codes and subject codes in one data frame depending on 
# type of data, train or test
#--------------------------------------------------------------
join_data <- function(folder, feature_names){
  message(paste("Reading", folder, "data ..."))
  feature_values <- read.table(paste(start_folder, folder, "/X_", folder, ".txt", sep=""),
                               header = FALSE, stringsAsFactors = FALSE)
  names(feature_values) <- feature_names
  df <- read.table(paste(start_folder, folder, "/y_", folder, ".txt", sep=""),
                   header = FALSE, stringsAsFactors = FALSE,
                   col.names = "activity_code")
  feature_values <- cbind(feature_values, df)
  df <- read.table(paste(start_folder, folder, "/subject_", folder, ".txt", sep=""),
                   header = FALSE, stringsAsFactors = FALSE,
                   col.names = "subject")
  feature_values <- cbind(feature_values, df)
}
#--------------------------------------------------------------
# The auxiliary function removes parenthesis in the variable name passed,
# converts it to lower case and adds '-' as a delimiter between
# meaningful words
#--------------------------------------------------------------
beautify <- function(x){
  y <- gsub("\\(\\)", "", tolower(x))
  for(word in c("acc", "body", "gyro", "jerk", "mag", "gravity")){
    y <- gsub(word, paste("-", word, "-", sep=""), y)
  }
  y <- gsub("--", "-", y)
}
#--------------------------------------------------------------
# The auxiliary function
# Creates 'in' and 'out' folders if absent for input and output data
# Downloads and unzips input data according to the assignment
# Does nothing if data is found on subsequent runs
#--------------------------------------------------------------
get_data <- function(){
  for(dir in c("in", "out")){
    if(!file.exists(dir)){
      dir.create(file.path(dir))
      message(paste("Folder", dir, "created in the current one"))
    }
  }
  unzipped_dir <- "in/UCI HAR Dataset"
  if(!file.exists(unzipped_dir)){
    zipped_data <- "in/Dataset.zip"
    if(!file.exists(zipped_data)){
      message("Downloading data ...")
      download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", zipped_data)
      message("Zip file downloaded")
    }
    message("Unzipping data ...")
    unzip(zipped_data, exdir = "in")
    message("Zip file unzipped")
  }
}
#--------------------------------------------------------------
# The main function to call for this script
# Does all items required in the assignment
#--------------------------------------------------------------
run_analysis <- function(){
  # Get data from the web
  get_data()

  # read names of the features from the file provided
  features_names <- read.table(paste(start_folder, "features.txt", sep=""),
                               header = FALSE)[, 2]
  # read and join the train and test data sets in one data frame
  df <- rbind(join_data("test", features_names), join_data("train", features_names))
  message("1. Merged the training and the test sets to create one data set.")

  # filter out feature names which do not have 'mean(' and 'std('
  feature_cols_leave <- grep("mean\\(|std\\(", features_names, value = TRUE)
  # remove all cols but activity code, subject code, mean'ed and std'ed features
  df <- df[, c("activity_code", "subject", feature_cols_leave)]
  message("2. Extracted only the measurements on the mean and standard deviation for each measurement.")
  
  # read activity names for merging giving "activity_code" to the 1st column
  # for the common column to use while merging
  activity_labels <- read.table(paste(start_folder, "activity_labels.txt", sep=""), 
                                header    = FALSE,
                                stringsAsFactors = FALSE,
                                col.names = c("activity_code", "activity"))
  # merging
  df <- merge(df, activity_labels)
  message("3. Used descriptive activity names to name the activities in the data set")
  
  # giving descriptive names to feature name columns, applying the aux func beautify
  new_names <- sapply(feature_cols_leave, FUN = beautify)
  library(data.table) # to use set names
  setnames(df, feature_cols_leave, new_names)
  # writing data to file in 'out' folder
  write.table(df, "out/tidy_data.txt", row.names = FALSE)
  message("4. Appropriately labeled the data set with descriptive variable names.\nSaved in out/tidy_data.txt")

  # aggregating (applying mean func) feature name columns
  # by groups activity and subject
  agg <- aggregate(df[,new_names],
                   by = list(activity = df$activity,
                             subject = df$subject),
                   mean)
  # writing data to file in 'out' folder
  write.table(agg, "out/tidy_data_mean.txt", row.names = FALSE)
  message("5. Created a second, independent tidy data set with the average of each variable for each activity and each subject.\nSaved in out/tidy_data.txt")
}