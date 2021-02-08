% PURPOSE: Convert a text string to a stream of 1/0 bits.
% INPUT: string message
% OUTPUT: vector of 1's and 0's.
% License: see LICENSE.md


function [bitstream] = text2bits(message)

% Convert to characters of '1' and '0' in a vector.
temp      = dec2bin(double(message))';
% Convert characters of '1' to 1.0  and '0' to 0.0.
bitstream = (temp(:) == '1')'