-- Ejercicio 01

f :: Integer -> Integer
f 1 = 8
f 4 = 131
f 16 = 16

g :: Integer -> Integer
g 8 = 16
g 16 = 4
g 131 = 1

h :: Integer -> Integer
h n = f (g n)

k :: Integer -> Integer
k n = g (f n)

-- Ejercicio 02

absoluto :: Integer -> Integer
absoluto n | n > 0  = n
           | n == 0 = 0
           | n < 0  = -n

maximoAbsoluto :: Integer -> Integer -> Integer
maximoAbsoluto x y | absoluto x > absoluto y = absoluto x
                   | otherwise               = absoluto y

maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 x y z | maximoAbsoluto x y > maximoAbsoluto y z = maximoAbsoluto x y
              | otherwise                               = maximoAbsoluto y z

algunoEs0 :: Float -> Float -> Bool
algunoEs0 0 y = True
algunoEs0 x 0 = True
algunoEs0 x y = False

algunoEsCero :: Float -> Float -> Bool
algunoEsCero x y | x == 0 || y == 0 = True
                 | otherwise        = False

ambosSon0 :: Float -> Float -> Bool
ambosSon0 0 0 = True
ambosSon0 x y = False

ambosSonCero :: Float -> Float -> Bool
ambosSonCero x y | x == 0 && y == 0 = True
                 | otherwise        = False

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y | x <= 3 && y <= 3                    = True
                   | 3 < x && x <= 7 && 3 < y && y <= 7  = True
                   | 7 < x && 7 < y                      = True
                   | otherwise                           = False

sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos x y z | x /= y && y /= z && x /= z = x + y + z
                    | x /= y                     = x + y
                    | x /= z                     = x + z
                    | otherwise                  = x

esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe m n = mod m n == 0

digitoUnidades :: Integer -> Integer
digitoUnidades n = mod n 10

digitoDecenas :: Integer -> Integer
digitoDecenas n = digitoUnidades (div n 10)

-- Ejercicio 03

estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b = esMultiploDe a b

-- Ejercicio 04

prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt (a,b) (c,d) = a*c + b*d

todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor (a,b) (c,d) = a < c && b < d

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (a,b) (c,d) = sqrt((c - a)**2 + (d - b)**2)

sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (a,b,c) = a + b + c

sumarSoloMultiplos :: (Integer, Integer, Integer) -> Integer -> Integer
sumarSoloMultiplos (x,y,z) n | esMultiploDe x n && esMultiploDe y n && esMultiploDe z n = x + y + z
                             | esMultiploDe x n && esMultiploDe y n                     = x + y
                             | esMultiploDe x n && esMultiploDe z n                     = x + z
                             | esMultiploDe y n && esMultiploDe z n                     = y + z
                             | esMultiploDe x n                                         = x
                             | esMultiploDe y n                                         = y
                             | esMultiploDe z n                                         = z
                             | otherwise                                                = 0

posPrimerPar :: (Integer, Integer, Integer) -> Integer
posPrimerPar (x,y,z) | esMultiploDe x 2 = 1
                     | esMultiploDe y 2 = 2
                     | esMultiploDe z 2 = 3
                     | otherwise        = 4

crearPar :: a -> b -> (a, b)
crearPar x y = (x,y)

invertir :: (a, b) -> (b, a)
invertir (x,y) = (y,x)

-- Ejercicio 05

todosMenores :: (Integer, Integer, Integer) -> Bool
todosMenores (x,y,z) = f5 x > g5 x && f5 y > g5 y && f5 z > g5 z

f5 :: Integer -> Integer
f5 n | n <= 7 = n^2
     | n > 7  = 2*n + 1

g5 :: Integer -> Integer
g5 n | esPar n   = div n 2
     | otherwise = 3*n + 1

esPar :: Integer -> Bool
esPar n = mod n 2 == 0

-- Ejercicio 06

bisiesto :: Integer -> Bool
bisiesto n = not(esMultiploDe n 4) || (esMultiploDe n 100 && not(esMultiploDe n 400))

-- Ejercicio 07

distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (a,b,c) (x,y,z) = abs (x - a) + abs (y - b) + abs (z - c)

comparar :: Integer -> Integer -> Integer
comparar a b | sumaUltimosDosDigitos a < sumaUltimosDosDigitos b  = 1
             | sumaUltimosDosDigitos a > sumaUltimosDosDigitos b  = -1
             | sumaUltimosDosDigitos a == sumaUltimosDosDigitos b = 0

sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos n = mod n 10 + mod (div n 10) 10