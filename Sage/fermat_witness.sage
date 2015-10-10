# Fermat witnessed
# Find all integers 1 ≤ a < 667 for which a666 ≡ 1 mod 667.

for a in range(667):
	A = mod(a,667)
	if (A^666 == 1):
		print a