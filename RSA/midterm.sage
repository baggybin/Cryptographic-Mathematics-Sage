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
        M = (M-i)/100
        string = alphabet[i] + string
    return string

p1 = random_blum_prime(10**99,10**100)
p2 = random_blum_prime(10**99,10**100)

if len(str(p1)) > 99:
    print "P1 larger than 100 digits"
else:
    print "p1 size error"
if len(str(p2)) > 99:
    print "p2 larger than 100 digits"
else:
    print "p2 size error"
#print p1
#print ""
#print p2
#print ""

# Verifiy prime seperation
# use a 100 for comparision because sometime divisor is larger
# resulting in a negative value
while not (len(str(p1 - p2)) > 100):
    print "Check"
    print len(str(p1)) - len(str(p2))
    p1 = random_blum_prime(10**99,10**100)
    p2 = random_blum_prime(10**99,10**100)

print "^^^^^^^^^^^^^^^^^^^^^^^^Difference Between Primes^^^^^^^^^^^^^^^^^^"
print p1 - p2
print "*******************************************************************"
print len(str(p1 - p2))
print "^^^^^^^^^^^^^^^^^^^^^^^^END^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
print ""

# Create compostite M
M = p1 * p2

# Generate PHI of M
PHI = euler_phi(p1) * euler_phi(p2)
PHIcompare = (p1 -1) * (p2 - 1)

if PHI == PHIcompare:
    print "Phi True"

# Locate Random E Co-Prime to PHI of M
K =  ZZ.random_element(PHI)
while gcd(K,PHI) != 1:# and not K < M :
    K =  ZZ.random_element(PHI) 

if K < M:
    print "K is less than M"
else:
    print "K is greater than M"
#Given two integers x and y, xgcd(x, y) returns a 3-tuple (g, s, t)
# that satisfies the Bézout identity g = gcd(x,y) = sx+ty.

bezout = xgcd(K,PHI)
#print bezout

D = Integer(mod(bezout[1], PHI))

#print D
#print mod(D * E, PHI)

messString = "Hello World!"
mess = string2number(messString)
print "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
print "$$$$$$$$$$$$$$ Encyption Test $$$$$$$$$$$$$$$$$"
print "Original Numerical Number"
print mess
print messString
CIPHER = power_mod(mess,K,M)
print "CIPHER Output"
print CIPHER
print "££££££££££££££££££££££££££££££££££££££££££££££££"
print "             Decryption Test                    "
decipher = power_mod(CIPHER,D,M)
print decipher
print number2string(decipher)
print "$$$$$$$$$$$$$$$$$$$$END$$$$$$$$$$$$$$$$$$$$$$$$$"
print ""

print "***********************************************************************"
print "******************PUBLIC KEY*******************************************"
print "***********************************************************************"
print ""
print " Composite Mod ", "M"
print M
print " PUBLIC K or E"
print K
print ""
print "***********************************************************************"
print "******************Private KEY*******************************************"
print "************************************************************************"
print ""
print "P1"
print p1
print "P2"
print p2
print "PHI"
print PHI
print "D"
print D





