#Envirioment variables.
fileUrl = "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Type 'runScript()' to run or 'runScript(dl = FALSE)'
# to skip the file downloading and Uncompressing step.

# This scripts uses the defined functions
# to, first, download and uncompress the data at
# the current working directory. Then, using
# the 'downloadUnZData' function. Then, it calls the 
# 'saveDF' function to create a data frame with  
# all the data using the  'makeDF' function. 
# Afterwards, it creates a  tidy data frame with 
# only the 'mean()' and 'std()' variables using 
# the 'cleanDF' function. Finally,  it saves the 
# data frame at a file named 'tidyData.txt'.
# As an added bonus, it reads the 'tidyData.txt'file, 
# and  displays its contents using the 'View' 
# function from 'R' base. Run as 
# '(runScript(view = FALSE)' 
# to skip this last step.

directory = "UCI HAR Dataset/"

# Runs the script.
runScript <- function(dl = TRUE, view = TRUE){

	if (dl) downloadUnZData()
	
	saveDF()
	
	if (view) {
		tidyData = readDF()
		View(tidyData)
		}
}

# Returns a data frame with the contents of the
# generated file.
readDF <- function (file = "tidyData.txt") {
	read.table(file, header = TRUE)
}


# Downloads and UnZips the data.
downloadUnZData <- function(
		url = fileUrl,
		file = "data.zip" ){
	
	download.file(url, file, mode = "wb")
	unzip(file)
	
	}


#Creates the requested file.
saveDF <- function (file = "tidyData.txt") {

	df = cleanDF(makeDF())
	write.table(df, file, row.name=FALSE)

}

# Compiles all the data on a single
# data frame.
makeDF <- function (path = directory){

	features = readFeatures()
	
	df = rbind(readXFile(type = "train"), 
		readXFile(type = "test"))
		
	colnames (df) = c(features, "Subject", "Activity")

	df
}

# Uses descriptive activity names to name 
# the activities in the data set given a single
# column data frame with the data.
renameActivity <- function (df,
	activities = c("Walking","Walking Upstairs",
		"Walking Downstairs", "Sitting", "Standing",
		"Laying"), col = 1
		) {

	c = 1	
	for (i in df[,col]){
		df[c,col] = activities[as.integer(i)]
		c = c + 1
	}
	df
}


# Extracts only the measurements on the mean and standard 
# deviation from the given data frame according to the 
# column names. Also applies the variable 
# renaming function.
cleanDF <- function (df) {

	columns = colnames(df)
	columns = grepl("mean()",columns, fixed = TRUE) | 
		grepl("std()",columns, fixed = TRUE)
	
	# Adds the last two columns.
	l = length (columns)
	columns[(l-1):l] = TRUE
	
	df = df[columns]
	
	#Renames variables.
	colnames(df) <- renameVars(colnames(df))
	
	df

}


# Reads the "features.txt" file and
# returns a vector with its contents.
readFeatures <- function(path = directory, file = "features.txt") {

	f = paste (path, file, sep ="")
	dataf = read.table(f, sep ="", stringsAsFactors = FALSE, 
		col.names = c("Pos","Features"))
		
	dataf$Features
}

# Reads an a signal file specified by suffix
# and returns a data frame with its content.
readXFile <- function(path = directory, type = "test"){

	path = paste(directory, type, "/", sep = "")
	suffix = ".txt"
	
	#Reads X_<type>.txt
	file = paste(path,"X_", type, suffix, sep="")
	df = read.table(file, sep ="", colClasses = "double")
	
	#Reads subject_<type>.txt
	file = paste(path,"subject_", type, suffix, sep="")
	df = cbind(df, 
		read.table(file, sep ="", colClasses = "integer"))
	
	#Reads y_<type>.txt
	file = paste(path,"y_", type, suffix, sep="")
	
	df = cbind(df, 
		renameActivity ( #Substitutes number for Activity name. 
			read.table(file, sep ="", colClasses = "character"))
		)
	
	df
}

# Given the data frame, labels the data set with descriptive 
# variable names.
renameVars <- function (varNames) {
	# Function that makes variable name
	# substitution given a word. This 
	# function isn't very efficient, 
	# but does the work and the list
	# it has to work with is small.
	subsFun = function (word){
	
		wOut = ""

		if(grepl("^t",word))
			wOut = paste(wOut,"Time", sep="")
		if(grepl("^f",word))
			wOut = paste(wOut,"Frequency", sep="")
		if(grepl("Body",word))
			wOut = paste(wOut,"Body", sep=" ")
		if(grepl("Gravity",word))
			wOut = paste(wOut,"Body", sep=" ")
		if(grepl("Acc",word))
			wOut = paste(wOut,"Acceleration", sep=" ")
		if(grepl("Gyro",word))
			wOut = paste(wOut,"Gyro", sep=" ")
		if(grepl("Jerk",word))
			wOut = paste(wOut,"Jerk", sep=" ")
		if(grepl("Mag",word))
			wOut = paste(wOut,"Magnitude", sep=" ")
		if(grepl("mean",word))
			wOut = paste(wOut,"Mean", sep=" ")
		if(grepl("std",word))
			wOut = paste(wOut,"Standard Deviation", sep=" ")
		if(grepl("-X",word))
			wOut = paste(wOut,"at X", sep=" ")
		if(grepl("-Y",word))
			wOut = paste(wOut,"at Y", sep=" ")
		if(grepl("-Z",word))
			wOut = paste(wOut,"at Z", sep=" ")
			
		if(grepl("Subject|Activity",word))
			wOut = word
			
		wOut
	}
	
	simplify2array(sapply(varNames, subsFun))

}


# The following code reads the Inertial Signals files.
# This is not needed for the assignment. 

dataFilesTrain = c("subject_train.txt","X_train.txt","y_train.txt", 
		"Inertial Signals/body_acc_x_train.txt", "Inertial Signals/body_acc_y_train.txt",
		"Inertial Signals/body_acc_z_train.txt","Inertial Signals/body_gyro_x_train.txt",
		"Inertial Signals/body_gyro_y_train.txt","Inertial Signals/gyro_z_train.txt",
		"Inertial Signals/total_acc_x_train.txt","Inertial Signals/total_acc_y_train.txt",
		"Inertial Signals/total_acc_z_train.txt")

dataFilesTest = c("subject_test.txt","X_test.txt","y_test.txt", 
		"Inertial Signals/body_acc_x_test.txt", "Inertial Signals/body_acc_y_test.txt",
		"Inertial Signals/body_acc_z_test.txt","Inertial Signals/body_gyro_x_test.txt",
		"Inertial Signals/body_gyro_y_test.txt","Inertial Signals/gyro_z_test.txt",
		"Inertial Signals/total_acc_x_test.txt","Inertial Signals/total_acc_y_test.txt",
		"Inertial Signals/total_acc_z_test.txt")
		
dataFiles <- c("body_acc_x", "body_acc_y",
		"body_acc_z","body_gyro_x",
		"body_gyro_y","body_gyro_z",
		"total_acc_x","total_acc_y",
		"total_acc_z")
		

# Reads all the content at Inertial Signal "train" folder and 
# returns a data frame.
readTrainingSet <- function(path = paste(directory, "train/", sep =""),
		files = dataFiles, suffix = "_train.txt" ) {

	f = paste (path,"y", suffix, sep ="")
	
	dataf = read.table(f, sep ="", colClasses = "integer", 
		col.names = c("Labels"))

		
	for (f in dataFiles){
		df = readIntertialSingals(path, f, suffix)
		colnames(df) = sapply(colnames(df), 
			function(x) paste (f, x, sep="-"))
		dataf <- cbind(dataf, df)
	}
	
	dataf
}

# Reads all the content at Inertial Signal "test" folder and 
# returns a data frame.
readTestSet <- function(path = paste(directory, "test/", sep =""),
		files = dataFiles, suffix = "_test.txt" ) {
		
	readTrainingSet (path, files, suffix)
}

# Reads an Intertial signal file specified by f and suffix
# and returns a data frame with its content.
readIntertialSingals <- function(path, f, suffix) {
	path <- paste(path, "Inertial Signals/", sep="")
	file <- paste(path, f, suffix, sep="")
	df <- read.table(file, sep ="", colClasses = "double")
	df
}