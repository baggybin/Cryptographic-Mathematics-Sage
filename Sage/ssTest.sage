# a = 345678
# n = 409537

# a = 13
# n = 561
a = int(raw_input("Enter a : "))
n = int(raw_input("Enter n : "))

if gcd(a,n) == 1:
	n2 = int((n-1)/2)
	print n2
	print power_mod(a,n2,n)
	print ""
	if (power_mod(a,n2,n) and jacobi(a,n)) == ((-1) or (1)):
		print "+ Passes the Solovay-Strassen Test ++++++++++++++"
	else:
		print "- Fails the Solovay-Strassen Test ---------------"
		print a, " Is an Euler Witness for ", n

def calc2(n):

	## if modulus division(b) by 8 returns either 3,5 
	## return a -1
	if n % 8 == 3 or n % 8 == 5: 
		return -1
	else: 
		return 1

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
		# else if the A is Even do this
		elif n % 2 == 0:
			n = n/2
			## Check to see if M is = 3 or 5 mod 8
			## Multiply to get appropriate sign depending on previous Postive/Negative value
			negative *= calc2(m)
	return negative