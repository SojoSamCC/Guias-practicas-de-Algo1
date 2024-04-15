factorial :: Int -> Int
factorial n | n==0 =1
            | (abs n)>0 = (abs n)*factorial (n-1)

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
todosDigitosIguales n | n >=0 && n<10 = True 
                      | otherwise = ((digitoUnidades n == sacarUnidades n)) -- Tengo que resolver esto, muy muy rápido

{--
iesimoDigito :: Integer ->Integer ->Integer
iesimoDigito n | --}