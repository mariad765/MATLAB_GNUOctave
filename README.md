# MATLAB_GNUOctave
## Project 1: Labyrinth Escape Solver: Optimal Pathfinding with Markov Analysis and Cohen-Sutherland Codification

### Description:

The implemented program aims to find the best path for the robot to escape from a labyrinth. To find the optimal solution, I created a simple algorithm that takes into consideration the probability of reaching a winning zone by randomly choosing available directions for movement. The robot can move up, down, left, or right, but not diagonally. The labyrinth may contain walls that prevent the robot from moving between adjacent cells spatially. To identify the best possibilities, the program uses a method to determine the probability of reaching a winning exit in the labyrinth. The winning exits are located at the top or bottom and overlap with the upper and lower boundaries of the labyrinth. If the robot chooses such an exit, it is considered a win. The losing exits are located on the left or right and overlap with the side boundaries of the labyrinth. If the robot chooses such an exit, it is considered a loss. In the end, the program proposes an efficient solution to determine a path for the robot through the labyrinth using the probability data obtained in a more intelligent way than exhaustive search.

For this project, several functions have been implemented:

1. `parse_labyrinth`: Parses the text file containing the encoded representation of a maze and converts it into a matrix. The purpose of this function is to read the file and build the corresponding maze matrix.

2. `get_adjacency_matrix`: Converts the matrix resulting from parsing the maze into an adjacency matrix of the corresponding graph/Markov chain. The purpose of this function is to calculate the adjacency matrix of the maze graph. For this function, I decided to make some improvements that were not required in the task. The construction function of the adjacency matrix analyzes the encoding and will create a wall between two cells even if the encoding of the adjacent cell does not correspond to a wall. Thus, I try to avoid possible errors in case an invalid encoding is given for the maze, and the program can continue by considering the wall on both sides. Specific information about the maze encoding: The maze is stored as a matrix with m x n elements, each represented by a 4-bit integer, where each bit set to 1 represents a possible wall that hinders movement in that direction. In the used encoding, the b3 bit set to 1 indicates the presence of a wall to the north of the cell, the b2 bit set to 1 indicates the presence of a wall to the south of the cell, the b1 bit set to 1 indicates the presence of a wall to the east of the cell, and the b0 bit set to 1 indicates the presence of a wall to the west of the cell.

3. `get_link_matrix`: Converts the encoding matrix of a valid maze into an associated link matrix. The purpose of this function is to build the corresponding link matrix for the given maze. For implementation, I started with the adjacency matrix and found that instead of 1, it should be 1 divided by the sum of the elements on the row. I iterated through the adjacency matrix and created the link matrix using the discovered rule.

4. `get_Jacobi_parameters`: Calculates the matrix and iteration vector for the Jacobi method using the previously obtained link matrix. The purpose of this function is to calculate the parameters required for applying the Jacobi method to find the solution of the system. For implementation, I used the theory from the lecture. i know that A = N - P and A = D + L + U, where D is the diagonal matrix, L is the lower triangular matrix, and U is the upper triangular matrix. I specialized it for the Jacobi case where N = D. The matrix G is the inverse of N * P, and c is the inverse of N * vector b (the solutions).

5. `perform_iterative`: Applies the iterative method to find the solution of the system. The purpose of this function is to find a solution to the system by applying the iterative method. Initially, I applied Gauss-Seidel because it seemed more efficient. To apply Gauss-Seidel, I had to make modifications to the Jacobi parameters. In the end, I obtained the correct solution, but the error and number of steps did not match the reference. Then I applied the Jacobi method and obtained the correct results. The formula applied was x = G * x + c.

6. `heuristic_greedy`: Finds a valid path to the WIN state using the Greedy algorithm. The purpose of this function is to find a valid path from the starting position to the WIN state using the Greedy algorithm. The Greedy algorithm always chooses the next node based on the highest probability of reaching the final node, without considering the total cost of the journey. The algorithm starts by initializing important variables such as the graph size (n), the path, and a visited vector that keeps track of whether a node has been visited or not. The algorithm continues by traversing the graph, starting from the starting position and moving to the unvisited neighbors of the current node. If the current node is the final node (WIN), the search stops; otherwise, it continues with the most probable unvisited neighbor. This process repeats until a final node is found or there are no more unvisited neighbors. If a path to the final node is not found, the function returns an empty path.

7. `decode_path`: Transforms the found path into a matrix of pairs representing the coordinates of the maze cells. The purpose of this function is to transform the found path into a matrix of pairs (row and column of the cells). This function converts a linear index to coordinates (i, j) in the given size matrix. During the transformation, the function also checks if the linear indices in the path list are valid, i.e., they are between 1 and the total number of cells in the maze matrix, and if not, it displays an error. The final result is a list of coordinates (i, j) representing the path through the maze.

Note: The above functions represent the core logic and steps involved in finding the best path for the robot to escape from the labyrinth.
 
## Project 2: Optimizing Linear Regression Models with CSV Data: Parameter Tuning and Performance Evaluation 


### Description: 

This project is closely related to artificial intelligence and machine learning. Linear Regression can help in handling predictions and errors that may occur in computational processing. Linear Regression can be geometrically interpreted as a line that minimizes the square root of the sum of distances of points (data) belonging to a set of interest. Linear Regression deals with minimizing the cost function and loss. There are various types of predictions, but for this task, multiple Linear Regression has been chosen. Essentially, it is a function. The specific coefficients of the Machine Learning model, also known as weights, describe how capable a model is of making predictions that are as accurate as possible (close to reality) after receiving new data that it has not seen before. The cost function measures the error between the actual value and the predicted value and needs to be minimized. Common optimization algorithms... Two common methods are the Gradient Descent method and the Normal Equation method. The Gradient Descent method is an iterative approach based on calculating the gradient of the cost function and adjusting the coefficients. On the other hand, the Normal Equation method is an analytical approach that involves solving a mathematical equation to find the optimal coefficients. The concept of regularization... Regularization is a method used in machine learning to reduce the variance error of a model, so that it can be generalized and have minimal error after introducing new data following its training. This method is used to control overfitting scenarios, where the model fits too well to the training data and cannot be generalized to new data. There are several types of regularization, such as L0, L1, and L2 regularization, as well as dropout regularization. These methods are powerful and popular in machine learning and can be used to improve the performance of models. For this task, we used L1 and L2 regularization.

For this project, several functions have been implemented:

parse_data_set_file(file_path): This function is used to parse the data from a file specified by the relative path file_path. It reads the file and stores the number of predictors n, the number of predictor vectors m, and the initial matrix InitialMatrix containing the predictor and output data. It returns the matrix Y containing the outputs and the InitialMatrix. Y represents the first column of the file. To read from this file, the text is split, and the data type is checked, with display statements added to handle possible errors. Details about the functions used... The fgetl function is used to read a line from a file and return it as a string. The textscan function is used to read and interpret data from a text file or a string variable. Textscan can be used to read different data types, such as numeric values, strings, and formatted dates. In this case, textscan is used to read from a string initialized by the mentioned previous function. Since we are using different data types, the cell function is needed. A cell is a data structure that can store multiple values of different types in a single variable. Now that we have a cell variable, we use str2double() to convert the string result from the previous step into a double-precision number. We use the isnan() function to check if a given value can be converted to a number or not. If the given value cannot be converted to a number, then the respective value is kept as is and stored in the InitialMatrix. If the given value can be converted to a number, then the value is converted using the str2double() function.

prepare_for_regression(InitialMatrix): This function modifies the InitialMatrix so that it only contains numeric types. It replaces each position containing the string 'Yes' with the number 1 and each position containing the string 'No' with the number 0. Additionally, positions containing the strings 'semi-furnished', 'unfurnished', and 'furnished' will be split into two positions with the corresponding numeric values (1 and 0 for 'semi-furnished', 0 and 1 for 'unfurnished', and 0 and 0 for 'furnished'). The resulting matrix is stored in the FeatureMatrix variable. The isnumeric function is used to check the data type. If the type is not numeric, strcmp is used to compare the strings. For the newly created matrix, a new control variable j_new is needed because certain strings require adding 2 elements to the matrix.

linear_regression_cost_function(Theta, Y, FeatureMatrix): This function implements the cost function of linear regression. It receives the column vector Theta consisting of the coefficients θ1, . . . , θn ∈ R, the FeatureMatrix containing the predictor values, and the column vector Y containing the actual output values. This function calculates and returns the error of the cost function. For this function, the given formulas are used, with the note that I used the mean_squared_error = mean(squared_error); formula. It calculates the mean of squared errors and stores it in the "mean_squared_error" variable. The "mean" function is applied to the list of squared errors (squared_error), which means the sum of squared errors is calculated and divided by their count to obtain the mean. Otherwise, the given formula is followed. This modification was necessary to have the correct dimension of the final result.

parse_csv_file: CSV files contain data organized in a table format, where each row represents a record and each column represents a data feature. The parse_csv_file function reads this data and constructs the feature matrix FeatureMatrix, while the column of labels is stored in the Y variable. The file specified.



