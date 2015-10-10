L = int(raw_input('Enter L: '))
S = int(raw_input('Enter S: '))

split = list(str(S))
ls = []
divable = False

length = len(split)

if (length % L) != 0:
	first = length % L
	ls.append(split[:first])
	del split[:first]

for k in range(length/L):
	ls.append(split[:L])
	del split[:L]

for i in list(ls):
	print i
	temp = int("".join(i))
	#print temp
	#print type(temp)
