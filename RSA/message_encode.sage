#! /bin/python
from sage.crypto.util import random_blum_prime


alphabet='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ,.?!:;-\'\"'
def string2number(string):
    M=0
    for i in range(len(string)):
        M = 100*M + alphabet.index(string[i])
    return M

def number2string(M):
    string=''
    while M > 0:
        i = M % 100
        #print i
        #print alphabet[i]
        M = (M-i)/100
        string = alphabet[i] + string
    return string

#sage: euler_phi(614815962170116213764777415525472854400313892374941804178773)
#614815962170116213764777415523903854187121255784956096217260

encyptedText = 207473446220753129273423197523685284943853227029330431886860516781644182516726060010078949913006100107829250263892456509520016003548323068885107033992196934623090434135757432894578167289540487759485968815062768162735187540348905942649655715


PHI =  (759511007382490001136361026431 - 1) * (809489205810146588849346935083 - 1)

#sage: factor(614815962170116213764777415525472854400313892374941804178773)
#759511007382490001136361026431 * 809489205810146588849346935083
#sage: euler_phi(614815962170116213764777415525472854400313892374941804178773)
#614815962170116213764777415523903854187121255784956096217260
#sage: factor(614815962170116213764777415525472854400313892374941804178773)
#759511007382490001136361026431 * 809489205810146588849346935083
#sage: print (759511007382490001136361026431 -1 ) * (809489205810146588849346935083 -1)
#614815962170116213764777415523903854187121255784956096217260

M = 614815962170116213764777415525472854400313892374941804178773
K = 53195822314060010857350737736436481934846069555008983950791


## Block size of 60 procuces Sections, incorrectly ordered of the text (hazel)
L = (60)
split = list(str(encyptedText))
ls = []
length = len(split)

if (length % L) != 0:
	first = length % L
	ls.append(split[:first])
	del split[:first]

for k in range(length/L):
	ls.append(split[:L])
	del split[:L]
print "$$$$"

for i in list(ls):
	print ""
	temp = int("".join(i))
	print temp
	#print type(temp)
print "$$$$"


print "gcd(M,K)"
print gcd(M,K)
#print "**"
#print M   -165036643410605782622063372430353231785440139637732678059549
bezout = xgcd(K, PHI)
D2 = Integer(mod(bezout[1], PHI))
print "D2"
print D2
print "bezout"
print bezout
print "****"
#decipher = power_mod(encyptedText,D,M)

print "manual Inverse"
D = inverse_mod(K,PHI)
print D
decipher = power_mod(encyptedText,D,M)

#check = D * K
#print "check"
#print mod(check,M)
#print ""
print "decipher output"
print decipher

print " "
print "test congruence"
print mod(D*K,PHI)


print "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
print "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
code=""
temp = ""
for i in list(ls):
	temp = int("".join(i))
        #print "Block Decipher"
	decipher = power_mod(temp,D,M)
        code+=str(decipher)

print "Original code"
print code
print "@@@@@"

print ""
print number2string(int(code))
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

stringnum3 = string2number(" to have to sing to empty benches.")
print "\nString 3 Numerical Rep"
print stringnum3
code += str(stringnum3)

print "\ncode"
print code

print "\nnew code string conversion test"
print number2string(int(code))

def newEncode(codenum):
    L = (60)
    split = list(str(codenum))
    ls = []
    length = len(split)
    
    if (length % L) != 0:
            first = length % L
            ls.append(split[:first])
            del split[:first]
    
    for k in range(length/L):
            ls.append(split[:L])
            del split[:L]
    print "$$$$"

    for i in list(ls):
            print ""
            temp = int("".join(i))
            print temp
    return ls
    
temp = ""
blocks =  newEncode(int(code))

print ""

def encypt_blocks(blocks):
    encyptedBlocks = []
    temp = ""
    for i in list(blocks):
        temp = "".join(i)
        temp = int(temp)
        print ""
        print "".join(i)
        print "converted to"
        CIPHER = power_mod(temp,K,M)
        print CIPHER
       
        
        encyptedBlocks.append(CIPHER)
        #print CIPHER
    return encyptedBlocks

RSA_BLOCKS = encypt_blocks(blocks)

print "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
print "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
print "RSA BLOCKS"
print RSA_BLOCKS

def combine(RSA):
    code=""
    for i in list(RSA):
            print "RSA Combine"
            print i
            code = code + str(i)

    return code


print "\n*&*****8"
print ""
finalencodedMessage = int(combine(RSA_BLOCKS))

print "\n Final Encoded Message"
print finalencodedMessage

# isolation, the music that still vibrated in their ears united them.
# and walked firmly, carrying a stout hazel.
#print number2string(3649396258364746403962414453484760636238365353604449426236625455505655624336614047646244545047365544504963625543406248565444386255433655625455444747625744375336554039624449625543404453624036535462564944554039625543404864)
# 166222605958625050432140712594363696018225535497859364490885
L = (60)
split = list(str(finalencodedMessage))
ls = []
length = len(split)

if (length % L) != 0:
	first = length % L
	ls.append(split[:first])
        print "split first"
        print split[:first]
	del split[:first]

for k in range(length/L):
        print "split >"
        print (split[:L])
	ls.append(split[:L])
	del split[:L]
print "$$$$"

temp = ""
for i in list(ls):
	print ""
	temp = int("".join(i))
	print temp
	#print type(temp)
print "$$$$"
print "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
print "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
temp = ""
code=""
for i in list(ls):
	temp = int("".join(i))
        #print "Block Decipher"
	decipher = power_mod(temp,D,M)
        code+=str(decipher)

print "Original code"
print code
print "@@@@@"


print "\n\nDecrypted Message with Three Sentances"
print"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
print number2string(int(code))



