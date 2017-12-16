function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    theta_0_sum = 0;
    theta_1_sum = 0;

    for row_num = 1:m
        hypothesis_y = theta' * X(row_num,:)';
        delta = hypothesis_y - y(row_num);
        theta_0_sum = theta_0_sum + delta*X(row_num, 1);
        theta_1_sum = theta_1_sum + delta*X(row_num, 2);
    end


    theta(1) = theta(1); - (alpha/m)*theta_0_sum;
    theta(2) = theta(2); - (alpha/m)*theta_1_sum;


    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
