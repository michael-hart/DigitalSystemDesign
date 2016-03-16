import numpy as np
from math import atan, degrees

def fixedToBits(x):
	""" Takes a float, interprets as fixed point value, and converts to hexadecimal 
	string for output """

	# Check for negative input
	y = int(x * 2**22)

	# Convert to hex string and fill to 8 places
	h = hex(y)[2:]
	return h.zfill(6).upper()

def recordToString(rec):
	""" Given a tuple of opcode and three floats, formats in the form required by VHDL """
	return "(X\"{}\")".format(fixedToBits(rec))

def createRecord(x):
	""" Takes float, x; converts to numpy float32 to ensure matching precision;
	Calculates results for arctangent; Result is returned as a float"""
	expression_result = atan(x)
	return float(expression_result)

# Check if function is main
if __name__ == '__main__':

	# Create test data points over the set 0:0.1:256
	test_data = [createRecord(2**-i) for i in range(32)]

	print("Data collected successfully")
	# Print array of data to file
	# First read in all data 
	contents = []
	with open('atan_pkg.vhd', 'r') as f:
		contents = f.readlines()
	assert contents != []
	print("File read successfully")

	# Find line that defines the start of the array
	for i,line in enumerate(contents):
		if "atan_table : atan_table_t" in line:
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
	with open('atan_pkg.vhd', 'w') as f:
		f.writelines(header)

		for record in test_data[:-1]:
			f.write("\t\t{},\n".format(recordToString(record)))
		# Separate to avoid commas that break VHDL
		f.write("\t\t{}\n".format(recordToString(test_data[-1])))

		f.writelines(footer)

	print("File written successfully")
