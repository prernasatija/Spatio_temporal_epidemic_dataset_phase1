function [  ] = task2( alpha, locationPath )

    outputFile_avg = 'MWDB_Phase1/Output/epidemic_word_file_avg.csv';
    outputFile_diff = 'MWDB_Phase1/Output/epidemic_word_file_diff.csv';
    
    % deleting old file if exists.
    if exist(outputFile_avg,'file')
        delete(outputFile_avg);
    end
    
    if exist(outputFile_diff,'file')
        delete(outputFile_diff);
    end
    
    % reading the graph and epidemic file
    L = xlsread(locationPath, 'B2:AZ52');
    fileName = 'MWDB_Phase1/Output/epidemic_word_file.csv';
    W = csvread(fileName);
    [Wr, Wc] = size(W);
    
    win_avg = zeros(Wr, Wc);
    win_diff = zeros(Wr, Wc);
    
    for i = 1:Wr
        f = W(i, 1);
        si = W(i,2);
        t = W(i, 3);
        sj = find(L(si,:) == 1);
        win = zeros(1, Wc - 3);
        for k = 1:size(sj,2)
            s = sj(1, k);
            % find index where file number = f, timestamp is same as t 
            % and state is s
            index = find(W(:,1) == f & W(:,2) == s & W(:,3) == t);
            win = win + W(index, 4:Wc);
        end
        % if state has no 1-hop neighbors
        if size(sj,2) == 0
            avg = 0;
        else
            avg = (win/size(sj,2));
        end
        win_i = W(i, 4:Wc);
        w = (alpha*win_i) + (1 - alpha)*avg;
        win_avg(i, :) = [f, si, t, w];
        w = (win_i - avg)./win_i;
        win_diff(i, :) = [f, si, t, w];
    end
    dlmwrite(outputFile_avg, win_avg);
    dlmwrite(outputFile_diff, win_diff);
end