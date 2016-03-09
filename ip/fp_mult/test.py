import struct

def bitsToFloat(b):
	""" Takes a hex string and returns the corresponding double precision
	float """
	s = struct.pack('>l', b)
	return struct.unpack('>f', s)[0]
