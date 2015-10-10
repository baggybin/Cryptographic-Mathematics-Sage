sieve = {}
loop = True
current = 2
P = Primes(1000)

for num in range (2,1001):
    sieve[num] = True

def mult(num):
    num2 = num
    while num2 <= 1000:
        num2 = num2 + num
        if num2 <= 1000:
            delete(num2)

def delete(x):
    sieve[x] = False
    

while loop:
    if current >= (int(sqrt(1000).n())):
        loop = False
    if is_prime(current) == False:
        delete(current)
        current = current + 1

    else:
        mult(current)
        current = current + 1

for key, value in sieve.iteritems():
    if value == True:
        print key
        print "Sage Compare = ", key in P