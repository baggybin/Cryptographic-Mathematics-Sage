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



print "\n*&*****8"
print ""
finalencodedMessage = 1711336409319043972471747450804958358164107381242912565830928936845779292606035931877824637331168580278253036740104596717095573401638865298020174267536893525861721064986349329213580416489569004964867022728909883868618661437653089751392494946989044698263433198839442214038944178145481641139693476020568052963834857341981480242932031145092522405194192176256316771043633995563361060288751214726379839974

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
for i in reversed(list(ls)):
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


