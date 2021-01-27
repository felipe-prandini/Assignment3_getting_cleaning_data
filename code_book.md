# Assignment Code Book

# Description
This is a tidy data set derived from [this original experiment information](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
The features selected for this database come from the accelerometer and gyroscope of Samsung Galaxy S while used by subjects performing specific tasks
A series of measures were derived from the raw data of the devices and this projects transformed into a tidy dataset for posterior analysis

# Variables

## subject_id
The id of the study subject
- integer
- range: 0-30

## activityname
The name of the activity being performed by the subject
- character
1. walking
2. walking_upstairs
3. walking_downstairs
4. sitting
5. standing
6. laying

## measure
The measure calculated and derived from the raw data from the sensors
- character
### Structure:
All those measures refers to either:
1. the raw information collected from accelerometers and gyroscopes from the Samsung Galaxy S while some subjects performed a set of pre-defined tasks
2. measures derived from this raw information

First component
- time: time domain signals collected at a constant rate of 50Hz
- frequency: frequency domain signals. A Fast Fourier Transform (FFT) was applied to the raw signals producing those measures

Second Component (gyroscope data have only the body component)
The acceleration signal was separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz
- body: body acceleration signals separated by the low pass filter
- gravity: gravity acceleration signals separated by the low pass filter

Thrid Component
- acceleration: source of the signal is from the accelerometer
- gyroscope: source of the signal is form the gyroscope

Fourth Component (optional, may have both)
- jerk: Jerk signals derived in time from body linear acceleration and angular velocity
- magnitude: magnitude of these three-dimensional signals were calculated using the Euclidean norm 

Fith Component
- mean: mean value of the signal
- stdev: standard deviation value of the signal

Sixth Component (optional, not for magnitudes)
- axis (x, y or z): used to denote the direction of the signal in a 3-axial form

### all measures
1. "time_body_acceleration_mean_x": mean of the x component of time signal for body accellaration
2. "time_body_acceleration_mean_y": mean of the y component of time signal for body accellaration
3. "time_body_acceleration_mean_z": mean of the z component of time signal for body accellaration
4. "time_body_acceleration_stdev_x": standard deviation of the x component of time signal for body accellaration
5. "time_body_acceleration_stdev_y": standard deviation of the y component of time signal for body accellaration
6. "time_body_acceleration_stdev_z": standard deviation of the z component of time signal for body accellaration
7. "time_gravity_acceleration_mean_x": mean of the x component of time signal for gravity accellaration
8. "time_gravity_acceleration_mean_y": mean of the y component of time signal for gravity accellaration
9. "time_gravity_acceleration_mean_z": mean of the z component of time signal for gravity accellaration
10. "time_gravity_acceleration_stdev_x": standard deviation of the x component of time signal for gravity accellaration
11. "time_gravity_acceleration_stdev_y": standard deviation of the y component of time signal for gravity accellaration
12. "time_gravity_acceleration_stdev_z": standard deviation of the z component of time signal for gravity accellaration
13. "time_body_acceleration_jerk_mean_x": mean of the x component of jerk for time signal for body accellaration
14. "time_body_acceleration_jerk_mean_y": mean of the y component of jerk for time signal for body accellaration
15. "time_body_acceleration_jerk_mean_z": mean of the z component of jerk for time signal for body accellaration
16. "time_body_acceleration_jerk_stdev_x": standard deviation of the x component of jerk for time signal for body accellaration
17. "time_body_acceleration_jerk_stdev_y": standard deviation of the y component of jerk for time signal for body accellaration
18. "time_body_acceleration_jerk_stdev_z": standard deviation of the z component of jerk for time signal for body accellaration
19. "time_body_gyroscope_mean_x": mean of the x component for time signal from body gyroscope position
20. "time_body_gyroscope_mean_y": mean of the y component for time signal from body gyroscope position
21. "time_body_gyroscope_mean_z": mean of the z component for time signal from body gyroscope position
22. "time_body_gyroscope_stdev_x": standard deviation of the x component for time signal from body gyroscope position
23. "time_body_gyroscope_stdev_y": standard deviation of the y component for time signal from body gyroscope position
24. "time_body_gyroscope_stdev_z": standard deviation of the z component for time signal from body gyroscope position
25. "time_body_gyroscope_jerk_mean_x": mean of the x component of jerk for time signal from body gyroscope position
26. "time_body_gyroscope_jerk_mean_y": mean of the y component of jerk for time signal from body gyroscope position
27. "time_body_gyroscope_jerk_mean_z": mean of the z component of jerk for time signal from body gyroscope position
28. "time_body_gyroscope_jerk_stdev_x": standard deviation of the x component of jerk for time signal from body gyroscope position
29. "time_body_gyroscope_jerk_stdev_y": standard deviation of the y component of jerk for time signal from body gyroscope position
30. "time_body_gyroscope_jerk_stdev_z": standard deviation of the z component of jerk for time signal from body gyroscope position
31. "time_body_acceleration_magnitude_mean": mean of the magnitude of time signal for body accellaration
32. "time_body_acceleration_magnitude_stdev": standard deviation of the magnitude of time signal for body accellaration
33. "time_gravity_acceleration_magnitude_mean": mean of the magnitude of time signal for gravity accellaration
34. "time_gravity_acceleration_magnitude_stdev": standard deviation of the magnitude of time signal for gravity accellaration
35. "time_body_acceleration_jerk_magnitude_mean": mean of the magnitude of jerk of time signal for body accellaration
36. "time_body_acceleration_jerk_magnitude_stdev": standard deviation of the magnitude of jerk of time signal for body accellaration
37. "time_body_gyroscope_magnitude_mean": mean of the magnitude for time signal from body gyroscope position
38. "time_body_gyroscope_magnitude_stdev": standard deviation of the magnitude for time signal from body gyroscope position
39. "time_body_gyroscope_jerk_magnitude_mean": mean of the magnitude for jerk from time signal from body gyroscope position
40. "time_body_gyroscope_jerk_magnitude_stdev": standard deviation of the magnitude for jerk from time signal from body gyroscope position
41. "frequency_body_acceleration_mean_x": mean of the x component of frequency signal for body accellaration
42. "frequency_body_acceleration_mean_y": mean of the y component of frequency signal for body accellaration
43. "frequency_body_acceleration_mean_z": mean of the z component of frequency signal for body accellaration
44. "frequency_body_acceleration_stdev_x": standard deviation of the x component of frequency signal for body accellaration
45. "frequency_body_acceleration_stdev_y": standard deviation of the y component of frequency signal for body accellaration
46. "frequency_body_acceleration_stdev_z": standard deviation of the z component of frequency signal for body accellaration
47. "frequency_body_acceleration_jerk_mean_x": mean of the x component of jerk of frequency signal for body accellaration
48. "frequency_body_acceleration_jerk_mean_y": mean of the y component of jerk of frequency signal for body accellaration
49. "frequency_body_acceleration_jerk_mean_z": mean of the z component of jerk of frequency signal for body accellaration
50. "frequency_body_acceleration_jerk_stdev_x": standard deviation of the x component of jerk of frequency signal for body accellaration
51. "frequency_body_acceleration_jerk_stdev_y": standard deviation of the y component of jerk of frequency signal for body accellaration
52. "frequency_body_acceleration_jerk_stdev_z": standard deviation of the z component of jerk of frequency signal for body accellaration
53. "frequency_body_gyroscope_mean_x": mean of the x component for frequency signal from body gyroscope position
54. "frequency_body_gyroscope_mean_y": mean of the y component for frequency signal from body gyroscope position
55. "frequency_body_gyroscope_mean_z": mean of the z component for frequency signal from body gyroscope position
56. "frequency_body_gyroscope_stdev_x": standard deviation of the x component for frequency signal from body gyroscope position
57. "frequency_body_gyroscope_stdev_y": standard deviation of the y component for frequency signal from body gyroscope position
58. "frequency_body_gyroscope_stdev_z": standard deviation of the z component for frequency signal from body gyroscope position
59. "frequency_body_acceleration_magnitude_mean": mean of the magnitude of frequency signal for body accellaration
60. "frequency_body_acceleration_magnitude_stdev": standard deviation of the magnitude of frequency signal for body accellaration
61. "frequency_body_acceleration_jerk_magnitude_mean": mean of the magnitude of jerk from frequency signal for body accellaration
62. "frequency_body_acceleration_jerk_magnitude_stdev": standard deviation of the magnitude of jerk from frequency signal for body accellaration
63. "frequency_body_gyroscope_magnitude_mean": mean of the magnitude for frequency signal from body gyroscope position
64. "frequency_body_gyroscope_magnitude_stdev": standard deviation of the magnitude for frequency signal from body gyroscope position
65. "frequency_body_gyroscope_jerk_magnitude_mean": mean of the magnitude for jerk from frequency signal from body gyroscope position
66. "frequency_body_gyroscope_jerk_magnitude_stdev": standard deviation of the magnitude for jerk from frequency signal from body gyroscope position

## mean
The mean of observations for that particular measure, in that subject performing that particular activity
- num
- range: -1:1


