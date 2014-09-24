function [ highest, lowest] = task3( samplePath, locationFile, fileIndex, file_number, filePath )
    % reading the connectivity graph file into location matrix L and states 
    %  in the form of string data into states matrix
    [L, states] = xlsread(locationFile);
    states = states(1,2:size(states,2));
    
    path = fullfile(samplePath, fileIndex{file_number});
    A = csvread(path, 1, 2);

    W = csvread(filePath);
    [ ~, Wc] = size(W);
    indices = find(W(:,1) == file_number);
    win = W(indices, 4:Wc);
    
    %Finding the 2-norm
    strengths = sqrt(sum((win.^2), 2));
    [~, max_index] = max(strengths);
    [~, min_index] = min(strengths);
    
    % get index of highest and lowest strength states
    highest = indices(max_index);
    lowest = indices(min_index);
    sh = W(highest, 2);
    sh_neighbors = find(L(sh,:) == 1);
    sl = W(lowest, 2);
    sl_neighbors = find(L(sl,:) == 1);
    
    % Heat Map for Highest Strength
    figure(1);
    heatMap = imagesc(A');
    sh_states = [sh sh_neighbors];
    
    % Calling function for highlighting states on the heatmap
    highlight_states(sh_states, states);
    ylabel('States');
    xlabel('Time Stamps');
    title(strcat('Heatmap for window of states with highest strength'));

    
    % Heat Map for Lowest Strength
    figure(2);
    heatMap = imagesc(A');
    
    % Calling function for highlighting states on the heatmap
    highlight_states([sl sl_neighbors], states);
    ylabel('States');
    xlabel('Time Stamps');
    title(strcat('Heatmap for window of states with lowest strength'));

end

