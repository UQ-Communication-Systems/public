This folder contains elements useful for performing communication systems using MATLAB. Most of the functions are in built functions in MATLAB, and hence will only be a short guide on how to use those functions.

In other cases, there are some compatibility wrappers for Octave, so that we can focus on using one function instead of many types.

## Description

- `read_complex_byte.m`: This function reads a file recorded with the RTL-SDR dongle and returns a complex vector with the samples. The samples are normalised to between -1 and 1.

- `Theoretical_Error_Rates_QFunc_MATLAB.ipynb`: This notebook contains some calculations for the theoretical error rates of a communication system. It uses both the qfunc and qfuncinv functions in MATLAB.