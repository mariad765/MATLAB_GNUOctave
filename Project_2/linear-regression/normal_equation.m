function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method
  % Theta -> the vector of weights

  [m, n] = size(FeatureMatrix);

  % Verify positive definiteness of FeatureMatrix
    if any(eig(FeatureMatrix' * FeatureMatrix) <= 0)
        fprintf('FeatureMatrix is not positive definite. Returning zeros vector.\n');
        Theta = zeros(size(FeatureMatrix, 2) + 1, 1);
        return;
    endif

    % separate case for square matrix
    if m==n
        % Initialize fitting parameters
      Theta = zeros(size(FeatureMatrix, 2), 1);
      

      % Calculate initial residual
      r = Y - FeatureMatrix * Theta;

      % Initialize search direction
      v = r;

      % Initialize iteration counter
      k = 0;

      % Calculate initial tolerance squared
      tolsquared = tol^2;

      % Iterate until convergence or max iterations reached
      while (k < iter) && (r' * r > tolsquared)
          % Calculate step size
          Av = FeatureMatrix * v;
          tk = (r' * r) / (v' * Av);

          % Update parameters
          Theta = Theta + tk * v;
          r_old = r;
          r = r_old - tk * Av;

          % Update search direction
          bk = (r' * r) / (r_old' * r_old);
          v = r + bk * v;

          % Increment iteration counter
          k = k + 1;
      end
      Theta = [0; Theta];
  endif

  % case for non-square matrix
  if m~=n
  Y=Y';
  A = FeatureMatrix' * FeatureMatrix;
  b = FeatureMatrix' * Y;
    % Initialize Theta to zeros
    Theta = zeros(size(FeatureMatrix,2),1);

    % Calculate initial residual
    r = b - A * Theta;
    display('merge');
    % Initialize search direction
    v = r;


    % Calculate initial squared tolerance
    tolsquared = tol^2;

    % Set iteration counter to zero
    k = 0;

    while (k < iter) && (r'*r > tolsquared)
        r_old = r;
        % Calculate step size
    
      t = (r' * r) / (v' * A * v);

        % Update estimate
        Theta = Theta + t * v;
      
        % Update residual
        r = r_old - t * A * v;

        % Update search direction
        sk = (r' * r) / (r_old' * r_old);
      v = r + sk * v;

        % Increment iteration counter
        k = k + 1;
    end

    % Set weight for bias term to zero
    Theta = [0; Theta];
  endif
  
endfunction