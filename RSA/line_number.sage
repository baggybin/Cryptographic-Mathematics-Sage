#! /bin/python
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

print number2string(364939625836474640396241445348476063623836535360444942623662545550565562433661404764624454504736554450496362554340624856544438625543365562545544474762574437533655403962444962554340445362403653546256494455403962554340486462555062433657406255506254444942625550624048515560623740493843405464)
print ""


M = 614815962170116213764777415525472854400313892374941804178773
K = 53195822314060010857350737736436481934846069555008983950791
PHI = (759511007382490001136361026431 - 1) * (809489205810146588849346935083 - 1)
D = inverse_mod(K,PHI)

lineNum = string2number("64")

CIPHER = power_mod(lineNum,K,M)

print "Line Number Encrypted"
print CIPHER

print "\nLine Number Decryption Test"
decipher = power_mod(CIPHER,D,M)

print number2string(decipher)
