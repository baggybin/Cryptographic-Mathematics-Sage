g = 5
a = 96
p = 317

s = ceil(sqrt(p -1))
babyDict = {}
giantDict = {}

for i in range(0,s):
	temp = a * (g^i)
	temp = mod(temp,p)
	babyDict[temp] = i

#print giantDict
for key in sorted(babyDict):
    print "%s: %s" % (key, babyDict[key])


print ""
gs = g^s
#print mod(gs,p)
gs = mod(gs,p)


for j in range(1,s+1):
	temp = power_mod(gs,j,p)
	giantDict[temp] = (j*s)

for key in sorted(giantDict):
    print "%s: %s" % (key, giantDict[key])


# print set(giantDict)-set(babyDict)
# set([1])
print ""
keyids = []

for key in giantDict.keys():
	if key in babyDict:
		keyids.append(key)

keyids = sorted(keyids)

print ""
print keyids
print ""

for k in list(keyids):
	temp = giantDict[k] - babyDict[k]
	print mod(temp,p-1)
	print mod(g^(mod(temp,p-1)),p)



 

