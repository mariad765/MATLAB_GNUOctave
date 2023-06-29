function [matrix] = initialize_weights(L_prev, L_next)
  % L_prev -> the number of units in the previous layer
  % L_next -> the number of units in the next layer

  % Compute the value of epsilon
  epsilon = sqrt(6) / sqrt(L_prev + L_next);
  % Initialize the weights to random values in the range (-epsilon, epsilon)
  matrix = rand(L_next, L_prev + 1) * 2 * epsilon - epsilon;
  
endfunction
