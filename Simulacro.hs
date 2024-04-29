vacia :: (Eq t)=> [t] -> Bool
vacia e = e/=[]

sonIguales :: (String,String) -> (String, String) -> Bool
sonIguales (x,y) (a,b) = (x==a && y==b) || (x==b && y==a)

pertenece :: (Eq t) => t-> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs) = e==x || pertenece e xs

pertenece2 :: (Eq t) => t-> (t,t) -> Bool
pertenece2 e (x,y) = e==x || e==y

quitar :: (Eq t)=> t -> [t] ->[t]
quitar _ [] = []
quitar e (x:xs) | e==x = quitar e xs
                | otherwise = x:quitar e xs

quitar2 :: (Eq t)=> t -> (t,t) -> t
quitar2 e (x,y) | e==x = y
                | otherwise = x
            
-- ("1","2") [("1","2"), ("3","4"),("7","8")] 
seRepite ::(String,String) -> [(String,String)] -> Bool
seRepite _ [] =False
seRepite _ [(a,b)] = False
seRepite (x,y) ((a,b):xs) = sonIguales (x,y) (a,b) && pertenece (x,y) xs 

seRepite1 ::String -> [String] -> Bool
seRepite1 _ [] =False
seRepite1 _ [a] = False
seRepite1 e (x:xs) = (e==x && pertenece e xs) || seRepite1 e xs

sacarTupla :: [(String,String)] -> [String]
sacarTupla [] = []
sacarTupla ((x,y):xs) = x:y:sacarTupla xs

sacarRepetidos :: [String] -> [String]
sacarRepetidos [] = []
sacarRepetidos (x:xs)  
                      | not (seRepite1 x xs) = x:sacarRepetidos (quitar x xs)
                      | otherwise = x:sacarRepetidos xs

-- ["1","2","3","1","2","3"]

-- [("1","2"), ("3","4"),("7","8")]
relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = False
relacionesValidas ((x,y):xs) = seRepite (x,y) xs

personas :: [(String, String)] -> [String]
personas [] = ["nadie"]
personas ((x:xs)) | relacionesValidas (x:xs) = sacarRepetidos (sacarTupla (x:xs))
                  | otherwise =["No hay relaciones validas"]

-- [("Juan","Marcelo"),("Valeria","Pedro"),("Pepe","Mario"),("Juan","Maria")]

amigosDe :: String -> [(String, String)] -> [String]
amigosDe "nadie" [] = ["nadie"]
amigosDe _ [] = []
amigosDe e ((x,y):xs) | not (relacionesValidas ((x,y):xs)) = ["No hay relaciones validas"]
                      | pertenece2 e (x,y) && relacionesValidas ((x,y):xs) = (quitar2 e (x,y)):(amigosDe e xs)
                      | otherwise = amigosDe e xs
                      
verRepetidos :: String -> [String] -> Integer
verRepetidos _ [] = 0
verRepetidos e [a] | e==a = 1
                   | otherwise = 0
verRepetidos e (x:xs) | e==x = 1+ verRepetidos e xs
                      | otherwise = verRepetidos e xs

maximo :: [String] -> String
maximo [] = "Nadie"
maximo [x] = x 
maximo (x:xs) | verRepetidos x (x:xs) >= verRepetidos (head xs) xs = maximo (x:tail xs)
              | otherwise = maximo xs
 
-- ["pepe","Juan","pepe","Maria","Juan","Maria","Carlos","Juan"]

personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos [] = "yo"
personaConMasAmigos ((x:xs)) = maximo (sacarTupla (x:xs))