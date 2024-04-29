{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Use list literal" #-}

--Ejercicio 1)
-- 1)
longitud :: (Eq t)=>[t] -> Integer
longitud (x:xs) | xs==[] = 1
                | otherwise = 1+ longitud xs

-- 2)
ultimo :: (Eq t)=> [t] -> t
ultimo (x:xs) | xs==[] = x
              | otherwise = ultimo xs 
-- 3) 
principio :: [t] -> [t]
principio [x,y] = [x]
principio (x:xs) = x:principio xs

--4)
ultimo2 :: [t] -> t
ultimo2 [x] = x
ultimo2 (x:xs) = ultimo2 xs 
              
reverso :: [t] -> [t] 
reverso [x,y] = [y,x]
reverso (x:xs) = ultimo2 xs:reverso (principio (x:xs))

-- [1,2,3,4,5,6,7,8,5,4,3,23,2,4,5,7,78,0]


-- Ejercicio 2

--1)

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs) = e==x || pertenece e xs

--2)
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [x] = True
todosIguales (x:xs) = x ==(head xs) && todosIguales xs

--3)
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [x,y] = x/=y
todosDistintos (x:xs) = not (pertenece x xs) && todosDistintos xs  

--4)

hayRepetidos :: (Eq t)=> [t] -> Bool
hayRepetidos [] = False
--Para referirnos a una lista con un solo elemento podemos hacer (x:[]) o [x]
hayRepetidos [x] =False
hayRepetidos (x:xs) = pertenece x xs || hayRepetidos xs

--5)

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar e [x] = []
quitar e (x:xs) | e==x = xs
                | not (pertenece e xs) = x:xs
                | otherwise = x:quitar e xs

--6)
quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos e [x] | e==x = []
                  | otherwise = [x]

quitarTodos e (x:xs) | pertenece e (x:xs) && e==x = quitarTodos e (quitar e (x:xs))
                     | pertenece e (x:xs) && e/=x = x: quitarTodos e xs
                     | otherwise = (x:xs)

--7)
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [x,y] | x/=y = [x,y]
                        | otherwise = [x]
eliminarRepetidos (x:xs) | pertenece x xs = x:eliminarRepetidos (quitarTodos x xs)
                         | otherwise = x:eliminarRepetidos xs

--8)
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [x] [y] = x==y
mismosElementos (x:xs) (y:ys) = longitud (x:xs)==longitud(y:ys) && pertenece x (y:ys) && pertenece y (x:xs) && mismosElementos xs ys 

-- 9)
-- [1,2,3,4,5,6,7,8,5,4,3,23,2,4,5,7,78,0]
capicua :: (Eq t) => [t] -> Bool
capicua (x:xs) = (x:xs)==reverso (x:xs)
-- Ejercicio 3.3)

--Ejercicio 3)

--1)
sumatoria :: [Integer] -> Integer
sumatoria [x] = x
sumatoria (x:xs) = x+sumatoria xs

--2)
productoria :: [Integer] -> Integer
productoria [x] = x
productoria (x:xs) = x*productoria xs

--3)
maximo :: (Ord s)=>[s] -> s
maximo [x] = x
maximo (x:xs) = sacarMenor x (x:xs)

--4) 
sumarN :: Integer -> [Integer] -> [Integer]
sumarN e [x] = [e+x]
sumarN e (x:xs) = [e+x]++sumarN e xs

--5)
sumarElPrimero :: [Integer] -> [Integer]
sacarMenor :: (Ord t)=>t -> [t] ->t
sacarMenor e (x:xs) | e>=x && null xs = e
                    | e<=x && null xs = x
                    | e>=x && xs/=[] = sacarMenor e xs
                    | e<=x && xs/=[] = sacarMenor x xs
                    | otherwise = sacarMenor e (quitar x xs)

sacarMayor :: (Ord t)=>t -> [t] -> t
sacarMayor e (x:xs) | e>=x && xs==[] = x
                    | e<=x && xs==[] = e
                    | e>=x && xs/=[] = sacarMayor x xs
                    | e<=x && xs/=[] = sacarMayor e xs
                    | otherwise = sacarMayor e (quitar e xs)

menor :: (Ord s)=>[s] ->s
menor [x] = x
menor (x:xs) = sacarMayor x (x:xs)

-- Ejercicio 3.9)

cambiar_menor_a_mayor :: (Ord t)=>t -> t -> [t]
cambiar_menor_a_mayor e x | e>=x = [x,e]
                          | otherwise = [e,x]

ordenar :: [Int]->[Int]
ordenar [x]=[x]
ordenar (x:xs) = menor (x:xs):ordenar (quitar (menor (x:xs)) (x:xs))

