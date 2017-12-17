function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
dimensions = size(X)(2);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %

    temp_theta = theta;

    for dimension = 1:dimensions
        sum = 0;
            for row = 1:m
                hypothesis_y = theta' * X(row,:)';
                delta = hypothesis_y - y(row);
                sum = sum + delta*X(row, dimension);
            end
        temp_theta(dimension) = temp_theta(dimension)-(alpha/m)*sum;
    end

    theta = temp_theta;

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
