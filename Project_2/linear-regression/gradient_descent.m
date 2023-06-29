function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)

    % Add bias term to feature matrix
    FeatureMatrix = [zeros(m, 1) FeatureMatrix];

    % Initialize fitting parameters
    Theta = zeros(n+1, 1);

    % Perform gradient descent
    for i = 1:iter
        % Calculate hypothesis
        H = FeatureMatrix * Theta;

        % Calculate error
        E = H - Y';

       % Calculate gradient
       G = (1/m) * FeatureMatrix' * E(:);

       % Check if dimensions of G match Theta
       if size(G) ~= size(Theta)
        error('Dimensions of G and Theta do not match')
       end

        % Update Theta
        Theta = Theta - alpha * G;
    end
    
end