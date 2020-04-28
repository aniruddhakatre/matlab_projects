% Project Euler - Problem 1
% https://projecteuler.net/problem=1
%
% If we list all the natural numbers below 10 that are multiples of 3 or 5,
% we get 3, 5, 6 and 9. The sum of these multiples is 23.
%
% Find the sum of all the multiples of 3 or 5 below 1000.
%
% Call this function:
% >> res = problem_1(10); 

function out = problem_1(n)

% Create array from 1 to all natural numbers below n
raw_values = 1:n-1;

% This uses implicit expansion and calculates mod(raw_values,3) and
% mod(raw_values,5) and contatenates results in a 2xn matrix. Then sets idx
% to true when remainder is zero.
valid_idx = any(mod(raw_values,[3;5]) == 0);

% Sum all values in raw_values corresponding to valid index
out = sum(raw_values(valid_idx));




