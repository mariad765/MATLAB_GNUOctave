function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% lines -> numeber of lines
	% cols -> number of columns
    % decoded_path -> vector of pairs (line_index, column_index)
    % decoded_path does not contain indices for the WIN state


    decoded_path = zeros(size(path, 1)-1, 2);

    for i = 1:length(path)-1
        % Check if the current index is invalid
        if path(i) < 1 || path(i) > lines*cols
            error('Invalid index: %d', path(i));
        end

        % Calculate the row and column of the current index
        row = ceil(path(i)/cols);
        col = mod(path(i)-1, cols)+1;
        % Store the row and column in the decoded_path matrix
        decoded_path(i, :) = [row, col];
    end

end