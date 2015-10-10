#! /bin/python
from sage.crypto.util import random_blum_prime

'''

Test Case Code using a Modulus 200
Using my Public and Private Key to
Encypted and Decypt the Three Combined 
Sentances. Funtioning with a 199 Block split
and 200 size block decrypt size.

'''

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

PHI = 40097939758984700444327879196298314437675102200424399300172644977099406765311519778855920747780687190043556502467600091398634084379985675145013593987669402761810494095000080267220980282702160605001820

M = 40097939758984700444327879196298314437675102200424399300172644977099406765311519778855920747780687203769720436105155266149384295638866702712530629586736421938396805546957930503126150552849442960505277

K = 29331093726614615542132036141223545882876435680459527767003067145214985011818153483869377041260069273230014716802636742116268165063323865499303224572227283020742270698932938991152422555876840893053437

print "gcd(M,K)"
print gcd(M,K)
#print "**"
#print M   -165036643410605782622063372430353231785440139637732678059549
bezout = xgcd(K, PHI)
D2 = Integer(mod(bezout[1], PHI))
D = inverse_mod(K,PHI)

code = 364939625836474640396241445348476063623836535360444942623662545550565562433661404764624454504736554450496362554340624856544438625543365562545544474762574437533655403962444962554340445362403653546256494455403962554340486462555062433657406255506254444942625550624048515560623740493843405464
print "\nnew code string conversion test"
print number2string(int(code))

def newEncode(codenum):
    L = (199)
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
        print "CIPHER BLOCK SIZE = ", len(str(CIPHER))
       
        
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
L = (200)
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
    print "Decipher"
    print str(decipher)

print "Original code"
print code
print "@@@@@"


print "\n\nDecrypted Message with Three Sentances"
print"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$\n"
print number2string(int(code))
print "\n"


