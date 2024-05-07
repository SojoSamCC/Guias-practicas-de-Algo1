module Parcial where
------ Ejercicio 1 ------------------------------------------------------------------------------------------------------

hayQueCodificar :: Char -> [(Char,Char)]->Bool
hayQueCodificar c [(x,y)] = c==x
hayQueCodificar c ((x,y):xs) = c==x || hayQueCodificar c xs
-- 'a' [('a','b'),('s','t'),('g','e'),('a','r')]


------ Ejercicio 2 ------------------------------------------------------------------------------------------------------

cuantoSeRepite :: Char -> [Char] -> Int
cuantoSeRepite c [x] | c==x = 1
                     | otherwise = 0
cuantoSeRepite c (x:xs) | c==x = 1+cuantoSeRepite c xs
                        | otherwise = 0+ cuantoSeRepite c xs

cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)]->Int
cuantasVecesHayQueCodificar c [t] [(x,y)] | not (hayQueCodificar c [(x,y)]) = 0
                                          | otherwise = 1

cuantasVecesHayQueCodificar c (t:xs) ((x,y):ys) | not (hayQueCodificar c ((x,y):ys)) = 0
                                                | otherwise = cuantoSeRepite c (t:xs)
-- ['a','a','a'] [('a','b'),('s','t'),('g','e'),('a','r')]

------ Ejercicio 3 ------------------------------------------------------------------------------------------------------

esElmismo :: Char -> [Char] -> Bool
esElmismo c [x] = c==x
esElmismo c (x:xs) = c==x && esElmismo c xs 

quitarTodos :: Char -> [Char] -> [Char]
quitarTodos c [x] | c==x =[]
                  | otherwise = [x]
quitarTodos c (x:xs) | c==x = quitarTodos c xs    
                     | otherwise = x:quitarTodos c xs

sacarRepetidos :: [Char] -> [Char]
sacarRepetidos [] = []
sacarRepetidos (x:xs) = x:sacarRepetidos (quitarTodos x (x:xs))

segundo :: [Char] -> Char
segundo [x] = x
segundo (x:xs) = head xs

laQueMasHayQueCodificar :: [Char] -> [(Char,Char)] -> Char
laQueMasHayQueCodificar (x:xs) ((a,b):as) | esElmismo x (x:xs) = x
                                          | (cuantasVecesHayQueCodificar (head (sacarRepetidos (x:xs))) (x:xs) ((a,b):as)) >= (cuantasVecesHayQueCodificar (segundo (sacarRepetidos (x:xs))) (x:xs) ((a,b):as)) = laQueMasHayQueCodificar (quitarTodos (segundo (sacarRepetidos (x:xs))) (x:xs)) ((a,b):as)
                                          | otherwise = laQueMasHayQueCodificar (quitarTodos (head (sacarRepetidos (x:xs))) (x:xs)) ((a,b):as)

------ Ejercicio 4 ------------------------------------------------------------------------------------------------------

codigo :: Char -> [(Char,Char)] -> Char
codigo c ((a,b):as) | c==a = b
                    | otherwise = codigo c as
codificarFrase :: [Char] -> [(Char,Char)] -> [Char]
codificarFrase [x] ((a,b):as) | hayQueCodificar x ((a,b):as) = [codigo x ((a,b):as)] 
                              | otherwise = [x]
codificarFrase (x:xs) ((a,b):as) | hayQueCodificar x ((a,b):as) = codigo x ((a,b):as):codificarFrase xs ((a,b):as)
                                 | otherwise = x:codificarFrase xs ((a,b):as)

-- ['s','o','s'] [('s','o'),('o','t')]
-- ['s','o','s','a'] [('s','o'),('o','t')]