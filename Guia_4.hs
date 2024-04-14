factorial :: Int -> Int
factorial n | n==0 =1
            | n>0 = n*factorial (n-1)

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
--}
parteEntera :: Float -> Integer
parteEntera n | n >=0 &&   n <1 = 0
              | n>(-1) && n <0 = 0
              | n>=1 = 1 + parteEntera (n-1)
              | otherwise = (-1)+  parteEntera (n+1)
