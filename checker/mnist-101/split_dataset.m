function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset
  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels
  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples

  
  m = size(X, 1);
  % Generate a random permutation of the integers from 1 to m
  idx = randperm(m);
  X = X(idx, :);
  y = y(idx, :);
  m_train = round(m * percent);
  % Split the matrix X and vector y into training and test sets
  X_train = X(1:m_train, :);
  y_train = y(1:m_train, :);
  X_test = X(m_train+1:end, :);
  y_test = y(m_train+1:end, :);

endfunction