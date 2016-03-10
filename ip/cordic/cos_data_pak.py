import numpy as np
from math import pi, cos

def fixedToBits(x):
	""" Takes a fixed point value and converts to hexadecimal string for output """

	# Check for negative input
	y = int(x * 2**30)

	# Convert to hex string and fill to 8 places
	h = hex(y)[2:]
	return h.zfill(8).upper()

def recordToString(rec):
	""" Given a tuple of opcode and three floats, formats in the form required by VHDL """
	return "(X\"{}\", X\"{}\")".format(fixedToBits(rec[0]), fixedToBits(rec[1]))

def createRecord(x):
	""" Takes float, x; connverts to numpy float32 to ensure matching precision;
	Calculates results for inner function; Result is returned as a tuple of arguments"""
	x32 = np.float32(x)
	expression_result = cos(x)

	return (x, float(expression_result))

# Check if function is main
if __name__ == '__main__':

	# Create 500 test data points between 0 and pi/2
	test_data = [createRecord(i) for i in np.arange(0, pi/2.0, pi/500)]

	print("Data collected successfully")
	# Print array of data to file
	# First read in all data 
	contents = []
	with open('cos_data_pak.vhd', 'r') as f:
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
	with open('cos_data_pak.vhd', 'w') as f:
		f.writelines(header)

		for record in test_data[:-1]:
			f.write("\t\t{},\n".format(recordToString(record)))
		# Separate to avoid commas that break VHDL
		f.write("\t\t{}\n".format(recordToString(test_data[-1])))

		f.writelines(footer)

	print("File written successfully")
