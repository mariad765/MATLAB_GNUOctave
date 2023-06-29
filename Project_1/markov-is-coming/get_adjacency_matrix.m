function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  % Adj -> the adjacency matrix associated to the given labyrinth
  % wall -> the codding of the cell will tell if there is a wall

    % get the size of the Labyrinth matrix
    [m, n] = size(Labyrinth);
    % calculate the total number of elements in the Labyrinth matrix
    N = m * n;
    % init matrix
    Adj = sparse(N+2, N+2);

    % check the wall connections
    for i = 1:m
        for j = 1:n
            walls = Labyrinth(i,j);
            idx = (i-1)*n + j;

            % Check if the cell is connected to win state
            if( (i == 1 && bitget(walls, 4) == 0) || 
            (i == m && bitget(walls, 3) == 0))
                Adj(idx, N+1) = 1; % Connect to win state
                Adj(N+1, idx) = 1;
            end

            % Check if the cell is connected to a lost state
            if ((j == 1 && bitget(walls, 1) == 0) || 
            (j == n && bitget(walls, 2) == 0))
                Adj(idx, N+2) = 1; % Connect to lost state
                Adj(N+2, idx) = 1;
            end

          % Check adjacent cells for walls and connect accordingly
            if (i > 1 && bitget(Labyrinth(i-1,j), 3) == 0 && 
            bitget(walls, 4) == 0)
                Adj(idx, idx-n) = 1; % Connect upward
                Adj(idx-n, idx) = 1; % Connect downward
            end
            if (i < m && bitget(Labyrinth(i+1,j), 4) == 0 && 
            bitget(walls, 3) == 0)
                Adj(idx, idx+n) = 1; % Connect downward
                Adj(idx+n, idx) = 1; % Connect upward
            end
            if (j > 1 && bitget(Labyrinth(i,j-1), 2) == 0 && 
            bitget(walls, 1) == 0)
                Adj(idx, idx-1) = 1; % Connect leftward
                Adj(idx-1, idx) = 1; % Connect rightward
            end
            if (j < n && bitget(Labyrinth(i,j+1), 1) == 0 && 
            bitget(walls, 2) == 0)
                Adj(idx, idx+1) = 1; % Connect rightward
                Adj(idx+1, idx) = 1; % Connect leftward
            end
        end
    end

    % Set up win and lost states
    % iterate over all the nodes in the adjacency matrix
     for i = 1:N
      if(i!=N+1)
        Adj(N+1, i) = 0; % No connection to win state
      end
      if(i!=N+2)
        Adj(N+2, i) = 0; % No connection to lost state
      end
    end
    Adj(N+1, N+2) = 0; % No connection between win and lost states
    Adj(N+2, N+1) = 0;
    Adj(N+2, N+2) = 1;
    Adj(N+1, N+1) = 1;
  
endfunction
