

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


##  Weierstrass form y2 = x3 + bx + c

neg = FPM0-SharedPoint 


print "attempting to map subtracted point"
print "True === is point on the curve"

neggy = E(neg)


# xnew = SharedPoint[0]
# ynew = mod(int(SharedPoint[0]) +int(SharedPoint[1]),p)

# print xnew
# print ynew
# new = E([xnew,ynew])


# print ""
# print FPM0 - new
# print ""

print neggy


###     Reverse Mapping Probally requires Pollard or Hellman - Algorithm


# m1 = u*SharedPoint[0]^-1
# m2 = v*SharedPoint[1]^-1

# print m1 
# print m2



# SP  = E ([SharedPoint[0],SharedPoint[1]])
# print (SharedPoint)
# print ""
# negPoint =  -(SharedPoint)
# # XXX = E(negPoint) 
# X0 = FPM0 + negPoint
# print X0

# n = sys.maxsize
# print neg*(n+1)-neg*n == neg


# xx =  LCM([1..30])*SharedPoint

# for k in range(1,40):
#     test = (m1-k)/30
#     try:
#         number2string(test)
#     except:
#         print "fail"



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


def neg_edwards(P):
    return (-P[0],P[1],P[2])



# x3 = SharedPoint[0]
# y3 = SharedPoint[0]+SharedPoint[1]
# print x3
# print ""
# print y3    
# neg = E([x3,y3])




# negPoint = neg_edwards(SharedPoint)

# # neg = E([negPoint[0],negPoint[1]])
# print negPoint[0]
# print negPoint[1]
# print negPoint[2]
print ""
# print B - SharedPoint

#"££££3"
# SharedX = SharedPoint[0]
# mm = Mod(v,p)*Mod(u,p)^(-SharedX)
# ##


# M = FPM0 - SharedPoint

# SharedkInt = SharedPoint[0]*privateK

# mm = SharedPoint[1]*(SharedkInt)^-1
# #mm = M[0]

# for k in range(31):
#     try:
#         temp = (mm-k)/30
#         number2string(temp)

#     except:
#         pass







# num1 = 12345 
# num2 = (30*12345)+2
# print num1
# print num2
# print   (num2-2)/30

# print (num2/30)(-2).n()
# print "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
# print SharedPoint[0]^-1
# print "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
# print SharedPoint[1]
# print ""
# print SharedPoint

# for k in range(30):
#     try:
#         number2string((M[0]/30)-k)
#     except:
#         "fail"

# for k in range(31):
# 	print (M[0]/30)-k
# 	try:
# 		##Where does Symettric key Comein to play?
# 		## Does it
# 		number2string((M[0]/30)-k)
# 	except:
# 		print "fail"
# 	try:
# 		a = mod((M[0]/30)-k,p)^(-Sx)
# 		print number2string(a)
# 	except:
# 		print "Fail2"



# xx = SharedPoint[0]
# yy = SharedPoint[1]
# temp = mod(xx^3 + b*xx + c, p)
# if temp == SharedPoint[1]^2:
#     print " "

   
SharedX = SharedPoint[0]



# for k in range(31):
# 	Sx = (SharedX/30)-k
# 	print " "
# 	print Sx
# 	print  " "
# 	try:
# 		number2string(Mod(v,p)*Mod(u,p)^(-Sx))
# 	except:
# 		pass


# for i in range(31):
# 	Sx = Integer((SharedX/30)-k)
# 	print Sx.jacobi(p)	



'''
symkey =  SharedPoint[0]
test = Mod(v,p)*Mod(u,p)^(-symkey)

print test
for i in range(31):
	print "i" , i
	val = ((test)/30) - i
	try:
		number2string(val)
	except:
		print "ex"

(M*K)^-1
print ""
print "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
print S

print "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"

print "*******************************"

print SharedkInt

print "********************************"

print "testtststtstststststst"
print Mod(v,p)*Mod(u,p)^(-S)

print " "
# print u - SharedkInt

u*SharedkInt^-1

#Sharedk = (al)k  M
# d1 = decoding( decrypt_mv_eg(key, enc)[0] )
#     d2 = decoding( decrypt_mv_eg(key, enc)[1] )
# x = (Sharedk*u)^-1[0]
# y = (Sharedk*v)^-1[1]

# print x
test = (S, u, v)

print test
print ":::::::	"

print decrypt_mv_eg(privateK,test)


print ":::::::::"
print ""
def decrypt_mv_eg(kpri,enc):
    x = (kpri*enc[0])[0]
    y = (kpri*enc[0])[1]
    return enc[1]*x^-1, enc[2]*y^-1

print u*(SharedkInt)^-1
print v*(SharedkInt)^-1
	

print ""

print (u*SharedkInt)^-1
'''


