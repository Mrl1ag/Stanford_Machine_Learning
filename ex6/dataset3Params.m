function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

C_list = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]';
s_list = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]';

bestC = 0;
bestSig = 0;

cError = 10000000000;

for i = 1:8
    
    for j = 1:8

        model = svmTrain(X, y, C_list(i), @(x1, x2) gaussianKernel(x1, x2, s_list(j)));
        
        predictions = svmPredict(model, Xval);
        
        err_val = mean(double(predictions ~= yval));
        
    if err_val < cError
            
    cError = err_val;
    
    bestC = C_list(i);
    bestSig =  s_list(j);
        
    end
end


C = bestC;
sigma = bestSig;

display(bestC); display(bestSig);



% =========================================================================

end
