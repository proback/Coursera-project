Data for this project was obtained from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Here is an excerpt from their README.txt describing the experiment used to collect data:
========================================================================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person 
performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone 
(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration 
and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data 
manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for 
generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-
width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and 
gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff 
frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency 
domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on 
Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living 
(IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

=======================================================================================================================


Our final (tidy) data set contains means of all 66 features containing mean() or std() by subject and activity, for a 
total of 180 rows and 68 columns.  The final data set is written as a .txt file called "course3project.txt".  Specific 
variables are described below:

1) subject	- subject ID (1-30)
2) activity - one of 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

The remaining 66 columns reflect means across a specific subject and activity.  Note that the measurements are standardized 
on a -1 to 1 scale and thus unitless.  Here is a guide to these variable names:
 - "time" refers to the time domain of the signal
 - "frequency" refers to the frequency domain of the signal from a FFT
 - "Body" refers to the Body component of the accelerometer readings
 - "Gravity" refers to the Gravity component of the accelerometer readings
 - "Mean" refers to original data that was a calculated signal average in a window sample
 - "SD" refers to original data that was a calculated standard deviation of signals in a window sample
 - "axis" refers to the direction of the signal (X, Y, or Z direction)
 - "Jerk" refers to a measure derived from body linear acceleration and angular velocity
 - "Magnitude" refers to signal magnitude based on Euclidean norm
3) timeBodyAccelerometer-Mean-Xaxis	
4) timeBodyAccelerometer-Mean-Yaxis	
5) timeBodyAccelerometer-Mean-Zaxis	
6) timeBodyAccelerometer-SD-Xaxis	
7) timeBodyAccelerometer-SD-Yaxis	
8) timeBodyAccelerometer-SD-Zaxis	
9) timeGravityAccelerometer-Mean-Xaxis	
10) timeGravityAccelerometer-Mean-Yaxis	
11) timeGravityAccelerometer-Mean-Zaxis	
12) timeGravityAccelerometer-SD-Xaxis	
13) timeGravityAccelerometer-SD-Yaxis	
14) timeGravityAccelerometer-SD-Zaxis	
15) timeBodyAccelerometerJerk-Mean-Xaxis	
16) timeBodyAccelerometerJerk-Mean-Yaxis	
17) timeBodyAccelerometerJerk-Mean-Zaxis	
18) timeBodyAccelerometerJerk-SD-Xaxis	
19) timeBodyAccelerometerJerk-SD-Yaxis	
20) timeBodyAccelerometerJerk-SD-Zaxis	
21) timeBodyGyroscope-Mean-Xaxis	
22) timeBodyGyroscope-Mean-Yaxis	
23) timeBodyGyroscope-Mean-Zaxis	
24) timeBodyGyroscope-SD-Xaxis	
25) timeBodyGyroscope-SD-Yaxis	
26) timeBodyGyroscope-SD-Zaxis	
27) timeBodyGyroscopeJerk-Mean-Xaxis	
28) timeBodyGyroscopeJerk-Mean-Yaxis	
29) timeBodyGyroscopeJerk-Mean-Zaxis	
30) timeBodyGyroscopeJerk-SD-Xaxis	
31) timeBodyGyroscopeJerk-SD-Yaxis	
32) timeBodyGyroscopeJerk-SD-Zaxis	
33) timeBodyAccelerometerMagnitude-Mean	
34) timeBodyAccelerometerMagnitude-SD	
35) timeGravityAccelerometerMagnitude-Mean	
36) timeGravityAccelerometerMagnitude-SD	
37) timeBodyAccelerometerJerkMagnitude-Mean	
38) timeBodyAccelerometerJerkMagnitude-SD	
39) timeBodyGyroscopeMagnitude-Mean	
40) timeBodyGyroscopeMagnitude-SD	
41) timeBodyGyroscopeJerkMagnitude-Mean	
42) timeBodyGyroscopeJerkMagnitude-SD	
43) frequencyBodyAccelerometer-Mean-Xaxis	
44) frequencyBodyAccelerometer-Mean-Yaxis	
45) frequencyBodyAccelerometer-Mean-Zaxis	
46) frequencyBodyAccelerometer-SD-Xaxis	
47) frequencyBodyAccelerometer-SD-Yaxis	
48) frequencyBodyAccelerometer-SD-Zaxis	
49) frequencyBodyAccelerometerJerk-Mean-Xaxis	
50) frequencyBodyAccelerometerJerk-Mean-Yaxis	
51) frequencyBodyAccelerometerJerk-Mean-Zaxis	
52) frequencyBodyAccelerometerJerk-SD-Xaxis	
53) frequencyBodyAccelerometerJerk-SD-Yaxis	
54) frequencyBodyAccelerometerJerk-SD-Zaxis	
55) frequencyBodyGyroscope-Mean-Xaxis	
56) frequencyBodyGyroscope-Mean-Yaxis	
57) frequencyBodyGyroscope-Mean-Zaxis	
58) frequencyBodyGyroscope-SD-Xaxis	
59) frequencyBodyGyroscope-SD-Yaxis	
60) frequencyBodyGyroscope-SD-Zaxis	
61) frequencyBodyAccelerometerMagnitude-Mean	
62) frequencyBodyAccelerometerMagnitude-SD	
63) frequencyBodyBodyAccelerometerJerkMagnitude-Mean	
64) frequencyBodyBodyAccelerometerJerkMagnitude-SD	
65) frequencyBodyBodyGyroscopeMagnitude-Mean	
66) frequencyBodyBodyGyroscopeMagnitude-SD	
67) frequencyBodyBodyGyroscopeJerkMagnitude-Mean	
68) frequencyBodyBodyGyroscopeJerkMagnitude-SD