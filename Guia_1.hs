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
-- b)
-- problema todoMenor(t1,t2:RXR):Bool{
-- asegura {la primera coordenada de t1 es menor que la primera coordenada de t2 ∧ la segunda coordeanda de t1 es menor que la segunda coordenada de t2}
--}
todoMenor :: (Int,Int) -> (Int,Int) -> Bool
todoMenor (x,y) (z,t) | x<z && y<t = True
                      | otherwise =False