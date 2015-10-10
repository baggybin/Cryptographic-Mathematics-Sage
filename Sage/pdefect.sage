
E = EllipticCurve(GF(101),[0,17])

print E.cardinality()

curves = {}
counter = 0
for p in list(primes(5, 200)):
	if not p == 17:
		E = EllipticCurve(GF(p),[0,17])
		np = E.cardinality()
		print "Prime ", p, " ", np , "p-defect", (p + 1) - np 
		if ((p + 1) - np) == 0:
			curves[p] = (p + 1) - np 
			counter += 1

print counter