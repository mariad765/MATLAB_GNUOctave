function [Labyrinth] = parse_labyrinth(file_path)

    % Open the file for reading
    file = fopen(file_path, 'r');

    fprintf("Parsing file: %s\n", file_path);

    % Error check:
    if (file == -1)
        error("Could not open file: %s\n", file_path);
    end

    % Read in the matrix dimensions
    dims = fscanf(file, '%d', [1 2]);
    m = dims(1);
    n = dims(2);

    % Read in the matrix elements
     Labyrinth = zeros(m, n);
    for i = 1:m
        row = fscanf(file, '%d', [1 n]);
        Labyrinth(i,:) = row;
    end
 
    % close file
    fclose(file);

endfunction
