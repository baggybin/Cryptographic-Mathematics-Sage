def legendre(a,p):
     is_sqr_modp=-1
     for i in range(p):
         if a % p == i^2 % p:
             is_sqr_modp=1
     return is_sqr_modp