def calc2(n):

	## if modulus division by 8 returns either 3,5
	## return a -1
	if n % 8 == 3 or n % 8 == 5: 
		return -1
	else: 
		return 1
#n m
def jacobi(n,m):
	# Default 
	negative = 1

	if gcd(n,m) != 1:
		return 0

	while n > 1:
	## test to see if a swap should happen
	## Both Odd, and Lower M is larger than Higher
		if (m > n) and (n % 2 == 1) and (m % 2 == 1):
			#swap them
			t = n
			n = m
			m = t

			# negeative test
			# Modulo Devision by 4
			# if congruent to 3, then set Symbol -1
			if mod(n,4) == 3 and mod(m,4) == 3:
				negative *=  -1
			#Important mod
			n = n % m 
			print "(",negative,")",n,"/",m

			#n = mod(m,n)

		# else if the A is Even do this
		elif n % 2 == 0:
			n = n/2
			## Check to see if M is = 3 or 5 mod 8
			## Multiply to get appropriate sign depending on previous Postive/Negative value
			negative *= calc2(m)
			print "(",negative,")",n,"/",m

	return negative

print """jacobi(222,337), "<<<-----"""

print jacobi(222,337), "<<<-----"

print """jacobi(55,101), "<<<-----"""

print jacobi(55,101), "<<<-----"

print """jacobi(346,557), "<<<-----"""

print jacobi(346,557), "<<<-----"

print "**********"

print """jacobi(17,2015), "<<<-----"""

print jacobi(17,2015), "<<<-----"
print """jacobi(345,1247), "<<<-----"""

print jacobi(345,1247), "<<<-----"

print """jacobi(7811,35953), "<<<-----"""

print jacobi(7811,35953), "<<<-----"
# for num in range(77):
# 	print num, "Jacobi Symbol" ,jacobi(num,77)


# p = int(raw_input("Enter Number : "))
# print isPrime(p,5)

#http://math.fau.edu/richman/jacobi.htm
'''
The Jacobi symbol, (m/n), is defined whenever n is an odd number. 
It has the following properties that enable it to be easily computed.
(a/n) = (b/n) if a = b mod n.
(1/n) = 1 and (0/n) = 0.
(2m/n) = (m/n) if n = ±1 mod 8. Otherwise (2m/n) = ¯(m/n).
(Quadratic reciprocity) If m and n are both odd, 
then (m/n) = (n/m) unless both m and n are congruent to 3 mod 4, in which case (m/n) = ¯(n/m).
If n is a prime, then (m/n) = 1 exactly when m is a nonzero square mod n (a quadratic residue).
'''
