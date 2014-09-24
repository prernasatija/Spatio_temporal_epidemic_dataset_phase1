% Getting input from user.
inputDirPath = input('Enter the directory path: '); %'MWDB_Phase1/Sample2';
windowLength = input('Enter the window length: ');
shiftLength  = input('Enter shift length: ');
resolution = input('Enter the resolution: ');
display(inputDirPath);
display(windowLength);
display(shiftLength);
display(resolution);

% File index for sample simulation file
fileIndex = task1(inputDirPath, windowLength, shiftLength, resolution);

alpha = input('Enter the alpha value: ');
display(alpha);
locationMatrix = input('Enter the path of Connectivity Graph,G: '); %'MWDB_Phase1/Sample/LocationMatrix.xlsx';
display(locationMatrix);

% Calling task2 function
task2(alpha, locationMatrix);

fileSelected = input('Enter the simulation file: ');
display(fileSelected);

display('Enter 1 if the file selected is epidemic_word_file');
display('Enter 2 if the file selected is epidemic_word_file_avg');
display('Enter 3 if the file selected is epidemic_word_file_diff');

choice = input('Enter choice of file as 1, 2 or 3: ');
if choice == 1
    filePath = 'MWDB_Phase1/Output/epidemic_word_file.csv';
elseif choice == 2
    filePath = 'MWDB_Phase1/Output/epidemic_word_file_avg.csv';
elseif choice == 3
    filePath = 'MWDB_Phase1/Output/epidemic_word_file_diff.csv';
end
% Calling task3 function
[ highest, lowest] = task3( inputDirPath, locationMatrix, fileIndex, fileSelected, filePath );