function [path] = heuristic_greedy (start_position, probabilities, Adj)
% Heuristic greedy algorithm to find the path with the greatest probability to WIN
% start_position: the starting point in the labyrinth
% probabilities: vector of associated probabilities: including WIN and LOSE
% Adj: adjacency matrix
% path: the states chosen by the algorithm

    % Initialization
    n = length(probabilities);
    path = start_position;
    visited = false(1, n);
    visited(start_position) = true;

    % Main loop; while loop that continues to execute 
    % as long as the variable path is not empty
    while ~isempty(path)
        % Get current position
        position = path(end);
        
        % Check if current position is the WIN state
        if position <= length(probabilities) && probabilities(position) == 1
            return;
        end
        
        % Find unvisited neighbors with the greatest probability to WIN
        neighbors = find(Adj(position,:) & ~visited);
        [~, max_prob_neighbor_index] = max(probabilities(neighbors));
        
        % Add neighbor with greatest probability to WIN to path and mark as visited
        if ~isempty(neighbors)
            max_prob_neighbor = neighbors(max_prob_neighbor_index);
            path = [path, max_prob_neighbor];
            visited(max_prob_neighbor) = true;
        else
            path(end) = [];
        end
    end

    % No path to WIN state found
    path = [];
endfunction
