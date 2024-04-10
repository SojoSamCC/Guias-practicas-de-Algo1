-- Ejercicio 1)
f :: Integer -> Integer
f n | n==1 =8
    | n==4 =131
    | n==16 =16

-- problema g(n:Z):Z {
-- requiere: {n==8 V n ==16 V n==131}
-- asegura:{(n=8 -> result=8)∧(n=16 -> result=4)∧(n=131->result=1)}
--}
g :: Integer -> Integer
g n | n==8 =16
    | n==16 =4
    | n==131 =1

h :: Integer -> Integer
h n = f (g n)

k :: Integer -> Integer
k n = g (f n)

-- Ejercicio 2)
-- c)
-- problema maximo3(x,y,z:Z):Z {
-- asegura{(res>=x)∧(res>=y)∧(res>=z)}
--}

maximo3 ::Int -> Int -> Int -> Int
maximo3 x y z | x>y && x>z =x
              | y>x && y>z =y
              | z>y && z>x =z

-- g)
-- problema sumaDistintos1(x,y,z:Z):Z{
-- asegura { ((x/=y) ∧ (x/=z) ∧ (y/=z)) -> res=x+y+z 
-- asegura { ((x==y) ∧ (x/=z)) -> res= z}
-- asegura { ((x==z) ∧ (x/=y)) -> res= y}
-- asegura { ((y==z) ∧ (y/=x)) -> res= x}
-- asegura { ((x==y) ∧ (y==z)) -> res= 0}
--}
sumaDistintos1 :: Int -> Int -> Int -> Int
sumaDistintos1 x y z | x/=y && x/=z && y/=z =x+y+z 
                     | x==y && x/=z = z
                     | x==z && x/=y = y
                     | y==z && y/=x = x
                     | otherwise =0

-- problema sumaDistintos2(x,y,z:Z):Z{
-- asegura { ((x/=y) ∧ (x/=z) ∧ (y/=z)) -> res=x+y+z 
-- asegura { ((x==y) ∧ (x/=z)) -> res= z+x}
-- asegura { ((x==z) ∧ (x/=y)) -> res= y+x}
-- asegura { ((y==z) ∧ (y/=x)) -> res= x+z}
-- asegura { ((x==y) ∧ (y==z)) -> res= 0}
--}

sumaDistintos2 :: Int -> Int -> Int -> Int
sumaDistintos2 x y z | x/=y && x/=z && y/=z =x+y+z 
                     | x==y && x/=z = z+x
                     | x==z && x/=y = y+x
                     | y==z && y/=x =x+z
                     | otherwise =0

-- i)
-- problema digitoUnidades(x:Z):Z {
-- asegura{resultado= resto de x/10}
--}

digitoUnidades :: Int -> Int
digitoUnidades x = mod x 10

-- j)
-- problema digitoUnidades(x:Z):Z {
-- asegura{resultado= (resto de x/100) / 10}
--}

digitoDecenas :: Int -> Int
digitoDecenas x = div ((mod x 100)- (mod x 10)) 10 -- otra forma es x= div(mod x 100) 10

-- Ejercicio 4)

-- b) todoMenor: dadas dos tuplas R × R, decide si es cierto que cada coordenada de la primera tupla es menor a la coordenada correspondiente de la segunda tupla.

-- problema todoMenor(t1,t2:RXR):Bool{
-- asegura {la primera coordenada de t1 es menor que la primera coordenada de t2 ∧ la segunda coordeanda de t1 es menor que la segunda coordenada de t2}
--}

todoMenor :: (Int,Int) -> (Int,Int) -> Bool
todoMenor (x,y) (z,t) | fst (x,y)< fst (z,t) && snd(x,y)<snd(z,t) = True
                      | otherwise =False

-- f) dada una terna de enteros, devuelve la posición del primer número par si es que hay alguno, y devuelve 4 si son todos impares).

-- problema posPrimerPar (t:ZxZxZ):Z {
-- asegura {res es igual a la posicion del primer numero par de la terna t}
-- asegura {res=1 <-> resto de x entre dos = 0}
-- asegura {res=2 <-> resto de x entre dos = 0}
-- asegura {res=3 <-> resto de x entre dos = 0}
--}

posPrimerPar :: (Int,Int,Int) -> Int
posPrimerPar (x,y,z) | mod x 2 ==0 = 1
                     | mod y 2 ==0 = 2
                     | mod z 2 ==0 = 3
                     | otherwise = 4

-- Ejercicio 6) Programar una función bisiesto :: Integer -> Bool según la siguiente especificación:
-- problema bisiesto (a˜no: Z) : Bool {
-- requiere: {True}
-- asegura: {res=false ↔ a˜no no es m´ultiplo de 4 o a˜no es
-- múltiplo de 100 pero no de 400}
-- }

bisiesto :: Integer -> Bool
bisiesto x | mod x 4 /=0 = False
           | (mod x 100 ==0 && mod x 400 /=0) = False 
           | otherwise = True


-- Ejercicio 7) Implementar una función: distanciaManhattan:: (Float, Float, Float) -> (Float, Float, Float) -> Float
-- problema distanciaManhattan (P: R × R × R, Q: R × R × R) :R {
-- requiere: {True}
-- asegura: {res = sumatoria desde i=0 a 2 de |Pi-Qi|}
--}

distanciaManhattan:: (Float, Float, Float) -> (Float,Float, Float) -> Float
distanciaManhattan (x,y,z) (q,r,t) = abs(x-q)+abs(y-r)+abs(z-t)

-- Ejercicio 8) Implementar una función comparar :: Integer -> Integer -> Integer
-- problema comparar (a:Z, b:Z) : Z {
-- requiere: {True}
-- asegura: {(res= 1 ↔ sumaUltimosDosDigitos(a) <
-- sumaUltimosDosDigitos(b))}
-- asegura: {(res=-1 ↔ sumaUltimosDosDigitos(a) >
-- sumaUltimosDosDigitos(b))}
-- asegura: {(res= 0 ↔ sumaUltimosDosDigitos(a) =
-- sumaUltimosDosDigitos(b))}
-- }

-- Conviene definir primero una función sumaUltimosDosDigitos(a)

sumaUltimosDosDigitos :: Int -> Int
sumaUltimosDosDigitos k = (digitoDecenas k) + (digitoUnidades k)

comparar :: Int -> Int -> Int
comparar x y | ((sumaUltimosDosDigitos x) < (sumaUltimosDosDigitos y)) = 1
             | ((sumaUltimosDosDigitos x) > (sumaUltimosDosDigitos y)) = -1
             | ((sumaUltimosDosDigitos x) == (sumaUltimosDosDigitos y)) = 0

-- Ejercicio 9) 
-- d) Esta función toma dos números reales y calcula el promedio entre ellos.
-- e) Esta función toma una tupla de números reales y devuelve el promedio entre la primera coordenada de la tupla y la segunda coordeanda de la tupla.



