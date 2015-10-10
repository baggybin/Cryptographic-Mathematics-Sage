# p + 1 -2sqrtp

p = int(7)
np = 0
sqP = sqrt(p)

print sqP.n()

left = (p + 1) - floor(2*(sqP))

print left.n()

right = (p + 1) + ceil(2*(sqP))

print right.n()


p = 66613228468057067174020983032928881560472426669241405016005730824623794465869362057274827393285907012484680234697546329376016746378311582480286083234644290785511944291549271487726969925686678905879099
# print "*******"
# print ceil(p+1 - 2*sqrt(p)) 
# print floor(p + 1 +2 * sqrt(p))

k = floor( log(p,256) )

print "****"

print p/100
print 