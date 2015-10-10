

for num in range(2000,2015):
	fact = factor(num)
	print "current num ", num
	for item in list(fact):
		if item[0] < 45:
			print item[0]
			temp = item[0]
			