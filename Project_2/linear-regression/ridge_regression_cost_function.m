function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  % shrinkage applied to the regression coefficients
  % Error -> the error of the regularized cost function

 [m, n] = size(FeatureMatrix);
 
  % predicted values
  predictions = FeatureMatrix * Theta(2:end) + Theta(1);

  % residual
  residual = Y - predictions;

  % L2 of coefficients (excluding bias term)
  L2 = sum(Theta(2:end).^2,1);

  % cost function
  squared_error = sum(residual.^2, 1);
  mean_squared_error = mean(squared_error);
  Error = (1/(2*m))*mean_squared_error + lambda*L2;
  
endfunction
