## Getting and Cleaning Data
### Proyect Assigment CodeBook

Original data gathered from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Feature Selection of the Compiled Data Set
### For the pre-processed data variables and names read 'UCI HAR Dataset/features.txt

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals time.Acceleration.at.[XYZ] and Time.Gyro.at.[XYZ], where [XYZ] denotes one of those coordinates. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (Time.Body.Acceleration-[XYZ] and Time.Gravity.Acceleration.[XYZ]) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Time.Body.Acceleration.Jerk.[XYZ] and Time.Body.Gyro.Jerk.[XYZ]. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (Time.Body.Acceleration.Magnitude, Time.Gravity.Acceleration.Magnitude, Time.Body.Acceleration.Jerk.Magnitude, Time.Body.Gyro.Magnitude, Time.Body.Gyro.Jerk.Magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing Frequency.Body.Acceleration.[XYZ], Frequency.Body.Acceleration.Jerk.[XYZ], Frequency.Body.Gyro.[XYZ], Frequency.Body.Acceleration.Jerk.Magnitude, Frequency.Body.Gyro.Magnitude, Frequency.Body.Gyro.Jerk.Magnitude

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Of the set of signals, the Mean and Standard deviation were processed, producing the following variables: 


Time.Body.Acceleration.Mean.at.X
Time.Body.Acceleration.Mean.at.Y
Time.Body.Acceleration.Mean.at.Z
Time.Body.Acceleration.Standard.Deviation.at.X
Time.Body.Acceleration.Standard.Deviation.at.Y              
Time.Body.Acceleration.Standard.Deviation.at.Z
Time.Body.Acceleration.Mean.at.X
Time.Body.Acceleration.Mean.at.Y
Time.Body.Acceleration.Mean.at.Z
Time.Body.Acceleration.Standard.Deviation.at.X
Time.Body.Acceleration.Standard.Deviation.at.Y
Time.Body.Acceleration.Standard.Deviation.at.Z
Time.Body.Acceleration.Jerk.Mean.at.X
Time.Body.Acceleration.Jerk.Mean.at.Y
Time.Body.Acceleration.Jerk.Mean.at.Z
Time.Body.Acceleration.Jerk.Standard.Deviation.at.X          
Time.Body.Acceleration.Jerk.Standard.Deviation.at.Y          
Time.Body.Acceleration.Jerk.Standard.Deviation.at.Z          
Time.Body.Gyro.Mean.at.X
Time.Body.Gyro.Mean.at.Y
Time.Body.Gyro.Mean.at.Z
Time.Body.Gyro.Standard.Deviation.at.X
Time.Body.Gyro.Standard.Deviation.at.Y                       
Time.Body.Gyro.Standard.Deviation.at.Z                       
Time.Body.Gyro.Jerk.Mean.at.X                                
Time.Body.Gyro.Jerk.Mean.at.Y                                
Time.Body.Gyro.Jerk.Mean.at.Z                   
Time.Body.Gyro.Jerk.Standard.Deviation.at.X                  
Time.Body.Gyro.Jerk.Standard.Deviation.at.Y                
Time.Body.Gyro.Jerk.Standard.Deviation.at.Z    
Time.Body.Acceleration.Magnitude.Mean           
Time.Body.Acceleration.Magnitude.Standard.Deviation      
Time.Body.Acceleration.Magnitude.Mean           
Time.Body.Acceleration.Magnitude.Standard.Deviation        
Time.Body.Acceleration.Jerk.Magnitude.Mean      
Time.Body.Acceleration.Jerk.Magnitude.Standard.Deviation     
Time.Body.Gyro.Magnitude.Mean                    
Time.Body.Gyro.Magnitude.Standard.Deviation                  
Time.Body.Gyro.Jerk.Magnitude.Mean                   
Time.Body.Gyro.Jerk.Magnitude.Standard.Deviation            
Frequency.Body.Acceleration.Mean.at.X              
Frequency.Body.Acceleration.Mean.at.Y                        
Frequency.Body.Acceleration.Mean.at.Z                      
Frequency.Body.Acceleration.Standard.Deviation.at.X          
Frequency.Body.Acceleration.Standard.Deviation.at.Y          
Frequency.Body.Acceleration.Standard.Deviation.at.Z          
Frequency.Body.Acceleration.Jerk.Mean.at.X           
Frequency.Body.Acceleration.Jerk.Mean.at.Y                   
Frequency.Body.Acceleration.Jerk.Mean.at.Z                   
Frequency.Body.Acceleration.Jerk.Standard.Deviation.at.X    
Frequency.Body.Acceleration.Jerk.Standard.Deviation.at.Y     
Frequency.Body.Acceleration.Jerk.Standard.Deviation.at.Z     
Frequency.Body.Gyro.Mean.at.X
Frequency.Body.Gyro.Mean.at.Y
Frequency.Body.Gyro.Mean.at.Z
Frequency.Body.Gyro.Standard.Deviation.at.X                  
Frequency.Body.Gyro.Standard.Deviation.at.Y                  
Frequency.Body.Gyro.Standard.Deviation.at.Z                  
Frequency.Body.Acceleration.Magnitude.Mean      
Frequency.Body.Acceleration.Magnitude.Standard.Deviation     
Frequency.Body.Acceleration.Jerk.Magnitude.Mean 
Frequency.Body.Acceleration.Jerk.Magnitude.Standard.Deviation
Frequency.Body.Gyro.Magnitude.Mean
Frequency.Body.Gyro.Magnitude.Standard.Deviation
Frequency.Body.Gyro.Jerk.Magnitude.Mean 
Frequency.Body.Gyro.Jerk.Magnitude.Standard.Deviation

Additionally, each value is identified by the variables:

Subject, identified by a number from 1 to 30    
Activity, one of: 'Laying', 'Sitting', 'Standing', 'Walking Walking Downstairs' or 'Walking Upstairs'.

From the original data set, only the variables specified above are included in the "tidyData.txt" file. The complete list of variables of each feature vector on the original data set is available in 'UCI HAR Dataset/features.txt'.
