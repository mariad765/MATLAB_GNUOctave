function [X, y] = load_dataset(path)
  % path -> a relative path to the .mat file that must be loaded
  % X, y -> the training examples (X) and their corresponding labels (y)
 
  % Load the data from the .mat file
  data = load(path);

  % Extract the feature matrix and the target vector
  X = data.X;
  y = data.y;

endfunction
