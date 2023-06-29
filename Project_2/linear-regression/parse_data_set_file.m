function [Y, InitialMatrix] = parse_data_set_file(file_path)
% cell array is a one-dimensional array that can contain 
% any type of data

   % open the file for reading
    fid = fopen(file_path, 'r');

    % first line; get the dimensions of the data
    first_line = fgetl(fid);
    dimensions = textscan(first_line, '%d %d');
    m = dimensions{1};
    n = dimensions{2};

    % initialize the output variables
    Y = zeros(m, 1);
    % create a cell array with m rows and n columns
    InitialMatrix = cell(m, n);

    % Read the rest of the data
    for i = 1:m
        % Read the next line of data
        line = fgetl(fid);

        % Extract values from the line using textscan
        values = textscan(line, '%s');

        % Extract the label and store it in Y
        Y(i) = str2double(values{1}{1});

        % Extract the rest of the data and store it in InitialMatrix
        for j = 1:n
            value = values{1}{j+1};
            % Convert the value to a double precision numbe
            % Check if the number is NaN
           if isnan(str2double(value))
                InitialMatrix{i, j} = value;
            else
                InitialMatrix{i, j} = str2double(value);
            end
        end
    end

    % Close the file
    fclose(fid);
    
endfunction
