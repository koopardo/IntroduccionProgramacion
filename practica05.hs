--Ejercicio 01

longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

ultimo :: [t] -> t
ultimo (x:[]) = x
ultimo (x:xs) = ultimo xs

principio :: [t] -> [t]
principio (x:[]) = []
principio (x:xs) = [x] ++ principio xs

reverso :: [t] -> [t]
reverso [] = []
reverso xs = [ultimo xs] ++ reverso (principio xs)

--Ejercicio 02

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e []     = False
pertenece e (x:xs) = e == x || pertenece e xs

todosIguales :: (Eq t) => [t] -> Bool
todosIguales []     = True 
todosIguales (x:[]) = True
todosIguales (x:xs) = pertenece x xs && todosIguales xs

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos []     = True
todosDistintos (x:[]) = True
todosDistintos (x:xs) = not(pertenece x xs) && todosDistintos xs

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos xs = not(todosDistintos xs)

quitar :: (Eq t) => t -> [t] -> [t]
quitar x []                 = []
quitar x (y:ys) | x == y    = ys
                | otherwise = [y] ++ quitar x ys

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos x []                 = []
quitarTodos x (y:ys) | x == y    = quitarTodos x ys
                     | otherwise = [y] ++ quitarTodos x ys

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos []                      = []
eliminarRepetidos (x:xs) | pertenece x xs = [x] ++ eliminarRepetidos(quitarTodos x xs)
                         | otherwise      = [x] ++ eliminarRepetidos xs

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] []                                                                           = True
mismosElementos (x:xs) ys | longitud(eliminarRepetidos(x:xs)) == longitud(eliminarRepetidos ys) = mismosElementos (quitarTodos x xs) (quitarTodos x ys)
                          | otherwise                                                           = False

capicua :: (Eq t) => [t] -> Bool
capicua xs = reverso xs == xs

--Ejercicio 03

sumatoria :: [Integer] -> Integer
sumatoria []     = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Integer] -> Integer
productoria []     = 1
productoria (x:xs) = x*productoria xs

maximo :: [Integer] -> Integer
maximo (x:[])               = x
maximo (x:y:ys) | x >= y    = maximo ([x] ++ ys)
                | otherwise = maximo (y:ys)

sumarN :: Integer -> [Integer] -> [Integer]
sumarN n []     = []
sumarN n (x:xs) = [x+n] ++ sumarN n xs

sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarN x (x:xs)

sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo xs = sumarN (ultimo xs) xs

pares :: [Integer] -> [Integer]
pares []                    = []
pares (x:xs) | mod x 2 == 0 = [x] ++ pares xs
             | otherwise    = pares xs

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n []                    = []
multiplosDeN n (x:xs) | mod x n == 0 = [x] ++ multiplosDeN n xs
                      | otherwise    = multiplosDeN n xs

ordenar :: [Integer] -> [Integer]
ordenar (x:[]) = [x]
ordenar xs     = ordenar (quitar (maximo xs) xs) ++ [maximo xs]

--Ejercicio 04

sacarBlancosRepetidos :: [Char] ->  [Char]
sacarBlancosRepetidos [x]                             = [x]
sacarBlancosRepetidos (x:y:ys) | x == ' ' && y == ' ' = sacarBlancosRepetidos (y:ys)
                               | otherwise            = [x] ++ sacarBlancosRepetidos (y:ys)

contarPalabras :: [Char] -> Integer
contarPalabras []                 = 0
contarPalabras (x:xs) | x /= ' '  = 1 + contarPalabras (eliminarPrimerPalabra (x:xs))
                      | otherwise = contarPalabras (limpiarBlancos xs)
  

--limpiarBlancos:: saca los blancos repetidos y elimina (si es que hay) el ultimo y el primer blanco de la lista.

limpiarBlancos :: [Char] -> [Char]
limpiarBlancos xs | ultimo xs == ' ' && head xs == ' ' = quitar ' ' (reverso (quitar ' ' (reverso (sacarBlancosRepetidos xs))))
                  | ultimo xs == ' ' && head xs /= ' ' = reverso (quitar ' ' (reverso (sacarBlancosRepetidos xs))) 
                  | ultimo xs /= ' ' && head xs == ' ' = quitar ' ' (sacarBlancosRepetidos xs)
                  | ultimo xs /= ' ' && head xs /= ' ' = sacarBlancosRepetidos xs              

-- eliminarPrimerPalabra: agarra una lista de palabras, si su primer elemento no es un espacio en blanco, borra la primer palabra que ahi aparece.
-- Si el primer elemento es un espacio en blanco, no hace nada.

eliminarPrimerPalabra :: [Char] -> [Char]
eliminarPrimerPalabra xs     | not (pertenece ' ' xs) = []
eliminarPrimerPalabra (x:xs) | x /= ' '               = eliminarPrimerPalabra xs
                             | otherwise              = (x:xs)
 

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga xs | not(pertenece ' ' (limpiarBlancos xs))                                                              = limpiarBlancos xs
palabraMasLarga xs | longitud (primerPalabra xs) >= longitud (primerPalabra (eliminarPrimerPalabra (limpiarBlancos xs))) = palabraMasLarga (primerPalabra xs ++ eliminarPrimerPalabra (limpiarBlancos (eliminarPrimerPalabra (limpiarBlancos xs))))
                   | otherwise                                                                                           = palabraMasLarga (eliminarPrimerPalabra (limpiarBlancos xs))

-- primerPalabra: devuelve la primer palabra de una lista.

primerPalabra :: [Char] -> [Char]
primerPalabra xs | todosIguales xs && head xs == ' ' || xs == []                        = []
                 | not (pertenece ' ' xs)                                               = xs
                 | head (quitar (head (limpiarBlancos xs)) (limpiarBlancos xs))  /= ' ' = [head (limpiarBlancos xs)] ++ primerPalabra (quitar (head (limpiarBlancos xs)) (limpiarBlancos xs)) 
                 | head (quitar (head (limpiarBlancos xs)) (limpiarBlancos xs))  == ' ' = [head (limpiarBlancos xs)]                                                                                        

palabras :: [Char] -> [[Char]]
palabras [] = []
palabras xs = [primerPalabra xs] ++ palabras (eliminarPrimerPalabra (limpiarBlancos xs))

aplanar :: [[Char]] -> [Char]
aplanar []     = []
aplanar (x:xs) = x ++ aplanar xs

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos []     = []
aplanarConBlancos (x:xs) = x ++ [' '] ++ aplanarConBlancos xs


aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos []  n    = []
aplanarConNBlancos (x:xs) n = x ++ nBlancos n ++ aplanarConNBlancos xs n

nBlancos :: Integer -> [Char]
nBlancos 0 = []
nBlancos n = [' '] ++ nBlancos (n-1)

