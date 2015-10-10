# Rowland’s Fomula

# an = an-1 + gcd(n,a-1)
# a2 = a1 + gcd(2, 7) = 8.
iterations = int(raw_input('Enter Iterations: '))

an = 0 
anmin1 = 7
primes = []
primes_sorted = []

for n in range (1,iterations):
	an = anmin1 + gcd(n, anmin1)
	diff = an - anmin1
	anmin1 = an
	if diff > 1:
		primes.append(diff)

dup = []
for i in primes:
	#print i
	if i not in dup:
		primes_sorted.append(i)
		dup.append(i)

print primes_sorted		
