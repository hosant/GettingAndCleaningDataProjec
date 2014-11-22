## Getting and Cleaning Data
### Proyect Assigment

#### Written by Santiago Hernandez Orozco.

### To run the script: 

First,  load the script with by writing 'source(run_analysis.R)' at R's console.

* Type 'runScript()'  to download the data files from the Internet and display the Tidy Data Set obtained using R's Viewer. This function will also create a 'tidyData.txt' file with the tidy data set obtained.

* Type 'runScript(dl = FALSE)' to skip data download and display Tidy Data Set obtained using R's Viewer.  This function will also create a 'tidyData.txt' file with the tidy data set obtained.

* Type 'runScript(dl = FALSE, view = FALSE)'  to just create a 'tidyData.txt' file with the tidy data set obtained.

### Brief Explanation of the the script.

This script uses the functions defined at the 'run_analysis.R' file to,  first,  download and uncompress the data at the current working directory using the 'downloadUnZData' function.  Then, it calls the 'saveDF' function to create a data frame with  all the data by calling the  'makeDF' function.  Afterwards, it creates a  tidy data frame by choosing the variables with name either contain 'mean()' or 'std()' or are are 'Subject' or 'Activity' variables using the 'cleanDF' function. Finally,  it saves the data frame at a file named 'tidyData.txt'.

Also, as specified by the 'dl' and 'view' variables,  it reads the 'tidyData.txt' file and  displays its contents using the 'View' function from 'R' base.


The most important function of the script is 'readXFile', which is called by 'makeDF' two times (one for the 'train' and the other for  the 'test' files) to build the initial data set. This function works by reading each of the specified files into data frames using the 'read.table' function from R bases. Then it binds them together column by column using the 'cbind' function. Two data frames are created using this function, which then are bind together using 'rbind'.

Renaming the variables with descriptive variable names is by the 'renameVars' function, which is called by cleanDF for reasons of efficiency (so the list of strings is smaller), but could be called by 'makeDF' without problems. The current implementation of 'renameVars' is not particularly efficient but still linear time.

