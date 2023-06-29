function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed  
  % FeatureMatrix -> the matrix with all training examples
  % jnew index is used to assign values to the corresponding 
  % elements in the FeatureMatrix

  [m, n] = size(InitialMatrix);
  FeatureMatrix = zeros(m, n+1);
  
  % Transform the initial matrix into a feature matrix
  for i = 1:m
  jnew=1;
    for j = 1:n
      % Check if the value is a number
      if isnumeric(InitialMatrix{i,j})
        FeatureMatrix(i,jnew) = InitialMatrix{i,j};
      elseif strcmp(InitialMatrix{i,j}, 'yes')
        FeatureMatrix(i,jnew) = 1;
      elseif strcmp(InitialMatrix{i,j}, 'no')
        FeatureMatrix(i,jnew) = 0;
      elseif strcmp(InitialMatrix{i,j}, 'semi-furnished') 
        FeatureMatrix(i,jnew) = 1;
        FeatureMatrix(i,jnew+1) = 0;
         jnew=jnew+1;
      elseif strcmp(InitialMatrix{i,j}, 'furnished')
        FeatureMatrix(i,jnew) = 0;
        FeatureMatrix(i,jnew+1) = 0;
         jnew=jnew+1;
      elseif strcmp(InitialMatrix{i,j}, 'unfurnished')
        FeatureMatrix(i,jnew) = 0;
        FeatureMatrix(i,jnew+1) = 1;
        jnew=jnew+1;
      else
        % Assign NaN to the corresponding element in the FeatureMatrix matrix
        FeatureMatrix(i,j) = NaN;
      end
      jnew=jnew+1;
    end
  end
  
endfunction