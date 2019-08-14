function [Ainv] = Gaussian(matrix)
% GAUSSIAN finds inverse of matrix by row reduction

% create identity matrix equal in size to input matrix
I = eye(size(matrix));
% set variable a to equal input matrix augmented with I
a = horzcat(matrix,I);

% set variables m and n to equal the size of matrix a's row and column
[m,n] = size(a);

% FORWARD ROW REDUCTION
% for rows i from 1 to the last
for i = 1 : m
    % for row zero from row below i to last row
    for zero = i+1 : m
        % IF DIAGONAL ELEMENT IS ZERO
        if a(i,i) == 0
            % set variable t to row i
            t = a(i,:); 
            % set row i to the row below
            a(i,:) = a(zero,:);
            % set row below to variable t
            a(zero,:) = t;
        end
    end
    % for row j from one row behind i to the last
    for j = i+1 : m
        % replace row j with j - i multiplied by first element of j over
        % diagonal element of the row above
    a(j,:) = a(j,:) - a(i,:) * a(j,i) / a(i,i);
    end
end

% BACKWARD ROW REDUCTION
% for row i from the last to the second increments of -1
for i = m : -1 : 2
    % for row j from one behind row i to the first increments of -1
    for j = i-1 : -1 : 1
        % replace row j with j - i multiplied by first element of j over
        % diagonal element of the row above
        a(j,:) = a(j,:) - a(i,:) * a(j,i) / a(i,i);
    end
end

% REDUCES DIAGONAL TO 1
% for row s from 1 to the the last
for s = 1 : m
    % replace row elements in row s with each s element divided by the
    % diagonal value on the same row
    a(s,:) = a(s,:) / a(s,s);
    
end
% set variable to  all rows of matrix a and columns from one greater than
% the total rows to the last i.e. the new identity portion of the augmented
% matrix
Ainv = a(:, m+1 : n);
end

