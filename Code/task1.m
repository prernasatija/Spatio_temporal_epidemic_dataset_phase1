function [ filesList ] = task1( samplePath, windowLength, shiftLength, resolution )
    
    % setting paths.
    if exist('MWDB_Phase1/Output','dir') == 0
        mkdir('MWDB_Phase1' , 'Output');
    end
    
    %%%% Number of sample files in the directory %%%%
    D = dir([samplePath, '/*.csv']);
    files = {D.name};
    filesList = sort_nat(files);
    len = length(D);
    
    %%%% B. Quantization of the entries %%%%
    [bands] = getBands(resolution, 0, 0.25);

    % Center of band
    median = sum(bands, 2)/2;
    
    %%%% A. Normalization of data files %%%%
    outputEpidemic = 'MWDB_Phase1/Output/epidemic_word_file.csv';
    if exist(outputEpidemic,'file')
        delete(outputEpidemic);
    end
    for i = 1:len
        simulationFile = fullfile(samplePath, filesList(i));
        A = csvread(simulationFile{1}, 1, 2);
        Amax = max(A(:));
        Amin = min(A(:));
        A_norm = (A - Amin)/(Amax - Amin);
        for k = 1:resolution
            ind = find(A_norm >= bands(k, 1) & A_norm <= bands(k, 2));
            A_norm(ind) = median(k, 1);
        end

        %%%%%%% Window Length Shift %%%%%%%
        [m,n] = size(A_norm);
        for s = 1:n
            start = 1;  
            finish = windowLength;
            count = 1;
            W = zeros(1, 3 + windowLength);
            while(finish <= m) 
                W(count,:) = [i, s, start, (A_norm(start:finish, s))'];
                start = start + shiftLength;
                finish = finish + shiftLength;
                count = count + 1;
            end
            dlmwrite(outputEpidemic, W, '-append');
        end
    end
end

