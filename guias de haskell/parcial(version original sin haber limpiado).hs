module SolucionT1 where
---- Ejercicio 1 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

cantidadRepetidos :: [Char] -> [[Char]] -> Int -- Esta función dice la cantidad de veces que se repite un producto en la lista de productos dada.
cantidadRepetidos (p:ps) [producto] | (p:ps)==producto = 1   
                                    | otherwise = 0
cantidadRepetidos (p:ps) ((producto:xs)) | (p:ps)==producto =1+cantidadRepetidos (p:ps) xs
                                         | otherwise = cantidadRepetidos (p:ps) xs

quitarProducto :: [Char] -> [[Char]] -> [[Char]] -- Esta función quita de la lista que le des, todas las apariciones del producto que le des.
quitarProducto producto [[x]] | producto==[x] = [[]]
                              | otherwise = [[x]]
quitarProducto producto ((x:xs)) | producto==x = quitarProducto producto xs
                                 | otherwise = x:quitarProducto producto xs

generarStock :: [[Char]] -> [([Char],Int)] -- Esta función genera una lista de tuplas producto X stock gracias a la lista de productos que le diste (no importa si hay productos repetidos en tu lista)
generarStock [[]] = [([],0)]
generarStock ((producto:ps)) = (producto,cantidadRepetidos producto (producto:ps)):generarStock (quitarProducto producto ps) 

---- Ejercicio 2 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

pertenece :: [Char] -> [([Char],Int)] -> Bool -- Esta función te avisa si un producto pertenece -o no- a una lista donde se encuentren tus productos con sus precios en la forma producto X precio.
pertenece producto [] = False
pertenece producto (((x,y):xs)) = producto==x || pertenece producto xs

stockDeProducto :: [([Char],Int)] -> [Char] -> Int -- Esta función te dice exactamente el stock que te queda del producto que quieras en la lista de productos de la forma producto X stock.
stockDeProducto ((productoS,stock):ps) producto | not (pertenece producto ((productoS,stock):ps)) = 0
                                                | producto==productoS = stock
                                                | otherwise = stockDeProducto ps producto  

---- Ejercicio 3 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- NOTA:
-- DE LA ESPECIFICACIÓN ENTIENDO QUE: CADA PRECIO SE MULTIPLICA POR SU STOCK Y SE SUMA ESE RESULTADO CON EL RESULTADO DE HABER HECHO ESA OPERACIÓN PARA EL PRODUCTO SIGUIENTE, Y ASÍ HASTA TERMINAR LA LISTA DE PRODUCTOS EN STOCK.

dineroEnStock :: [([Char],Int)] -> [([Char],Float)] -> Float -- Esta función te dice todo el dinero que tienes en stock, o sea, la sumatoria entre todos los resultados de haber hecho: el producto entre, el valor de cada producto por su precio 
dineroEnStock [(producto,stock)] [(productoP,precio)] = precio*fromIntegral(stock)
dineroEnStock (((producto,stock):pss)) (((productoP,precio):pps)) = precio*fromIntegral(stock)+dineroEnStock pss pps

---- Ejercicio 4 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

buscarPrecio :: [Char] -> [([Char],Float)] -> Float -- Esta función busca el precio de un producto en una lista de la forma producto X precio.
buscarPrecio producto [(x,precio)] | producto == x = precio
                                   | otherwise = 0
buscarPrecio producto ((productoP,precio):pps) | producto==productoP = precio
                                               | otherwise = buscarPrecio producto pps

aplicarOferta :: [([Char],Int)] -> [([Char],Float)] -> [([Char],Float)] -- Esta función aplica una oferta del 80% sobre el precio de todo producto en la lista de productos que le des (con la forma producto X stock, y con la forma producto X precio) si -y solo si- tienes al menos 11 unidades del producto en stock.
aplicarOferta [(producto,stock)] listaPrecios | stock>10 = [(producto,(buscarPrecio producto listaPrecios)*0.80)]
                                              | otherwise = [(producto,buscarPrecio producto listaPrecios)]
aplicarOferta ((producto,stock):ps) listaPrecios | stock>10 = (producto,(buscarPrecio producto listaPrecios)*0.80):aplicarOferta ps listaPrecios
                                                 | otherwise = (producto,buscarPrecio producto listaPrecios):aplicarOferta ps listaPrecios