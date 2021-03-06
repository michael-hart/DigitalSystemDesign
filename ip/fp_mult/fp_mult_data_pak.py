import struct
import numpy as np
from math import floor, cos

def floatToBits(f):
	""" Takes a float and returns the hex representation of that float
	in bytes, modified to single precision; also pads to 8 numbers """
	
	# Compensate for negative floats by encoding as positive, then manually changing MSB to negative
	negative = False
	if f < 0 :
		negative = True
		f *= -1
	s = struct.pack('>f', f)
	unpacked = hex(struct.unpack('>l', s)[0])
	postx = unpacked.split('x')[1]
	padded = postx.zfill(8)

	# Compensate for negative numbers
	if negative:
		x = int(padded[0], 16)
		# Add 8 to MSB
		x += 8
		padded = hex(x)[2] + padded[1:]
	return padded

def bitsToFloat(b):
	""" Takes a hex string and returns the corresponding double precision
	float """
	s = struct.pack('>l', int(b, 16))
	return struct.unpack('>f', s)[0]

def recordToString(rec):
	""" Given a tuple of opcode and three floats, formats in the form required by VHDL """
	return "(X\"{}\", X\"{}\")".format(floatToBits(rec[0]), floatToBits(rec[1]))

def createRecord(x):
	""" Takes float, x; connverts to numpy float32 to ensure matching precision;
	Calculates results for inner function; Result is returned as a tuple of arguments"""
	x32 = np.float32(x)
	expression_result = 0.5*x + (x**2) * cos(floor(x/4) - 32.0)

	return (x, float(expression_result))

# Check if function is main
if __name__ == '__main__':

	# Create test data points over the set 0:0.1:256
	test_data = [createRecord(i) for i in np.arange(0, 256, 0.1)]
	# test_data = [
	# 	createRecord(5),
	# 	createRecord(10)
	# ]

	print("Data collected successfully")
	# Print array of data to file
	# First read in all data 
	contents = []
	with open('fp_mult_data_pak.vhd', 'r') as f:
		contents = f.readlines()
	assert contents != []
	print("File read successfully")

	# Find line that defines the start of the array
	for i,line in enumerate(contents):
		if "data : data_t" in line:
			break
	if i == len(contents):
		print("Failed to find header line")
		quit()
	# i is the line number one line before data starts
	header = contents[:i+1]
	contents = contents[i+1:]

	# Find the line that contains );
	for i,line in enumerate(contents):
		if ");" in line:
			break
	if i == len(contents):
		print("Failed to find header line")
		quit()
	footer = contents[i:]

	# Write the file with the test data
	with open('fp_mult_data_pak.vhd', 'w') as f:
		f.writelines(header)

		for record in test_data[:-1]:
			f.write("\t\t{},\n".format(recordToString(record)))
		# Separate to avoid commas that break VHDL
		f.write("\t\t{}\n".format(recordToString(test_data[-1])))

		f.writelines(footer)

	print("File written successfully")
