function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % Error -> the error of the regularized cost function

  m = length(Y);
  Theta=Theta(2:end);
  Error = (1 / (2 * m)) * sum((FeatureMatrix * Theta - Y) .^ 2);
  
endfunction