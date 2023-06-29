function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
    % G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations
	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed
    
    % Get the size of the matrix G
    n = size(G, 1);
    % Initialize the solution vector x to the initial guess x0
    x = x0;
    % Initialize the error to infinity and the number of steps to 0
    err =inf;
    steps = 0;

    % Iterate until the maximum number of steps is reached
    while steps < max_steps
        x_old = x;
        % formula for Jacobi
        x = (c + G * x_old );
        err = norm(x - x_old);

     % If the error is below the tolerance, break out of the loop
            if err < tol
                break;
            end
        steps = steps + 1;
    end


    % flip sign of negative solution values
    x(x < 0) = -x(x < 0);
    % actualize steps
    steps = steps + 1;

endfunction
