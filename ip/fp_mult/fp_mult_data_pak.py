import struct
import numpy as np

def floatToBits(f):
	""" Takes a float and returns the hex representation of that float
	in bytes, modified to single precision """
	s = struct.pack('>f', f)
	return hex(struct.unpack('>l', s)[0])[2:]

def bitsToFloat(b):
	""" Takes a hex string and returns the corresponding double precision
	float """
	s = struct.pack('>l', int(b, 16))
	return struct.unpack('>f', s)[0]

def recordToString(rec):
	""" Given a tuple of three floats, formats in the form required by VHDL """
	return "(X\"{}\", X\"{}\", X\"{}\")".format(floatToBits(rec[0]), floatToBits(rec[1]), floatToBits(rec[2]))

def createRecord(a, b):
	""" Given two floats a and b, converts to float32 using numpy, then 
	formats both numbers and the result as a tuple """
	a32 = np.float32(a)
	b32 = np.float32(b)
	return (a, b, float(a32 * b32))

# Check if function is main
if __name__ == '__main__':
	# Collect array of floats for test data
	test_data = [
		# Test 1x1
		createRecord(1.0, 1.0),
		# Test 2x0.5
		createRecord(2.0, 0.5),
		# Test 1000 x 20
		createRecord(1000.0, 20.0),
		# Test 49 x 2.1223
		createRecord(49, 2.1223)
	]
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