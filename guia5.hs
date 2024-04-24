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
principio :: (Eq t)=> [t] -> [t]
principio (x:xs) | xs ==[] = []
                 | otherwise = x:principio xs

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs) = e==x || pertenece e xs

hayRepetidos :: (Eq t)=> [t] -> Bool
hayRepetidos [] = False
--Para referirnos a una lista con un solo elemento podemos hacer (x:[]) o [x]
hayRepetidos [x] =False
hayRepetidos (x:xs) = pertenece x xs || hayRepetidos xs

--Ejrcicio 2.5)

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar e [x] = []
quitar e (x:xs) | e==x = xs
                | not (pertenece e xs) = x:xs
                | otherwise = x:quitar e xs

-- Ejercicio 3.3)

sacarMenor :: (Ord t)=>t -> [t] ->t
sacarMenor e (x:xs) | e>=x && null xs = e
                    | e<=x && null xs = x
                    | e>=x && xs/=[] = sacarMenor e xs
                    | e<=x && xs/=[] = sacarMenor x xs
                    | otherwise = sacarMenor e (quitar x xs)

maximo :: (Ord s)=>[s] -> s
maximo [x] = x
maximo (x:xs) = sacarMenor x (x:xs)

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

