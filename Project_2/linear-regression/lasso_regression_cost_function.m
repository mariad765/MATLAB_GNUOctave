function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  % shrinkage applied to the regression coefficients
  % Error -> the error of the regularized cost function

 [m, n] = size(FeatureMatrix);
 
  % predicted values
  predictions = FeatureMatrix * Theta(2:end) + Theta(1);

  % resid
  residual = Y - predictions;

  % L1 norm of coefficients
  L1_norm = norm(Theta, 1);

  % cost function
  squared_error = sum(residual.^2, 1);
  mean_squared_error = mean(squared_error);
  Error = (1/m) * mean_squared_error + lambda * L1_norm;
  
endfunction