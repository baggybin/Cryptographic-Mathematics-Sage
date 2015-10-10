
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

def is_valid(x,y):
    if x and y == 0: return True
    l = (y ** 2) % p
    r = ((x ** 3) + b * x + c) % p
    return l == r


##Task 2 items
Bx = 32229788467474234756748628505878729390024208362867336852158598320505324896715046072768897703332483321148981809544241785160112227714618817529515195429640423466551653217247644564906760217629749062907697
By = 21568041325533555319841756109765157994589258562415558311388706178120370424545055391441330237700192435828758378174691923322389539937024473179898151180351488954338849665382991352295027996998954524643918


u = 12917545157770308014531929587029764273755025508460117897226669496905422830878836531722550885913396624046879984402669013934217474934056444640393056746630835169938442383490113154154244162800514278344279
v = 34779399776379813565001982952854782332912229258234505582292708136056571865398716985431855265777487683354284870255308556349745438339084073650981507577991514672934489965927245380495221405288145519732595

p = 66613228468057067174020983032928881560472426669241405016005730824623794465869362057274827393285907012484680234697546329376016746378311582480286083234644290785511944291549271487726969925686678905879099
b = 45223864971118414349985382738003866428113942958131535509178125694703251747643413310403150844795331571656753771497817161757866690433361009231729672861987005702783704397577607186210054385366776790456581
c = 20153843419740896052710102383964754384483755985974515793721364759317519748676497303468952758401523530309451831374973915827761416257144949729503853811565651851898066618858860267882095184061048332064241
 
privateK = 5859059126835580090117790193191583384391943569999249098935155100658846085685138559101523258499447427234386835095564302031839004545768983966543511502297687475603274393986241055427467489796816235078911

x = 30095052538385415653203830129152503785615605447308012484750387601278810091632986923858478335940288494310777071830929249405315115765238883606731718606941500157207309532360439617624401958224835459750149
y = 45725135439134113963361826641692563600290010088071995134252233042456976437706595801381701469002221387562978752398878636074662705508587478822387413044732012358847232338392037402786220397110108669942021

E = EllipticCurve(GF(p),[b,c])
G = E([x,y])

M = E([u,v])

## Dr.K Public Key
B = E([Bx,By])

FPM0 = E([u,v])

publicPoint = G*privateK

#verify the public key mapping on Curve
mapping = E(publicPoint)


SharedPoint = B*privateK
SP  = E ([SharedPoint[0],SharedPoint[1]])

'''
One of the thirty numbers
30m+1, 30m+2, 30m+3, ..., 30m+30
was selected, let us call it x0. It was chosen in such a way that x30+bx0+c 
is a quadratic residue modulo p. This ensures that there exists a number
y0 such that [(y0^2 = x0^3 + bx0 + c mod p)]. After selecting such a number y0, 
an Fp-point M0 = (x0, y0) on E is obtained.

C = SharedPoint
The encrypted message is then equal to M = M0 + C.

These are Both Field points !!!!!!!!!!!!
'''

M = FPM0 - SharedPoint

x0 = M[0]
y0 = M[1]

# print "manual negative test"
# yneg = p - SharedPoint[1]
# ne = E([SharedPoint[0],yneg])
# print FPM0 + ne
# print ""

print "are x0 and y0 valid ------? is_valid"
print is_valid(x0,y0)
print "mod"
print mod(x0,30)

print "answer"
print (x0-1)/30
store = int((x0-1)/30)
print number2string(store)

for k in range(1,30):
	try:
		print number2string(int((x0-k)/30))
	except:
		pass

#thought that must be; b They all laughed again. everywhere. Only God co was cold day and night:

#63  thought that must be
#1   they all laughed again
#62  everywhere, only god could co
#104 was cold day and night 

for k in range(1,31):
	try:
		pass
	except:
		pass

messageNumbers = "63,1,62,104"

encodedText = string2number(messageNumbers)

print "encodedText"
print encodedText
print "encodedText_30"
encodedText_30 = 30*encodedText
print encodedText_30

# for k in range(1,31):
# 		x1 = encodedText_30+k
# 		x3 = (x1^3)+(b*x1)+c
# 		print "num " , k , " legendre_symbol"
# 		print legendre_symbol(x3,p)


def at(x):
    if x < p:
    	ysq = (x ** 3 + b * x + c) % p
    	y  = mod(ysq,p).sqrt()
    	return y

t = 4
Jx0 = encodedText_30 + t
print "x0"
print Jx0
print "sqaure root of X^3+B*X+C"
val = at(Jx0)
print val
FP1 = E([Jx0,val])
# solve_mod(2*x == encodedText, p)

encryptedJonathan = FP1 + SharedPoint

CIPHERJONATHAN = E(encryptedJonathan)



print "\nCIPHERJONATHAN"
print CIPHERJONATHAN
print "CIPHERJONATHAN\n"

print "POINTS mapped and tested "
print "Initiating reverse process"

newrevFP = CIPHERJONATHAN - SharedPoint

newrevCheck1 = E(newrevFP)

print ""
print "are the new x0 and y0 valid ------? is_valid"
print is_valid(newrevFP[0],newrevFP[1])
print ""


newx0 = newrevFP[0]
newt= int(mod(newx0,30))


print "T extracted from new X0"
print newt
print ""
testedD = (newx0-newt)


tested = int(testedD/30)

print "----final output----"
print number2string(tested)





