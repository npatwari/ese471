% PURPOSE:  Find symbol vector from an N-dimensial list of symbol vectors 
%           that is closest to the given passed in point
% INPUTS:
%   point:   vector representing measured point
%   M_ary_points:  matrix listing possible symbol vectors to be searched,
%                  with each column representing a different symbol vector
%                 
% OUTPUT:  
%   closest_symbol_zeroindexed:  
%       Number of the matching symbol vector (between 0 and M-1) in 
%       M_ary_points that was closest to the "dim" dimensional point 
%       represented by the passed in variable point. 
%
% Author: Neal Patwari, Feb 2019

function closest_symbol_zeroindexed = findClosest(point,M_ary_points)

dim     = length(point);
symbols = size(M_ary_points,2);
dist    = zeros(symbols,1);
for i = 1:symbols
    accum = 0;
    for j = 1:dim
        accum = accum + (M_ary_points(j,i) - point(j)).^2;
    end
    dist(i) = sqrt(accum);
end
[~, ind] = min(dist);
closest_symbol_zeroindexed = ind -1;
    