function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

for row = 1:m
	first_ = -y(row)*log(sigmoid(dot(theta', X(row,:))));
	second_ = (1-y(row))*log(1-sigmoid(dot(theta', X(row,:))));
	J = J + (first_ - second_);
end
J = J / m;

for row = 1:m
	first_ = sigmoid(dot(theta', X(row,:)));
	second_ = y(row);
	grad = grad + (first_-second_)*X(row,:)';
end
grad = grad / m;


% =============================================================

end
