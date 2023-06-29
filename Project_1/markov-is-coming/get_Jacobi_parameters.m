function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)
  % G -> iteration matrix
	% c -> iteration vector
  
    n = size(Link, 1)
    p=n-2;
    % Extract the first n by n submatrix of L as G
    G = Link(1:p, 1:p);
    c = Link(1:p,p+1);
    
endfunction
