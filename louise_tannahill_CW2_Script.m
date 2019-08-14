% PROMPT MATRIX INPUT FROM USER
% set variable 'prompt' to equal string 'Enter square matrix for Gauss-Jordan evaluation:'
prompt = 'Enter square matrix for Gauss-Jordan evaluation:';

% set input from user after 'prompt' to variable A
A = input(prompt);

% set variables row and col to equal the size of matrix A's row and column
[row,col] = size(A);

% CHECKS THAT THE INPUT IS A SQUARE MATRIX BEFORE COMPUTING
% if variable row is equal to variable col i.e. square matrix
if row == col
    % find the inverse of variable A using function Gaussian
    inverseMat = Gaussian(A);

% DISPLAYS ERROR MESSAGE AND REQUEST INPUT AGAIN    
% if not, print string 'ERROR! MUST BE SQUARE MATRIX'
else
    disp('ERROR! MUST BE SQUARE MATRIX')
    % ask again for input from user after 'prompt' to set to variable A
    A = input(prompt);
end

% OUTPUT THE INVERSE MATRIX
inverseMat


