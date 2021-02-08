#! /usr/bin/env python

#
# License: see LICENSE.md
#
# Copyright (C) 2021  Neal Patwari
#
# 
# Author: Neal Patwari, npatwari@wustl.edu
#
# Version History:
#
# Version 1.0:  Initial Release.  Feb 2021.  For Python 3.6.10
#

import sys
import numpy as np
import scipy.spatial.distance as dist
import matplotlib.pyplot as plt
import matplotlib

matplotlib.rc('xtick', labelsize=16) 
matplotlib.rc('ytick', labelsize=16) 

# PURPOSE: Convert a text string to a stream of 1/0 bits.
# INPUT: string message
# OUTPUT: Numpy array of 1's and 0's.
def text2bits(message):

    # Initialize an empty list and iterate for each character.
    outlist = np.array([])
    for x in message:

        # ord(x) converts a character to int, 
        # "{:07b}".format() converts to a string with "1" and "0" for 7 bits
        # int(b) for b in converts each bit to a 1 or 0 integer
        # then we append to the outlist
        outlist = np.append(outlist, [int(b) for b in "{:07b}".format(ord(x))])

    return outlist


# PURPOSE: insert OS_RATE-1 zeros before each sample of the input 
#   in order to increase the sampling rate by a factor of OS_Rate
def oversample(x, OS_Rate):

    # Initialize output
    x_s = np.zeros(len(x)*OS_Rate)

    # Fill in one out of every OS_Rate samples with the input values
    x_s[range(OS_Rate-1, OS_Rate*len(x), OS_Rate)]= x

    return x_s


# PURPOSE:  Plot an eye diagram of a signal
#
# INPUTS:
#   y_s:    vector of signal samples out of the matched filter
#   N:      the number of samples per symbol.  Assumes that time 0 is 
#           at sample y_s(1).  If not, you must send in an offset integer.
#   offset: the number of samples at the start of y_s to ignore
#
def plot_eye_diagram(y_s, N, offset=0):

    # Each window should start N//2 before offset (+ integer*N)
    # and end at N//2 after offset.  We don't care much about the
    # very beginning and the very end.  The symbol period is N.
    start_indices = range( (N//2)+offset-1, len(y_s)-N-1, N )
    # What to plot on the time axis.
    time_vals     = np.arange(N+1)/N - 0.5

    for i in start_indices:
        plt.plot(time_vals, y_s[range(i, i+N+1)], 'b-', linewidth=2)
        plt.xlabel('Time t / T_s', fontsize=20)
        plt.ylabel('Matched Filter Output', fontsize=20)

#
# PURPOSE:  Convert a vector of (float) zeros and ones to a string (char array)
# INPUT:    Expects a row vector of zeros and ones, a multiple of 7 length
#   The most significant bit of each character is always first.
# OUTPUT:   A string
#
def binvector2str(binvector):

    totalbits = len(binvector)
    if ((totalbits%7) > 1e-6):
        sys.exit('Length of bit stream must be a multiple of 7 to convert to a string.  You must be missing a few bits or have a few extra.')
    
    # We are using 7 bits per character in ASCII encoding
    # Put 7 1/0s into each row of the row_per_char 2D array
    row_per_char = binvector.reshape( totalbits//7, 7)

    str_out = ''  # Initialize character vector
    for bit_ints in row_per_char:
        # Convert the vector of 1.0/0.0 into a string of '1' and '0'
        bitstring   = "".join(str(int(z)) for z in bit_ints)
        # Convert the string into an integer using base 2
        # then into an ascii character
        # Then add it to the end of str_out
        str_out    += chr(int( bitstring, 2))
    
    return str_out



