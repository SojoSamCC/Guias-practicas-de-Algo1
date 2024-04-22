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
sumaImpares n | odd n = n + sumaImpares (n-2)
              | otherwise = sumaImpares (n-1)

medioFact :: Integer ->Integer
medioFact n | n==0 =1
            | n < 0 = 1
            | n > 0 = n* medioFact (n-2)

sumaDigitos :: Integer ->Integer
sumaDigitos n = mod n 10 + sumaDigitos (div n 10)

sacarUnidades :: Integer -> Integer
sacarUnidades n = div n 10

digitoUnidades :: Integer -> Integer
digitoUnidades n = mod n 10

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n | n<10 = True
                      | otherwise = digitoUnidades n == digitoUnidades (sacarUnidades n) {-- Esto es para que mientras ambos valores sean iguales, siga tirando True)--} &&  todosDigitosIguales (sacarUnidades n)

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
            | otherwise = iesimoDigito n 1 == iesimoDigito n (cantDigitos n) && esCapicua (iesimoDigito (sacarUnidades n) (cantDigitos (sacarUnidades n)))

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
eAprox n = eAprox (n-1) + 1/factorial1 n --Preguntar por qué da error con div 1 factorial n

e :: Float
e = eAprox 10

-- Ejercicio 12)
raizDe2Aprox :: Integer ->Float
raizDe2Aprox n | n==0 = 1
               | otherwise = 1 +  1/(1+raizDe2Aprox (n-1))

-- Ejercicio 13)
fn :: Integer -> Integer -> Integer
fn n m | m==1 = n
       | otherwise = n^m + fn n (m-1)

fnm :: Integer -> Integer -> Integer
fnm 1 m = fn 1 m
fnm n m = fn n m + fnm (n-1) m -- analizar bien este caso

-- Ejercicio 149
f2n :: Integer -> Integer -> Integer
f2n 0 q = 1
f2n 1 q = q
f2n n q = f2n (n-1) q + q^n

sumaPotencias :: Integer ->Integer ->Integer ->Integer
sumaPotencias q n m = f2n n q * f2n m q

-- Ejercicio 15)
sumaracionalesAux :: Integer -> Integer -> Float
sumaracionalesAux n 1 =  fromIntegral n
sumaracionalesAux n m = fromIntegral n/fromIntegral m + sumaracionalesAux n (m-1)

sumaRacionales :: Integer ->Integer ->Float
sumaRacionales 1 m = sumaracionalesAux 1 m
sumaRacionales n m = sumaracionalesAux n m + sumaRacionales (n-1) m

-- Ejercicio 16)
-- a)
menorDivisorHasta :: Integer -> Integer -> Integer
menorDivisorHasta n i | mod n i ==0 = i
                      | otherwise = menorDivisorHasta n (i+1)

menorDivisor :: Integer ->Integer
menorDivisor 1 = 1
menorDivisor n = menorDivisorHasta n 2

-- b)
esPrimo :: Integer ->Bool
esPrimo n = menorDivisor n == n

-- c)
sonCoprimos :: Integer ->Integer ->Bool
sonCoprimos n m = menorDivisor n == menorDivisor m

-- d)
contadorprimo :: Integer -> Integer ->Integer -> Integer
contadorprimo n i j | esPrimo i && j==n = i 
                    | esPrimo i && j /=n = contadorprimo n (i+1) (j+1)
                    | otherwise = contadorprimo n (i+1) j -- Esta función me salió luego de muchos intentos y no sé bien cómo funciona, pero funciona 3)

nEsimoPrimo :: Integer ->Integer
nEsimoPrimo 2 = 2
nEsimoPrimo 3 = 3
nEsimoPrimo 4 = 5
nEsimoPrimo n = contadorprimo n 1 1

-- Ejercicio 17)
contadorfibonacci :: Integer -> Integer -> Integer
contadorfibonacci n i | fibonacci i == n = n
                      | fibonacci i > n = i
                      | otherwise = contadorfibonacci n (i+1)

esFibonacci :: Integer ->Bool
esFibonacci n = contadorfibonacci n 1 == n

-- Ejercicio 18)
esPar :: Integer -> Bool
esPar n = mod n 2 ==0

compararDigitos :: Integer -> Integer -> Bool
compararDigitos n m = mod n 10 > mod m 10 || mod n 10 == mod m 10

sacarDigito :: Integer -> Integer -> Integer
sacarDigito n i | digitoUnidades n == i = sacarUnidades n 
                | otherwise = 1

--sacarImpares :: Integer -> Integer
--sacarImpares n | not (esPar (iesimoDigito n i)) = sacarDigito n i
  --             | otherwise = sacarImpares n
{--
recorrerDigitos :: Integer -> Integer -> Integer -> Integer
recorrerDigitos n m i | i>cantDigitos n = m
                      | esPar (iesimoDigito n i) && (iesimoDigito n i) > m = recorrerDigitos n (i+1) (iesimoDigito n i)
                      | otherwise = recorrerDigitos n m (i+1)

mayorDigitoPar :: Integer ->Integer
mayorDigitoPar n | n<10 && esPar n = n 
                 | otherwise = recorrerDigitos n (-1) 
--} 
-- No sé el porqué no sirve, debo de analizar, tampoco sé porqué el código de abajo funciona, debo analizar (me lo copié de alguien)

recorridoDigitos :: Integer -> Integer -> Integer -> Integer
recorridoDigitos n pos mayor 
    | pos > cantDigitos n = mayor
    | esPar (iesimoDigito n pos) && (iesimoDigito n pos) > mayor = recorridoDigitos n (pos+1) (iesimoDigito n pos) 
    | otherwise = recorridoDigitos n (pos+1) mayor

mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n = recorridoDigitos n 1 (-1)

-- ejercicio 19)

menorDivisorHasta2 :: Int -> Int -> Int
menorDivisorHasta2 n i | mod n i ==0 = i
                       | otherwise = menorDivisorHasta2 n (i+1)

menorDivisor2 :: Int ->Int
menorDivisor2 1 = 1
menorDivisor2 n = menorDivisorHasta2 n 2

esPrimo2 :: Int ->Bool
esPrimo2 n = menorDivisor2 n == n

contadorprimo2 :: Int -> Int ->Int -> Int
contadorprimo2 n i j | esPrimo2 i && j==n = i 
                     | esPrimo2 i && j /=n = contadorprimo2 n (i+1) (j+1)
                     | otherwise = contadorprimo2 n (i+1) j -- Esta función me salió luego de muchos intentos y no sé bien cómo funciona, pero funciona 3)

nEsimoPrimo2 :: Int ->Int
nEsimoPrimo2 2 = 2
nEsimoPrimo2 3 = 3
nEsimoPrimo2 4 = 5
nEsimoPrimo2 n = contadorprimo2 n 1 1

sumatoriaDePrimos :: Int -> Int
sumatoriaDePrimos n | n==1 = 1
                    | otherwise = nEsimoPrimo2 n + sumatoriaDePrimos (n-1)

sumadorPrimos :: Int -> Int -> Int -> Bool
sumadorPrimos n suma contador| n==suma = True 
                             | n < suma = False
                             | otherwise = sumadorPrimos n (sumatoriaDePrimos (contador+1)) (contador+1)

esSumaInicialDePrimos :: Int ->Bool
esSumaInicialDePrimos 1 = True
esSumaInicialDePrimos n = sumadorPrimos n 1 1

-- Ejercicio 20)
esDivisor :: Int -> Int -> Bool
esDivisor n m = mod n m == 0

{--
nEsimoDivisor2 :: Int ->Int
nEsimoDivisor2 n = contadordivisor n 2

sumatoriaDivisores :: Int -> Int
sumatoriaDivisores n | n==1 = 1
                     | otherwise = nEsimoDivisor2 n + sumatoriaDivisores (n-1)

sumadorDivisores :: Int -> Int -> Int -> Bool
sumadorDivisores n suma contador| n==suma = True 
                                | n < suma = False
                                | otherwise = sumadorDivisores n (sumatoriaDivisores (contador+1)) (contador+1) --}

sumaDivisores :: Int -> Int -> Int
sumaDivisores n divisor | n==divisor = n
                        | esDivisor n divisor = divisor + sumaDivisores n (divisor+1)
                        | otherwise = sumaDivisores n (divisor+1)
tomaValorMax :: Int ->Int ->Int
tomaValorMax n1 n2 | n1>=1 && n2>=n1 = sumaDivisores (n2-1) 1 -- No estoy seguro de esto, debo preguntar cómo se interpreta la especificación