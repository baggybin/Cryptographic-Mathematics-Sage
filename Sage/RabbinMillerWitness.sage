#Rabbin Miller Witness
# Find a Rabin-Miller witness a > 8 for n = 1729.
n = 1729
q = n -1
k = 0
while not (q % 2):
	k = k + 1
	q = q/2

# print k
# print q
a = 8
witness = False

while (witness == False):
	A = mod(a,1729)
	B = A^q

	if (B == 1) or (B == -1):
		print "found a witness"
		print a
		witness = True
		break

	else:
		for k in range(k-1):
			B = B^B
			if (mod(B,1729) == -1):
				print "not a witness"
		if witness == False:
			a = a + 1

