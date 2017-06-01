Getting and Cleaning Data Project
===

##Code Book for Project for the Getting and Cleaning Data course for the Data Science specialization on Coursera


This project gathers data from this [UCI Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) on Human Activity gathered using the accelerometer and gyroscope in a smartphone.

My project assumes that the dataset is downloaded exactly in its original form and none of the file names or variable names are edited.

The attached code("run_analysis.R") exatracts and combines both the test and training datasets to create one final dataset. Then it adds columns for neatly named Activity Labels that each subject performed and a unique ID for each Subject.

Finally the script creates a tidy data set containing the mean of all the relevant variables in the data based on the principles defined by Hadley Wickham in his [paper on tidy data](http://vita.had.co.nz/papers/tidy-data.html).

---
The variable are named to be as descriptive as possible while still being somewhat concise.

Below is a brief description of all variables and their names:

* "Subject_ID"	-	Unique ID of each subject from 1 to 30
* "Activity_Label"	-	Name of Activity carried out by subject (e.g WALKING, LAYING, etc.)                 
* "Time-StdDevOf-BodyAccelerationX"		-	Time domain Standard Deviation of Body Acceleration in X direction
* "Time-StdDevOf-BodyAccelerationY"		-	Time domain Standard Deviation of Body Acceleration in Y direction       
* "Time-StdDevOf-BodyAccelerationZ"		-	Time domain Standard Deviation of Body Acceleration in Z direction
* "Time-StdDevOf-GravityAccelerationX"	-	Time domain Standard Deviation of Gravitational Acceleration in X direction  
* "Time-StdDevOf-GravityAccelerationY"	-	Time domain Standard Deviation of Gravitational Acceleration in Y direction  
* "Time-StdDevOf-GravityAccelerationZ" 	-	Time domain Standard Deviation of Gravitational Acceleration in Z direction   
* "Time-StdDevOf-BodyAccelerationJerkX"	-	Time domain Standard Deviation of Body Acceleration Jerk in X direction  
* "Time-StdDevOf-BodyAccelerationJerkY"	-	Time domain Standard Deviation of Body Acceleration Jerk in Y direction     
* "Time-StdDevOf-BodyAccelerationJerkZ"	-	Time domain Standard Deviation of Body Acceleration Jerk in Z direction  
* "Time-StdDevOf-BodyGyroscopeX" 	-	Time domain Standard Deviation of Gyroscope movement in X direction           
* "Time-StdDevOf-BodyGyroscopeY" 	-	Time domain Standard Deviation of Gyroscope movement in Y direction   
* "Time-StdDevOf-BodyGyroscopeZ" 	-	Time domain Standard Deviation of Gyroscope movement in Z direction             
* "Time-StdDevOf-BodyGyroscopeJerkX" 	-	Time domain Standard Deviation of Gyroscope movement Jerk in X direction             
* "Time-StdDevOf-BodyGyroscopeJerkY" 	-	Time domain Standard Deviation of Gyroscope movement Jerk in Y direction                   
* "Time-StdDevOf-BodyGyroscopeJerkZ" 	-	Time domain Standard Deviation of Gyroscope movement Jerk in Z direction             
* "Time-StdDevOf-BodyAccelerationMag."	-	Magnitude of Time domain Standard Deviation of Body Acceleration in all directions  
* "Time-StdDevOf-GravityAccelerationMag."	-	Magnitude of Time domain Standard Deviation of Gravitational Acceleration all directions  
* "Time-StdDevOf-BodyAccelerationJerkMag." 	-	Magnitude of Time domain Standard Deviation of Body Acceleration Jerk in all directions
* "Time-StdDevOf-BodyGyroscopeMag." 		-	Magnitude of Time domain Standard Deviation of Gyroscope movement in all directions          
* "Time-StdDevOf-BodyGyroscopeJerkMag." 	-	Magnitude of Time domain Standard Deviation of Gyroscope movement Jerk in all directions          
* "F-StdDevOfBodyAccelerationX"		-	Frequency domain Standard Deviation of Body Acceleration in X direction			
* "F-StdDevOfBodyAccelerationY"		-	Frequency domain Standard Deviation of Body Acceleration in Y direction           
* "F-StdDevOfBodyAccelerationZ"		-	Frequency domain Standard Deviation of Body Acceleration in Z direction
* "F-StdDevOfBodyAccelerationJerkX"	-	Frequency domain Standard Deviation of Body Acceleration Jerk in X direction       
* "F-StdDevOfBodyAccelerationJerkY"	-	Frequency domain Standard Deviation of Body Acceleration Jerk in Y direction 
* "F-StdDevOfBodyAccelerationJerkZ"	-	Frequency domain Standard Deviation of Body Acceleration Jerk in Z direction        
* "F-StdDevOfBodyGyroscopeX"	-	Frequency domain Standard Deviation of Gyroscope movement in X direction  
* "F-StdDevOfBodyGyroscopeY"  	-	Frequency domain Standard Deviation of Gyroscope movement in Y direction                
* "F-StdDevOfBodyAccelerationMag."	-	Magnitude of Frequency domain Standard Deviation of Body Acceleration in all directions          
* "F-StdDevOfBodyBodyAccelerationJerkMag." 	-	Magnitude of Frequency domain Standard Deviation of Body Acceleration Jerk in all directions
* "F-StdDevOfBodyGyroscopeMag." 		-	Magnitude of Frequency domain Standard Deviation of Gyroscope movement in all directions                 
* "F-StdDevOfBodyGyroscopeJerkMag." 	-	Magnitude of Frequency domain Standard Deviation of Gyroscope movement Jerk in all directions          
* "Time-MeanOfBodyAccelerationX" 		-	Time domain Mean of Body Acceleration in X direction         
* "Time-MeanOfBodyAccelerationY" 		-	Time domain Mean of Body Acceleration in Y direction         
* "Time-MeanOfBodyAccelerationZ" 		-	Time domain Mean of Body Acceleration in Z direction                   
* "Time-MeanOfGravityAccelerationX"		-	Time domain Mean of Gravitational Acceleration in X direction  
* "Time-MeanOfGravityAccelerationY"		-	Time domain Mean of Gravitational Acceleration in Y direction         
* "Time-MeanOfGravityAccelerationZ"		-	Time domain Mean of Gravitational Acceleration in Z direction  
* "Time-MeanOfBodyAccelerationJerkX"	-	Time domain Mean of Body Acceleration Jerk in X direction        
* "Time-MeanOfBodyAccelerationJerkY"	-	Time domain Mean of Body Acceleration Jerk in Y direction  
* "Time-MeanOfBodyAccelerationJerkZ"	-	Time domain Mean of Body Acceleration Jerk in Z direction        
* "Time-MeanOfBodyGyroscopeX" 	-	Time domain Mean of Gyroscope movement in X direction           
* "Time-MeanOfBodyGyroscopeY" 	-	Time domain Mean of Gyroscope movement in Y direction                        
* "Time-MeanOfBodyGyroscopeZ" 	-	Time domain Mean of Gyroscope movement in Z direction           
* "Time-MeanOfBodyGyroscopeJerkX" 	-	Time domain Mean of Gyroscope movement Jerk in X direction                      
* "Time-MeanOfBodyGyroscopeJerkY" 	-	Time domain Mean of Gyroscope movement Jerk in Y direction 
* "Time-MeanOfBodyGyroscopeJerkZ" 	-	Time domain Mean of Gyroscope movement Jerk in Z direction          
* "Time-MeanOfBodyAccelerationMag." 	-	Magnitude of Time domain Mean of Body Acceleration Jerk in all directions
* "Time-MeanOfGravityAccelerationMag."	-	Magnitude of Time domain Mean of Gravitational Acceleration all directions      
* "Time-MeanOfBodyAccelerationJerkMag."	-	Magnitude of Time domain Mean of Body Acceleration Jerk in all directions
* "Time-MeanOfBodyGyroscopeMag." 		-	Magnitude of Time domain Mean of Gyroscope movement in all directions                    
* "Time-MeanOfBodyGyroscopeJerkMag." 	-	Magnitude of Time domain Mean of Gyroscope movement Jerk in all directions          
* "F-MeanOfBodyAccelerationX"		-	Frequency domain Mean of Body Acceleration in X direction			             
* "F-MeanOfBodyAccelerationY"		-	Frequency domain Mean of Body Acceleration in Y direction			
* "F-MeanOfBodyAccelerationZ"		-	Frequency domain Mean of Body Acceleration in Z direction			             
* "F-MeanOfBodyAccelerationJerkX"	-	Frequency domain Mean of Body Acceleration Jerk in X direction       
* "F-MeanOfBodyAccelerationJerkY"	-	Frequency domain Mean of Body Acceleration Jerk in Y direction           
* "F-MeanOfBodyAccelerationJerkZ"	-	Frequency domain Mean of Body Acceleration Jerk in Z direction  
* "F-MeanOfBodyGyroscopeX"	-	Frequency domain Mean of Gyroscope movement in X direction                  
* "F-MeanOfBodyGyroscopeY"	-	Frequency domain Mean of Gyroscope movement in Y direction  
* "F-MeanOfBodyGyroscopeZ"	-	Frequency domain Mean of Gyroscope movement in Z direction                  
* "F-MeanOfBodyAccelerationMag."	-	Magnitude of Frequency domain Mean of Body Acceleration in all directions          
* "F-MeanOfBodyBodyAccelerationJerkMag." 	-	Magnitude of Frequency domain Mean of Body Acceleration Jerk in all directions  
* "F-MeanOfBodyBodyGyroscopeMag."		-	Magnitude of Frequency domain Mean of Gyroscope movement in all directions                 
* "F-MeanOfBodyBodyGyroscopeJerkMag." 	-	Magnitude of Frequency domain Mean of Gyroscope movement Jerk in all directions              



###### Whew!, that's a long list!

I wanted to be as through as possible and not exclude any data. The final tidy data set produced by the script includes the means of all of the variable listed above based on both the ACtivity Label and the SUbject ID.

To name each variable I created a function that's within the run_analysis file called col_Namer. This function uses clever regex expressions and other functions to rename the variable and expand on their names while also trying to keep certain things abbrevaited (like Standard Deviation) but still make it clearer what each variable represents.


Important side note is that none of these values have units because as mentioned on the UCI website, all variables have been normalized between 0 and 1 so they are now unitless.



 