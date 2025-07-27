import numpy as np

# Maximum magnitude of a signed integers of different sizes
MAXI12Q11 = 2**11
MAXI8Q7 = 2**7


# Load SDR data from an RTLSDR (8-bit I/Q) file. Normalise the data to
# [-1, 1] and return as a complex array.
# To limit the amount of data loaded, specify MAX_SAMPLES
def read_complex_byte(filename, MAX_SAMPLES=-1):
    data = np.fromfile(filename, dtype=np.dtype('B'), count=MAX_SAMPLES)
    data = (np.array(data, dtype=float)-(MAXI8Q7-1))/MAXI8Q7
    data.dtype = complex
    return data


# Processes CS16 file into a numpy array of imaginary numbers
def read_complex_int16(filename, MAX_SAMPLES=-1):
    data = np.fromfile(filename, dtype=np.dtype('i2'), count=MAX_SAMPLES)
    data = (np.array(data, dtype=float)/MAXI12Q11)
    data.dtype = complex
    return data
