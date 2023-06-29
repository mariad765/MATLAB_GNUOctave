function [Y, InitialMatrix] = parse_csv_file(file_path)
  % file_path -> a relative path to the .csv file
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix that must be transformed

  % Open the file for reading
    fid = fopen(file_path, 'r');

    % Read the first line to skip the column names
    fgetl(fid);

    % Read the rest of the data
    i = 0;
    % Read the file until the end of the file is reached
    while ~feof(fid)
        i = i + 1;
        % Read the next line of data
        line = fgetl(fid);
        % split a string line into an array of substrings using
        % a comma , as the delimiter
        values = strsplit(line, ',');
        % Extract the label and store it in Y
        Y(i) = str2double(values{1});

        % Extract the rest of the data and store it in InitialMatrix
        for j = 2:numel(values)
            % Remove leading and trailing whitespace characters from the string
            value = strtrim(values{j});

            if isnan(str2double(value))
                InitialMatrix{i, j-1} = value;
            else
                InitialMatrix{i, j-1} = str2double(value);
            end

        end
    end

    % Close the file
    fclose(fid);
    
endfunction