import struct
import numpy as np

def floatToBits(f):
	""" Takes a float and returns the hex representation of that float
	in bytes, modified to single precision; also pads to 8 numbers """
	s = struct.pack('>f', f)
	return (hex(struct.unpack('>l', s)[0])[2:]).zfill(8)

def bitsToFloat(b):
	""" Takes a hex string and returns the corresponding double precision
	float """
	s = struct.pack('>l', int(b, 16))
	return struct.unpack('>f', s)[0]

def recordToString(rec):
	""" Given a tuple of opcode and three floats, formats in the form required by VHDL """
	return "(\"{}\", X\"{}\", X\"{}\", X\"{}\")".format(rec[0], floatToBits(rec[1]), floatToBits(rec[2]), floatToBits(rec[3]))

def createRecord(a, b):
	""" Takes two floats, a and b; connverts to numpy float32 to ensure matching precision;
	Calculates results for addition, subtraction, multiplication, and division; Returns each test
	case, with the required opcode, as a list of tuples """
	a32 = np.float32(a)
	b32 = np.float32(b)

	results = [
		("00", a, b, float(a32 + b32)), 
		("01", a, b, float(a32 - b32)), 
		("10", a, b, float(a32 * b32)), 
		("11", a, b, float(a32 / b32))
	]

	return results

# Check if function is main
if __name__ == '__main__':
	# Collect array of floats for test data
	test_data = [
		# Test 1x1
		createRecord(1.0, 0.25),
		# Test 2x0.5
		createRecord(2.0, 0.5),
		# Test 1000 x 20
		createRecord(1000.0, 20.0),
		# Test 49 x 2.1223
		createRecord(49, 2.1223)
	]

	# Unpack list, which contains lists of records
	test_data_unpacked = []
	for test in test_data:
		for record in test:
			test_data_unpacked += [record]

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

		for record in test_data_unpacked[:-1]:
			f.write("\t\t{},\n".format(recordToString(record)))
		# Separate to avoid commas that break VHDL
		f.write("\t\t{}\n".format(recordToString(test_data_unpacked[-1])))

		f.writelines(footer)

	print("File written successfully")