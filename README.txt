-All .m files are in the code folder.
-Run phase1_main.m file and enter the inputs.
-First run task1.m. This task generates an epidemic word file. This task also calls another function get_bands.m file.
-Run task2.m to generate epidemic_word_file_avg and epidemic_word_file_diff.
-Input the file number which is an index of the sample simulation file and choice of word/avg/diff file to get the heat maps for that file. 
-Run task3.m.
Two heat maps will be generated corresponding to highest and lowest strengths.

Note: 
1) Task1.m must be run before Task2.m and Task2.m must be run before Task3.m as all the tasks are dependent tasks.
2) sort_nat.m file must be included in the MATLAB folder
3) All file path must be correct
4) While entering sample simulation file, enter a numeric value, this will be the index to that file in the directory
5) All sample simulation files must be .csv files.

Output Specifications:
For the original 50 cdv file, I have used w = 10, h = 2, r = 4, alpha = 0.5
The heat maps are for input file 1.csv and epidemic_word_file

For sample1.csv, w = 10, h = 2, r = 10, alpha = 0.5
and sample2.csv, w = 10, h = 2, r = 4, alpha = 0.5

There are two output folders, ‘Output’ folder for the output of original 50 files and ‘Output_sample_data’ for the output of sample1 and sample2 files. 




