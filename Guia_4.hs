import Distribution.Compat.Lens (_1)
factorial :: Integer -> Integer
factorial n | n==0 =1
            | n>0 =  n*factorial (n-1)

{--
Un comentario de varias  líneas, osi osi
--}

-- Ejercicio 1

{--Implementar la funci´on fibonacci: Integer -> Integer que
devuelve el i-´esimo n´umero de Fibonacci. Recordar que la
secuencia de Fibonacci se define como:  
n==0 =0 
n==1 = 1
otherwise fib (n-1)+ fib(n-2)
--}

fibonacci :: Integer -> Integer
fibonacci n | n==0 =0
            | abs n ==1 =1
            | otherwise = fibonacci (abs n -1) +fibonacci (abs n -2)

{--
Ejercicio 2)
Implementar una funci´on parteEntera :: Float -> Integer
que calcule la parte entera de un n´umero real.
Debo de arreglar lo de resutado <= x < resultado+1 ; hacer ejemplo con un nùmero negativo --}
parteEntera :: Float -> Integer
parteEntera n | n >=0 &&   n <1 = 0
              | n>(-1) && n <0 = 0
              | n>=1 = 1 + parteEntera (n-1)
              | otherwise = (-1)+  parteEntera (n+1)

{--
Ejercicio 3) 
Especificar e implementar la funci´on esDivisible :: Integer ->Integer ->Bool que dados dos n´umeros
naturales determinar si el primero es divisible por el segundo. No est´a permitido utilizar las funciones mod ni div.
--}
esDivisible :: Integer -> Integer -> Bool
esDivisible x y | y>x = False
                | x==y = True
                | otherwise = esDivisible (x-y) y

tieneDecimal :: Float -> Bool
tieneDecimal n | n>1 && n>0 = tieneDecimal (n-1)
               | n<1 && n>0 = True
               | n==0 || n==1 = False

sumaImpares :: Integer -> Integer 
sumaImpares 1 = 1
sumaImpares n | (mod n 2) /= 0 = n + sumaImpares(n-2)
              | otherwise = sumaImpares (n-1)

medioFact :: Integer ->Integer
medioFact n | n==0 =1 
            | n < 0 = 1
            | n > 0 = n* medioFact(n-2)

sumaDigitos :: Integer ->Integer
sumaDigitos n = (mod n 10) + sumaDigitos (div n 10)

sacarUnidades :: Integer -> Integer
sacarUnidades n = div n 10

digitoUnidades :: Integer -> Integer
digitoUnidades n = mod n 10

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n | n<10 = True 
                      | otherwise = (digitoUnidades n == digitoUnidades(sacarUnidades n)) {-- Esto es para que mientras ambos valores sean iguales, siga tirando True)--} &&  todosDigitosIguales(sacarUnidades n)

cantDigitos :: Integer -> Integer 
cantDigitos n | n>=0 && n<1 = 0
              | otherwise = 1 + cantDigitos (sacarUnidades n)

{--
elevar :: Integer -> Integer -> Integer
elevar n x = 10^x 
--}

iesimoDigito :: Integer ->Integer ->Integer
iesimoDigito n i | i==0 = 0
                 | i==cantDigitos n = mod n 10
                 | otherwise = iesimoDigito (div n (10^(cantDigitos n - i))) i
    
esCapicua :: Integer -> Bool 
esCapicua n | n<10 = True
            | iesimoDigito n 1 /= iesimoDigito n (cantDigitos n) = False
            | otherwise = (iesimoDigito n 1 == iesimoDigito n (cantDigitos n)) && esCapicua(iesimoDigito (sacarUnidades n) (cantDigitos (sacarUnidades n)))

--Ejercicio 10 
-- a)
f1 :: Integer -> Integer
f1 0 = 1
f1 n = f1 (n-1) + 2^n

-- b)
f2 :: Integer -> Float -> Float
f2 0 q = 1
f2 1 q = q
f2 n q = f2 (n-1) q + q^n

-- c)
f3 :: Integer -> Float -> Float
f3 1 q = f2 2 q 
f3 n q = f2 (2*n) q

--d)  
f4 :: Integer -> Float -> Float
f4 0 q = 1
f4 1 q = f3 1 q  
f4 n q = f3 n q - f2 (n-1) q

-- Ejericio 11
-- a)
factorial1 :: Integer -> Float
factorial1 n | n==0 =1
            | n>0 =  fromIntegral (n*factorial (n-1))

eAprox :: Integer -> Float
eAprox 0 = 1
eAprox 1 = 2 
eAprox n = eAprox(n-1) + (1/factorial1 n) --Preguntar por qué da error con div 1 factorial n

e :: Float
e = eAprox 10