for k in range(1,13):
	print "%2d\t"%k,
print "\n"

for n in range(11):
	a=mod(n,11)
	for k in range (1,13):
		print "%2d\t"%a^k,
	print ""

# /ma6011/EX_1.txt