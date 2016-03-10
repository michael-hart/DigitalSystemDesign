from math import sqrt

def bitsToFixed(x):
	""" Takes integer and converts to 32-bit fixed point, 2 bits before dp. Returns float """
	return x * 2**-30

def getAn():
	y = 1
	for i in range(32):
		y *= sqrt(1 + (2**(-2*i)))
	return y

def getGainBits():
	An = getAn()
	print (1.0/An)
	x = (1.0/An) * 2**30
	print hex(int(x))
	h = hex(int(x))[2:]
	end = "0" * (8 - len(h))
	return h + end

print getAn()
print getGainBits()
