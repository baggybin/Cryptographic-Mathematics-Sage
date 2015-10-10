'''
Problem 5: Let p = 97. For each quadratic residue a between 1 and p − 1 print the two solutions 
to the congruence x2 ≡ a mod p. In preparation for this, you may calculate all the squares modulo p
of the numbers from 1 to (p − 1)/2.
'''

p = 97
h = (p-1)//2
Dict = {}

for t in range(h - 1):
	Dict[t] = power_mod(t,2,p)

for elem in Dict:
	print elem, Dict[elem], p - Dict[elem]
