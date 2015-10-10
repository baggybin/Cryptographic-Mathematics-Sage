#Find a positive integer k such that 6k + 1, 12k + 1 and 18k + 1 are prime numbers. 
#Prove that then (6k + 1)(12k + 1)(18k + 1) is a Carmichael number. Use sage to find at 
#least ten such Carmichael numbers
#
loop = True
k = 1
counter = 0

temp = 0
while loop == True:
	if is_prime((6*k) + 1) and is_prime((12*k) + 1) and is_prime((18*k)+ 1):
		print "***"
		print "K = ", k
		print "***"
		counter += 1
		print "Compostite factors"
		print ((6*k) + 1)
		print ((12*k) + 1)
		print ((18*k) + 1)

		#print power_mod(2,Carmichael-1,Carmichael)


		Carmichael = ((6*k) + 1) * ((12*k) + 1) * ((18*k) + 1)
		if (6*k)/(Carmichael -1) == 0:
			print "%%%%%%%%%%%%"
			break

		print "Prob Carmichael Number"
		print Carmichael
		if not Carmichael % 2 == 0:
			print "\nThis is odd"

		print "Factor"
		print factor(Carmichael)

		print "division"
		if (Carmichael - 1) % (6*k) == 0 and (Carmichael - 1) % (12*k) == 0 and (Carmichael - 1) % (18*k) == 0:
			print "Proved Division"
		# print "p-1/n-1 test"
		# print  (6*k )%(Carmichael - 1)
		



	if counter == 10:
		loop = False
	k=k+1


