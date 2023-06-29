function [Link] = get_link_matrix (Labyrinth)
% Labyrinth -> the matrix of all encodings  
% Link -> the link matrix associated to the given labyrinth
% the weights are the values in the adjacency matrix that 
% represent the strength or cost of the connection between 
% two nodes in the graph
  
    % Get the size of the labyrinth matrix
    [m, n] = size(Labyrinth);

    % total number of nodes in the graph
    N = m * n;

    % adjacency matrix for the labyrinth
    adjacency_matrix = get_adjacency_matrix(Labyrinth)

    % Initialize the Link matrix to a sparse matrix 
    % size (N+2) by (N+2) because of win and lose states
    Link = sparse(N+2, N+2);
    number = size(adjacency_matrix, 1);  % number of nodes in the graph

    for i = 1:number
        % sum of weights for outgoing edges from node i
        row_sum = sum(adjacency_matrix(i, :));  

        if row_sum ~= 0
            % normalize weights
            Link(i, :) = adjacency_matrix(i, :) / row_sum;  
        end
    end
    
endfunction
