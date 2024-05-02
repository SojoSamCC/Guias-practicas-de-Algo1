{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Use list literal" #-}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

--Ejercicio 1)
-- 1)
longitud :: (Eq t)=>[t] -> Integer
longitud (x:xs) | null xs = 1
                | otherwise = 1+ longitud xs

-- 2)
ultimo :: (Eq t)=> [t] -> t
ultimo (x:xs) | null xs = x
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
todosIguales (x:xs) = x ==head xs && todosIguales xs

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
                     | otherwise = x:xs

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
sumarN e (x:xs) = (e+x) : sumarN e xs

--5)
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [x] = [x+x]
sumarElPrimero (x:xs) = sumarN x (x:xs)

--6)
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo [x] = [x+x]
sumarElUltimo (x:xs) = sumarN (ultimo (x:xs)) (x:xs)

--7)
pares :: [Integer] -> [Integer]
pares [x] | even x = [x]
          | otherwise = []
pares (x:xs) | even x = x:pares xs
             | otherwise = pares xs

--8)
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN e [x] | mod x e ==0 = [x]
                   | otherwise = []
multiplosDeN e (x:xs) | mod x e == 0 = x:multiplosDeN e xs
                      | otherwise = multiplosDeN e xs

--9)
menor :: (Ord s)=>[s] ->s
menor [x] = x
menor (x:xs) = sacarMayor x (x:xs)

ordenar :: [Int]->[Int]
ordenar [x]=[x]
ordenar (x:xs) = menor (x:xs):ordenar (quitar (menor (x:xs)) (x:xs))

-- Lo hago otra vez sin ver la función que hice en clase

menor2 :: (Ord t)=> [t] -> t
menor2 [x] = x
menor2 (x:xs) | x<menor2 xs = x
              | otherwise = menor2 xs

ordenar2 :: [Integer] -> [Integer]
ordenar2 [x] = [x]
ordenar2 (x:xs) = menor2 (x:xs): ordenar2 (quitar (menor2 (x:xs)) (x:xs)) -- También se puede reemplazar quitar por quitarTodos
-- Acabo de terminar el ejercicio cumpliendo honestamente mi promesa de no ver cómo resolví este mismo ejercicio en clase
-- y estoy impresionado con el resultado, casi literalmente pensé lo mismo que en aquel momento y las respuestas son casi 
-- exactas.

-- Ejercicio 4)
-- a)
sacarBlancosRepetidos :: String -> String -- NOTA: para referirse a los Char hay que usar ' ' y no " "
sacarBlancosRepetidos [x,y] | x== ' ' && y== ' ' = [x]
                            | otherwise = [x,y]
sacarBlancosRepetidos (x:xs) | x == ' ' && head xs == ' ' = x:tail xs
                             | otherwise = x:head xs:sacarBlancosRepetidos (tail xs)
-- ['s','a','l','i','r', ' ' , ' ', 'd', 'e', ' ', 'a', 'q', ' ', ' ', 'u', 'i']

-- b)
contarPalabras :: String -> Integer
contarPalabras [x] | x==' ' = 0
                   | otherwise = 1
contarPalabras [x,y] | x==' ' && y== ' ' =0
                     | otherwise = 1
contarPalabras (x:y:xs) | x==' ' =0+contarPalabras (y:xs)
                        | x/= ' ' && y==' ' = 1+contarPalabras xs
                        | otherwise = 0+contarPalabras xs

-- c)
palabra :: String -> String --Esto reconoce la primera palabra en la lista
palabra [] = []
palabra [' '] = []
palabra (x:xs) | x/=' ' = x:palabra xs
               | otherwise = []

quitarPalabra :: String -> String -> String --Esto quita la palabra que quieras de cualquier lista de Char
quitarPalabra _ [] = []
quitarPalabra [] (y:ys) = y:ys
quitarPalabra [x] [a] | x==a = []
                      | otherwise = [a]
quitarPalabra _ (' ':ys) = ys
quitarPalabra (x:xs) (y:ys) | x ==y = quitarPalabra xs ys
                            | otherwise = y:quitarPalabra (x:xs) ys

palabras :: String -> [String] --Esto me devuelve una lista donde los elementos son las palabras de la lista (sin los espacios)
palabras [] = []
palabras [x]  | x/= ' '= [[x]]
              | otherwise = [[]]
palabras (x:y:xs) | x /= ' ' && y/= ' ' = palabra (x:y:xs):palabras (quitarPalabra (x:xs) (x:xs))
                  | otherwise = palabras (y:xs)

-- [' ','s','a','l','i','r', ' ' , ' ', 'd', 'e', ' ', 'a', 'q', ' ', ' ', 'u', 'i',' ']
-- d)
primero :: [t]->t
primero [x] = x
primero (x:xs) = x

segundo :: [t] -> t
segundo [x] = x
segundo (x:xs) = head xs

tercero :: [t] -> t
tercero [x] = x
tercero (x:xs) = head (tail xs)

palabraMasLarga :: String -> String
palabraMasLarga [] = []
palabraMasLarga [x] = [x]
palabraMasLarga (x:xs) | longitud (primero (palabras (x:xs))) >= longitud (segundo (palabras (x:xs))) = primero (palabras (x:xs))
                       | otherwise = palabraMasLarga xs

-- [[' ','s','a','l','i','r', ' ' , ' ', 'd', 'e', ' ', 'a', 'q', ' ', ' ', 'u', 'i',' ']]
--e) 
aplanar :: [String] -> String
aplanar [[]] = []
aplanar [[x]] = [x]
aplanar (x:xs) | xs /= [] = x++aplanar xs
               | otherwise = x
-- [[' ','s','a','l','i','r'],['d','e'],['a','q','u','i']]

--f)
aplanarConBlancos :: [String] -> String
aplanarConBlancos [x] =x
aplanarConBlancos [x,y] = x++[' ']++y
aplanarConBlancos (x:y:xs) | xs /= [] = x++[' ']++y++[' ']++aplanar xs
                           | null xs = ' ':y

--g)
listaNEspacios :: Integer -> String
listaNEspacios 0 = []
listaNEspacios n = ' ' : listaNEspacios (n-1)

aplanarConNBlancos :: [String] -> Integer -> String
aplanarConNBlancos [x] 1 =x
aplanarConNBlancos [x,y] n = x++listaNEspacios n++y
aplanarConNBlancos (x:y:xs) n | xs /= [] = x++listaNEspacios n++y++listaNEspacios n++aplanar xs
                              | null xs = listaNEspacios n++y

--Ejercicio 5)
--1)
quitarn :: (Eq t) => t -> [t] -> [t]
quitarn _ [] = []
quitarn e [x] = []
quitarn e (x:xs) | e==x = xs
                | not (pertenece e xs) = x:xs
                | otherwise = x:quitar e xs
sumatoriat :: (Num t) => [t] -> t
sumatoriat [x] = x
sumatoriat (x:xs) = x+sumatoriat xs

sumaAcumuladaAux :: (Num t) => [t] -> [t] --Me tiene que devolver una lista donde cada elemento (de posición i) de esa lista sea la suma hasta la posición i de los 
sumaAcumuladaAux [x] = [x]                -- elementos de la lista de entrada.
sumaAcumuladaAux (x:xs) = sumatoriat (x:xs) : sumaAcumuladaAux (principio (x:xs))

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada (x:xs) = reverso (sumaAcumuladaAux (x:xs))
sacarMenor :: (Ord t)=>t -> [t] ->t
sacarMenor e (x:xs) | e>=x && null xs = e
                    | e<=x && null xs = x
                    | e>=x && xs/=[] = sacarMenor e xs
                    | e<=x && xs/=[] = sacarMenor x xs
                    | otherwise = sacarMenor e (quitar x xs)

--2)
menorDivisorHasta :: Integer -> Integer -> Integer
menorDivisorHasta n i | mod n i ==0 = i
                      | otherwise = menorDivisorHasta n (i+1)

menorDivisor :: Integer ->Integer
menorDivisor 1 = 1
menorDivisor n = menorDivisorHasta n 2

esPrimo :: Integer ->Bool
esPrimo n = menorDivisor n == n

primosHastaAux :: [Integer] -> [Integer]
primosHastaAux [2] = [2]
primosHastaAux [n] | esPrimo n = n : primosHastaAux [n-1]
                | otherwise = primosHastaAux [n-1]

primosHasta :: [Integer] -> [Integer]
primosHasta (x:xs) = reverso (primosHastaAux (x:xs))

multiplicaPrimos :: [Integer] -> [Integer]
multiplicaPrimos [0] = [0]
multiplicaPrimos [x] | esPrimo x = [x]
                     | not (esPrimo x) && mod x (head (primosHasta [x])) ==0 = head (primosHasta [x]) : multiplicaPrimos [div x (head (primosHasta [x]))]
                     | not (esPrimo x) && mod x (head (primosHasta [x])) /=0 && mod x (segundo (primosHasta [x])) ==0 = segundo (primosHasta [x]) : multiplicaPrimos [div x (segundo (primosHasta [x]))]
                     | otherwise = tercero (primosHasta [x]) : multiplicaPrimos [div x (tercero (primosHasta [x]))]

descomponerEnPrimos :: [Integer] -> [[Integer]] 
descomponerEnPrimos [x] = [multiplicaPrimos [x]]
descomponerEnPrimos (x:xs) = multiplicaPrimos [x] : descomponerEnPrimos xs
--descomponerEnPrimos me costó un montón. Sé que no está para nada optimizada pero ya fue, estoy cansado de darle tantas vueltas a esa función
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Funciones que quedaron de la clase práctica

sacarMayor :: (Ord t)=>t -> [t] -> t
sacarMayor e (x:xs) | e>=x && null xs = x
                    | e<=x && null xs = e
                    | e>=x && xs/=[] = sacarMayor x xs
                    | e<=x && xs/=[] = sacarMayor e xs
                    | otherwise = sacarMayor e (quitar e xs)

cambiar_menor_a_mayor :: (Ord t)=>t -> t -> [t]
cambiar_menor_a_mayor e x | e>=x = [x,e]
                          | otherwise = [e,x]



