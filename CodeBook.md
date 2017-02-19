## Code Book

The raw data obtained from  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
The zip archive gets unarchived in `in/UCI HAR Dataset` folder  
`UCI HAR Dataset\test\*.txt` 3 files joined side by side into a data frame  
`UCI HAR Dataset\train\*.txt` 3 files joined side by side into a data frame  
Columns names for `X_*.txt` are taken from `UCI HAR Dataset\features.txt`  
`'activity_code'` name is used for the only column of `y_*.txt`  
`'subject'` name is used for the only column of `subject.txt`  
Then one data frame gets appended to the other  
`'activity_code'`, `'subject'`, and columns having `'mean('` and `'std('` in their names are filtered for a new data frame  
The activity code-to-label map is read from `UCI HAR Dataset\activity_labels.txt`  
A new column `'activity'` added to the new data frame based on the map  
The columns of the data frame are renamed to remove `'()'`, brought to lower case, and `'-'` are introduced as separators between words/abbreviations  
The resulted data frame gets written in `out/tidy_data.txt`  
This data frame gets aggregated using `mean()` function grouping by `'activity'`, `'subject'`  
The resulted data frame gets written in `out/tidy_data_mean.txt`  
  
All the actions are performed by a script `run_analysis.R` *provided in this folder*  
Read `README.md` file on how to run it  

`t-` - time domain signals  
`f-` - frequency domain signals  
  
### Description of the variables
| variable                       | description                                                                                                          |
|--------------------------------|----------------------------------------------------------------------------------------------------------------------|
| activity                       | activity a person performed                                                                                          |
| subject                        | a person who have taken part in the test                                                                             |
| t-body-acc-mean-x              | mean of body acceleration X axis signal                                                                              |
| t-body-acc-mean-y              | mean of body acceleration Y axis signal                                                                              |
| t-body-acc-mean-z              | mean of body acceleration Z axis signal                                                                              |
| t-body-acc-std-x               | standard deviation of body acceleration X axis signal                                                                |
| t-body-acc-std-y               | standard deviation of body acceleration Y axis signal                                                                |
| t-body-acc-std-z               | standard deviation of body acceleration Z axis signal                                                                |
| t-gravity-acc-mean-x           | mean of gravity acceleration X axis signal                                                                           |
| t-gravity-acc-mean-y           | mean of gravity acceleration Y axis signal                                                                           |
| t-gravity-acc-mean-z           | mean of gravity acceleration Z axis signal                                                                           |
| t-gravity-acc-std-x            | standard deviation of gravity acceleration X axis signal                                                             |
| t-gravity-acc-std-y            | standard deviation of gravity acceleration Y axis signal                                                             |
| t-gravity-acc-std-z            | standard deviation of gravity acceleration Z axis signal                                                             |
| t-body-acc-jerk-mean-x         | mean of body acceleration X axis jerk signal                                                                         |
| t-body-acc-jerk-mean-y         | mean of body acceleration Y axis jerk signal                                                                         |
| t-body-acc-jerk-mean-z         | mean of body acceleration Z axis jerk signal                                                                         |
| t-body-acc-jerk-std-x          | standard deviation of body acceleration X axis jerk signal                                                           |
| t-body-acc-jerk-std-y          | standard deviation of body acceleration Y axis jerk signal                                                           |
| t-body-acc-jerk-std-z          | standard deviation of body acceleration Z axis jerk signal                                                           |
| t-body-gyro-mean-x             | mean of body angular velocity X axis signal                                                                          |
| t-body-gyro-mean-y             | mean of body angular velocity Y axis signal                                                                          |
| t-body-gyro-mean-z             | mean of body angular velocity Z axis signal                                                                          |
| t-body-gyro-std-x              | standard deviation of body angular velocity X axis signal                                                            |
| t-body-gyro-std-y              | standard deviation of body angular velocity Y axis signal                                                            |
| t-body-gyro-std-z              | standard deviation of body angular velocity Z axis signal                                                            |
| t-body-gyro-jerk-mean-x        | mean of body angular velocity X axis jerk signal                                                                     |
| t-body-gyro-jerk-mean-y        | mean of body angular velocity Y axis jerk signal                                                                     |
| t-body-gyro-jerk-mean-z        | mean of body angular velocity Z axis jerk signal                                                                     |
| t-body-gyro-jerk-std-x         | standard deviation of body angular velocity X axis jerk signal                                                       |
| t-body-gyro-jerk-std-y         | standard deviation of body angular velocity Y axis jerk signal                                                       |
| t-body-gyro-jerk-std-z         | standard deviation of body angular velocity Z axis jerk signal                                                       |
| t-body-acc-mag-mean            | mean of Euclidean norm magnitude of body acceleration 3-axial signal                                                 |
| t-body-acc-mag-std             | standard deviation of Euclidean norm magnitude of body acceleration 3-axial signal                                   |
| t-gravity-acc-mag-mean         | mean of Euclidean norm magnitude of gravity acceleration 3-axial signal                                              |
| t-gravity-acc-mag-std          | standard deviation of Euclidean norm magnitude of gravity acceleration 3-axial signal                                |
| t-body-acc-jerk-mag-mean       | mean of Euclidean norm magnitude of body acceleration 3-axial jerk signal                                            |
| t-body-acc-jerk-mag-std        | standard deviation of Euclidean norm magnitude of body acceleration 3-axial jerk signal                              |
| t-body-gyro-mag-mean           | mean of Euclidean norm magnitude of body angular velocity 3-axial signal                                             |
| t-body-gyro-mag-std            | standard deviation of Euclidean norm magnitude of body angular velocity 3-axial signal                               |
| t-body-gyro-jerk-mag-mean      | mean of Euclidean norm magnitude of body angular velocity 3-axial jerk signal                                        |
| t-body-gyro-jerk-mag-std       | standard deviation of Euclidean norm magnitude of body angular velocity 3-axial jerk signal                          |
| f-body-acc-mean-x              | mean of body acceleration X axis Fast Fourier transformed signal                                                     |
| f-body-acc-mean-y              | mean of body acceleration Y axis Fast Fourier transformed signal                                                     |
| f-body-acc-mean-z              | mean of body acceleration Z axis Fast Fourier transformed signal                                                     |
| f-body-acc-std-x               | standard deviation of body acceleration X axis Fast Fourier transformed signal                                       |
| f-body-acc-std-y               | standard deviation of body acceleration Y axis Fast Fourier transformed signal                                       |
| f-body-acc-std-z               | standard deviation of body acceleration Z axis Fast Fourier transformed signal                                       |
| f-body-acc-jerk-mean-x         | mean of body acceleration X axis Fast Fourier transformed jerk signal                                                |
| f-body-acc-jerk-mean-y         | mean of body acceleration Y axis Fast Fourier transformed jerk signal                                                |
| f-body-acc-jerk-mean-z         | mean of body acceleration Z axis Fast Fourier transformed jerk signal                                                |
| f-body-acc-jerk-std-x          | standard deviation of body acceleration X axis Fast Fourier transformed jerk signal                                  |
| f-body-acc-jerk-std-y          | standard deviation of body acceleration Y axis Fast Fourier transformed jerk signal                                  |
| f-body-acc-jerk-std-z          | standard deviation of body acceleration Z axis Fast Fourier transformed jerk signal                                  |
| f-body-gyro-mean-x             | mean of body angular velocity X axis Fast Fourier transformed signal                                                 |
| f-body-gyro-mean-y             | mean of body angular velocity Y axis Fast Fourier transformed signal                                                 |
| f-body-gyro-mean-z             | mean of body angular velocity Z axis Fast Fourier transformed signal                                                 |
| f-body-gyro-std-x              | standard deviation of body angular velocity X axis Fast Fourier transformed signal                                   |
| f-body-gyro-std-y              | standard deviation of body angular velocity Y axis Fast Fourier transformed signal                                   |
| f-body-gyro-std-z              | standard deviation of body angular velocity Z axis Fast Fourier transformed signal                                   |
| f-body-acc-mag-mean            | mean of Euclidean norm magnitude of body acceleration Fast Fourier transformed 3-axial signal                        |
| f-body-acc-mag-std             | standard deviation of Euclidean norm magnitude of body acceleration Fast Fourier transformed 3-axial signal          |
| f-body-body-acc-jerk-mag-mean  | mean of Euclidean norm magnitude of body acceleration Fast Fourier transformed 3-axial jerk signal                   |
| f-body-body-acc-jerk-mag-std   | standard deviation of Euclidean norm magnitude of body acceleration Fast Fourier transformed 3-axial jerk signal     |
| f-body-body-gyro-mag-mean      | mean of Euclidean norm magnitude of body angular velocity Fast Fourier transformed 3-axial signal                    |
| f-body-body-gyro-mag-std       | standard deviation of Euclidean norm magnitude of body angular velocity Fast Fourier transformed 3-axial signal      |
| f-body-body-gyro-jerk-mag-mean | mean of Euclidean norm magnitude of body angular velocity Fast Fourier transformed 3-axial jerk signal               |
| f-body-body-gyro-jerk-mag-std  | standard deviation of Euclidean norm magnitude of body angular velocity Fast Fourier transformed 3-axial jerk signal |

