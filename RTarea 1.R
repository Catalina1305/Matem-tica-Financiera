#PUNTO 1
rm(list=ls())
sumaparcial = function(k){x = 1:k
sum(1/x^2)}
sumaparcial(100000)

#PUNTO 2
rm(list=ls())
area1 = function(dx){
  xi = seq(0,1, by = dx) # = (0, dx, 2dx,...,1)
  sum(exp(-xi^2))*dx
}
# Llamada a al funci�n
area1(1/10000000)


#PUNTO 3
rm(list=ls())
primos = function(x){
  numeros = 2:x
  d = 1
  while(numeros[d]^2 <= x){
    for(n in numeros){
      if(numeros[d] != n){
        if(n%%numeros[d]==0){
          numeros = numeros[-which(numeros==n)]
        }
      }
    }
    d=d+1
  }
  numeros
}

primos(200)

#PUNTO 4
rm(list=ls())
install.packages("Rmpfr")
require(Rmpfr)
aa = mpfr(45, precBits = 256)
bb = mpfr(100, precBits = 256)
cc = mpfr(2, precBits = 256)
X2= (-bb+sqrt(bb^2-4*aa*cc))/(2*aa);X2
X2= (-bb-sqrt(bb^2-4*aa*cc))/(2*aa);X2

#PUNTO 5
rm(list=ls())
n = as.numeric(readline("n = "))
x = scan()
x
A = matrix(x, nrow = n, ncol = n, byrow=T )
A
D = diag(diag(A))
D
M = A - D
M
U = {
  lower.tri(M)
  M[lower.tri(M)] <- 0
  M}
print(U) 

M = A - D
L = {
  upper.tri(M)
  M[upper.tri(M)] <- 0
  M}
print(L)

A = D + L + U
A

# I es la inversa de la diagonal D
I = 1/diag(D)
r = matrix(I ,n , n, byrow=T)
I = diag(diag(r))
I

#Matriz de transici�n
Tj = I %*% (L + U)
Tj


e <- eigen(A)
b = e$values
b

v = e$vectors
v

#Tomando el autovalor como B
B = matrix(b, nrow = n, ncol = 1, byrow = T)
B
 
#Tomando un B particular para una matriz espec�fica
B = matrix(c(-6,17,-14,12),nrow = n, ncol = 1, byrow = T)
B

#Inversa de la diagonal D multiplicado por B
H = I %*% B
H

#XO es una estimaci�n inicial
X0 = matrix(rep(1,n), nrow = n, ncol = 1, byrow = T)
X0

X = H - (Tj %*% X0)
X
