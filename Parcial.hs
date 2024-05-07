module SolucionT1 where

hayQueCodificar :: Char -> [(Char,Char)] -> Bool
hayQueCodificar _ [] = False 
hayQueCodificar c [(a,_)] = c == a
hayQueCodificar c ((a,_):xs) 
    |c /= a = hayQueCodificar c (xs)
    |otherwise = True

--------------------------------------------------------------------------------------------------

cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)] -> Int
cuantasVecesHayQueCodificar c frase mapeo
    |hayQueCodificar c mapeo = buscarEnFrase c frase
    |otherwise = 0

buscarEnFrase :: Char -> [Char] -> Int
buscarEnFrase c [x]
    |c == x = 1
    |otherwise = 0
buscarEnFrase c (x:xs)
    |c == x = 1 + buscarEnFrase c xs
    |otherwise = buscarEnFrase c (xs)

--------------------------------------------------------------------------------------------------

laQueMasHayQueCodificar :: [Char] -> [(Char,Char)] -> Char
laQueMasHayQueCodificar [x] mapeo = x -- no veo si hayQueCodificar x == True porque aseguran que uno pertenece si o si
laQueMasHayQueCodificar (x:xs) mapeo
    |cuantasVecesHayQueCodificar x (x:xs) mapeo == maximo (x:xs) mapeo = x
    |otherwise = laQueMasHayQueCodificar (xs) mapeo

maximo :: [Char] -> [(Char,Char)] -> Int
maximo [x] _ = 1
maximo (x:xs) mapeo
    |cuantasVecesHayQueCodificar x (x:xs) mapeo > maximo (xs) mapeo = cuantasVecesHayQueCodificar x (x:xs) mapeo
    |otherwise = maximo (xs) mapeo

--------------------------------------------------------------------------------------------------

codificarFrase :: [Char] -> [(Char,Char)] -> [Char]
codificarFrase [x] mapeo
    |hayQueCodificar x mapeo = [buscarCodificado x mapeo]
    |otherwise = [x]
codificarFrase (x:xs) mapeo
    |hayQueCodificar x mapeo = buscarCodificado x mapeo : codificarFrase (xs) mapeo 
    |otherwise = x : codificarFrase (xs) mapeo

buscarCodificado :: Char -> [(Char, Char)] -> Char
buscarCodificado c ((a,b):xs)
    |c == a = b
    |otherwise = buscarCodificado c xs

--------------------------------------------------------------------------------------------------
