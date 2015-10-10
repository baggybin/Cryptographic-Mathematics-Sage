'''
Problem 6: For each integer a in the range 1, 2, . . . , 76 
calculate the Jacobi symbol 􏰀 a 􏰁 and 
determine if the congruence x2 ≡ a mod 77 has a solution.

77 is not a prime number so the 1, will be incorrect for many Quadratic Residues
'''
n = 77

h = (n-1)//2
L = []

for t in range(1,h+1):
	L.append(power_mod(t,2,n))

for t in range(1,n):
	a = Integer(t)
	if a in L:
		s ="QR"
	else:
		s=" "
	print a, a.jacobi(n),s
