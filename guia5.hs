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
                | otherwise = x:(quitar e xs)

-- Ejercicio 3.3)

sacarMenor :: (Ord t)=>t -> [t] ->t
sacarMenor e (x:xs) | e>=x && xs==[] = e
                    | e<=x && xs==[] = x
                    | e>=x && xs/=[] = sacarMenor e xs
                    | e<=x && xs/=[] = sacarMenor x xs
                    | otherwise = sacarMenor e (quitar x xs)

maximo :: (Ord s)=>[s] -> s 
maximo [x] = x
maximo (x:xs) = sacarMenor x (x:xs)

-- Ejercicio 3.9)

ordenar :: [Int]->[Int]
ordenar [x]=[x]
ordenar (x:xs) | x> head xs = ordenar (x:[quitar (head xs) xs]) --debo arreglar esto