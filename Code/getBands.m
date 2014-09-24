function [ bands ] = getBands( resolution, meu, sigma )
    % function to get bands for given resolution, meu, and sigma.
    length = zeros(resolution, 1);
    bands = zeros(resolution, 2);
    fun = @(x) exp(-(x-meu).^2/(2*sigma^2));
    for j = 1:resolution
        % computing length of various bands.
        length(j) = integral(fun, (j-1)/resolution, j/resolution)/integral(fun, 0, 1);
    end
    
    % poputating bands using length.
    bands(1, 2) = length(1, 1);
    for k = 2:resolution
        bands(k, 2) = length(k,1) + bands(k-1, 2);
        bands(k, 1) = bands(k-1, 2);
    end
end

