module Solucion where
import Data.Char
-- No se permite agrear nuevos imports
-- Sólo está permitido usar estas funciones:
-- https://campus.exactas.uba.ar/pluginfile.php/557895/mod_resource/content/1/validas_tp.pdf


-- Completar!
-- Nombre de grupo: {}
-- Integrante1: { DNI1,apellidoYNombre1}
-- Integrante2: { DNI2,apellidoYNombre2}
-- Integrante3: { DNI3,apellidoYNombre3}
-- Integrante4: { DNI4,apellidoYNombre4}
-- Integrantes que abandonaron la materia: {En caso que haya abandonado la materia algún
                        -- integrante, completar con los dni y apellidos, sino dejar vacío}

-- EJ 1
abecedario =['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

esMinuscula :: Char -> Bool
esMinuscula c = elem c abecedario 

-- EJ 2
posicion :: (Eq t)=> t -> [t] -> Int
posicion c [x] = 0
posicion c (x:xs) | c == x = 0
                  | otherwise = 1+posicion c xs

letraANatural :: Char -> Int
letraANatural c = posicion c abecedario

-- EJ 3
letraEnPosicion :: Int -> [Char] -> Char 
letraEnPosicion n (x:xs) | n/=0 = letraEnPosicion (n-1) xs
                         | otherwise = x

quitar :: (Eq t)=> t -> [t] -> [t]
quitar c [x] | c==x =[]
             | otherwise = [x]
quitar c (x:xs) | c/= x = x:quitar c xs 
                | otherwise = quitar c xs

ultimo :: [Char] -> Char
ultimo (x:xs) | xs/= [] = ultimo xs
              | otherwise = x
reverso :: [Char] -> [Char]
reverso [x] = [x] 
reverso (x:xs) = ultimo (x:xs):reverso (quitar (ultimo (x:xs)) (x:xs)) 

desplazar :: Char -> Int -> Char -- Ojo que falla si le metes un n >50 ó (-51)<n porque se acaba el ciclo de letras en el abecedario, el dominio es de -z a z
desplazar c n | n>=0 = letraEnPosicion ((posicion c abecedario)+n) (abecedario++(quitar 'z' (reverso abecedario))) -- "abcdefghijklmnopqrstuvwxy z yxwvutsrqponmlkjihgfedcba"
              | otherwise = letraEnPosicion ((posicion c (reverso abecedario))+(-n)) ((reverso abecedario)++(quitar 'a' abecedario))

-- EJ 4
pertenece :: Char-> String -> Bool
pertenece c [] =False 
pertenece c (x:xs) = c==x || pertenece c xs

cifrar :: String -> Int -> String
cifrar [x] n | pertenece x abecedario = [desplazar x n]
             | otherwise = [x]
cifrar (x:xs) n | pertenece x abecedario = (desplazar x n):cifrar xs n 
                | otherwise = x:cifrar xs n 

-- EJ 5
descifrar :: String -> Int -> String 
descifrar [x] n | pertenece x abecedario = [desplazar x (-n)]
                | otherwise = [x]
descifrar (x:xs) n | pertenece x abecedario = (desplazar x (-n)):descifrar xs n 
                    | otherwise = x:descifrar xs n 

-- EJ 6
elementoEnPosicion :: (Eq t)=> Int -> [t] -> t 
elementoEnPosicion n (x:xs) | n/=0 = elementoEnPosicion (n-1) xs
                         | otherwise = x

largo :: (Eq t)=> [t] -> Int
largo [] = 0
largo [x] = 1 
largo (x:xs) | xs/=[] =1+largo xs
             | otherwise = 0
             
cifrarTodos :: [String] -> Int -> [String]
cifrarTodos [] _ = []
cifrarTodos (x:xs) p | p<(largo (x:xs)) = cifrar (elementoEnPosicion p (x:xs)) p:cifrarTodos (x:xs) (p+1)
                     | otherwise = []

cifrarLista :: [String] -> [String] --Tengo que cifrar una lista donde la cantidad de pasos de "cifrar" sea igual al indice en la lista del elemento que se está cifrando.
cifrarLista [] = []
cifrarLista (x:xs) = cifrarTodos (x:xs) 0

-- EJ 7
cantidadDeApariciones :: (Eq t)=> t -> [t] -> Float
cantidadDeApariciones s [a] | s==a = 1
                            | otherwise = 0
cantidadDeApariciones s (x:xs) | s==x =1+cantidadDeApariciones s xs       
                               | otherwise = cantidadDeApariciones s xs

frecuenciaAux :: String -> String -> [Float] -- Leer comentario de la función "frecuencia" | ACLARACIÓN: hay que resolver el problema de si a los profes se les ocurre meter un string de un solo caracter , no sé si está bien el resultado de probar con el string abecedario
frecuenciaAux _ [] = [] -- si a los profes se les ocurre meter una lista vacía (que es 100% seguro que lo van a hacer) ya estamos preparados 3)
frecuenciaAux s abecedario  | tail s==[] && (largo abecedario)+1 /= 0 = 0.0:frecuenciaAux "0" (quitar (head abecedario) abecedario) -- Apenas la funcion machee con una lista de un solo elemento va a empezar a meter el valor 0.0 en la lista final hasta que se acaben las letras del abecedario
                            | pertenece (head abecedario) s && tail s/=[] =  ((cantidadDeApariciones (head abecedario) s) / (fromIntegral(largo s)))*100:frecuenciaAux s (quitar (head abecedario) abecedario) -- Si la función se da cuenta que una letra del abecedario pertenece al string, entonces hace la cuenta que te piden en la -críptica- especificación y quita la letra utilizada del abecedario y del string que le metiste (esto para evitar que haga la cuenta con el mismo elemento de abecedario; si ya hizo la cuenta con él, entonces lo desecha porque ya lo utilizó).
                            | not (pertenece (head abecedario) s) && tail s/=[] = 0.0:frecuenciaAux s (quitar (head abecedario) abecedario) -- Si la función se da cuenta que la letra del abecedario NO pertenece al string y el string tiene más letras, entonces enchufa un 0.0 en la lista y saca a esa letra del abecedario y vuelve a evaluarse la función con el string que ya tenías pero con una letra del abecedario diferente a con la que evaluaste antes (precisamente, la siguiente según el orden del abecedario).
                            | not (pertenece (head abecedario) s) && tail s==[] = 0.0:frecuenciaAux [head s] (quitar (head abecedario) abecedario) -- Si la función se da cuenta de que la letra del abecedario NO aparece en el string, entonces: mete un 0.0 en la lista y vuelve a evaluar la función con ese string de una letra y le saca esa letra inservible al abecedario.
                            | otherwise = ((cantidadDeApariciones (head abecedario) s) / (fromIntegral(largo s)))*100:frecuenciaAux "0" (quitar (head abecedario) abecedario) -- Si la función concluye que la letra del abecedario evaluada SÍ aparece en el string y además esa es la última letra del string, entonces: hace la cuenta pedida en la -enredada- especificación, lo mete en la lista, y fuerza al "loop" de la línea 101.

frecuencia :: String -> [Float] -- La especificación está súper rebuscada, en resumen te están pidiendo que hagas la siguiente cuenta para cada una de las letras del abecedario y el resultado lo vayas almacenando en una lista metas en una lista: para todo 0<=i<=|abecedario| , res[i]= (cantidad de aparaciones de abecedario[i] en el string/la cantidad de letras que hay en el string)*100
frecuencia s = frecuenciaAux s abecedario
 
-- Ej 8
cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente _ _ = ('o', 33.333336)

-- EJ 9
esDescifrado :: String -> String -> Bool
esDescifrado _ _ = False

-- EJ 10
todosLosDescifrados :: [String] -> [(String, String)]
todosLosDescifrados _ = [("compu", "frpsx"), ("frpsx", "compu")]

-- EJ 11
expandirClave :: String -> Int -> String
expandirClave _ _ = "compucom"

-- EJ 12
cifrarVigenere :: String -> String -> String
cifrarVigenere _ _ = "kdueciirqdv"

-- EJ 13
descifrarVigenere :: String -> String -> String
descifrarVigenere _ _ = "computacion"

-- EJ 14
peorCifrado :: String -> [String] -> String
peorCifrado _ _ = "asdef"

-- EJ 15
combinacionesVigenere :: [String] -> [String] -> String -> [(String, String)]
combinacionesVigenere _ _ _ = [("hola", "b")]
