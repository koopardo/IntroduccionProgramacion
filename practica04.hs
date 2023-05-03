-- Ejercicio 01

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

-- Ejercicio 02

parteEntera :: Float -> Integer
parteEntera x | x < -1          = -1 + parteEntera (x + 1)
parteEntera (-1)                = -1
parteEntera x | x > -1 && x < 1 = 0
parteEntera 1                   = 1
parteEntera x | x > 1           = 1 + parteEntera (x-1)

-- Ejercicio 03

esDivisible :: Integer -> Integer -> Bool
esDivisible a b | a < b    = False
esDivisible a b | a == b   = True
esDivisible a b |otherwise = esDivisible (a-b) b

-- Ejercicio 04

sumaImpares :: Integer -> Integer
sumaImpares 1 = 1
sumaImpares n = 2*n-1 + sumaImpares (n-1)

-- Ejercicio 05

medioFact :: Integer -> Integer
medioFact 1 = 1
medioFact 2 = 2
medioFact n = n*medioFact(n-2)

-- Ejercicio 06

sumaDigitos :: Integer -> Integer
sumaDigitos n | n < 10 = n
sumaDigitos n | otherwise = digitoUnidades n + sumaDigitos (quitarDigitoUnidades n)

digitoUnidades :: Integer -> Integer
digitoUnidades n = mod n 10

quitarDigitoUnidades :: Integer -> Integer
quitarDigitoUnidades n = div n 10

-- Ejercicio 07

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n | n < 100   = digitoUnidades n == digitoDecenas n
                      | otherwise = todosDigitosIguales (quitarDigitoUnidades n) 

digitoDecenas :: Integer -> Integer
digitoDecenas n = digitoUnidades (quitarDigitoUnidades n)

-- Ejercicio 08

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i | i == 1    = digitoUnidades n
                 | otherwise = iesimoDigito (quitarDigitoUnidades n) (i-1)

cantDigitos :: Integer -> Integer
cantDigitos n | n < 10    = 1
cantDigitos n | otherwise = 1 + cantDigitos (quitarDigitoUnidades n)

-- Ejercicio 09

esCapicua :: Integer -> Bool
esCapicua n | n < 10    = False
esCapicua n | otherwise = compararDigitos n 1 (cantDigitos n)

-- comparoDigitos: me dice si un numero natural n es capicua, tomando "a" (posicion del primer digito) igual a 1
-- y "b" (posicion del ultimo digito) la cantidad total de digitos de "n".
-- Para eso, toma un numero n y compara los digitos desde "a" hasta "b". Si la cantidad de digitos es impar, 
-- le saco el digito del medio (pues para ver si es capicua, no importa ese digito pues no se compara con ningun otro). 
-- Como caso base, tomo la posicion de los digitos del medio (para "a" y para "b").

compararDigitos :: Integer -> Integer -> Integer -> Bool
compararDigitos n a b | mod (cantDigitos n) 2 /= 0                                             = compararDigitos (quitarIesimoDigito n (div (1 + cantDigitos n) 2)) a (b-1) 
compararDigitos n a b | mod (cantDigitos n) 2 == 0 && a == div (cantDigitos n) 2 && b == (a+1) = iesimoDigito n a == iesimoDigito n b
compararDigitos n a b | otherwise                                                              = iesimoDigito n a == iesimoDigito n b && compararDigitos n (a+1) (b-1)

-- quitarDigitoDelMedio: saca el i-esimo digito de un numero natural n

quitarIesimoDigito :: Integer -> Integer -> Integer
quitarIesimoDigito n i = (div n (10^((cantDigitos n) + 1 - i)))*10^((cantDigitos n) - i) + mod n (10^((cantDigitos n) - i))

esCapicua2 :: Integer -> Bool
esCapicua2 n = n == invertir n

invertir :: Integer -> Integer
invertir n | n < 10 = n
           | otherwise = (digitoUnidades n)*(10^((cantDigitos n)-1)) + invertir (quitarDigitoUnidades n)


f1 :: Integer -> Integer
f1 0 = 1
f1 n = 2^n + f1 (n-1)

f2 :: Integer -> Integer -> Integer
f2 1 q = q
f2 n q = q^n + f2 (n-1) q

f3 :: Integer -> Integer -> Integer
f3 0 q = 0
f3 n q = q^(2*n) + q^(2*n-1) + f3 (n-1) q

f4 :: Integer -> Integer -> Integer
f4 0 q = 1
f4 n q = q^(2*n) + q^(2*n-1) - q^(n-1) + f4 (n-1) q

-- Ejercicio 11

eAprox :: Integer -> Float
eAprox 0 = 1
eAprox n = (1/fromIntegral(factorial n)) + eAprox (n-1)

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n*factorial (n-1)

e :: Float
e = eAprox(10)

-- Ejercicio 12

raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = -1 + sucesion n

sucesion :: Integer -> Float
sucesion 1 = 2
sucesion n = 2 + 1/sucesion (n-1)

-- Ejercicio 13

f5 :: Integer -> Integer -> Integer
f5 0 m = 0
f5 n m = f2 m n + f5 (n-1) m

-- Ejercicio 14

sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q 0 m = 0
sumaPotencias q n m = (q^n)*f2 m q + sumaPotencias q (n-1) m

-- Ejercicio 15

sumaRacionales :: Integer -> Integer -> Float
sumaRacionales n 0 = 0
sumaRacionales n m = (1/fromIntegral m)*sumaNaturales n + sumaRacionales n (m-1)

sumaNaturales :: Integer -> Float
sumaNaturales 1 = 1
sumaNaturales n = fromIntegral (div (n*(n+1)) 2)

-- Ejercicio 16

-- menorDivisorDesde: devuelve el menor divisor desde el numero natural m
-- donde m es mayor igual que 2.

menorDivisorDesde :: Integer -> Integer -> Integer
menorDivisorDesde n m | n == m       = n
menorDivisorDesde n m | mod n m == 0 = m
                      | otherwise    = menorDivisorDesde n (m+1)

menorDivisor :: Integer -> Integer
menorDivisor n = menorDivisorDesde n 2

esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo n = menorDivisor n == n
              
sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos 1 m                = True
sonCoprimos n m | m < n        = sonCoprimos m n
                | mod m n == 0 = False
                | otherwise    = sonCoprimos (mayorDivisorHasta n (n-1)) m
               
-- mayorDivisorHasta: m se encuentra entre 1 y n.

mayorDivisorHasta :: Integer -> Integer -> Integer
mayorDivisorHasta n m | mod n m == 0 = m
                      | otherwise    = mayorDivisorHasta n (m-1)

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo 1 = 2
nEsimoPrimo n = proximoPrimoDesde (nEsimoPrimo (n-1))

-- proximoPrimoDesde: devuelve el primer primo mayor estricto que n

proximoPrimoDesde :: Integer -> Integer
proximoPrimoDesde n | esPrimo (n+1) = n+1
                    | otherwise = proximoPrimoDesde (n+1)

esFibonacci :: Integer -> Bool
esFibonacci n = esFibonacciDesde n 0

-- esFibonacciDesde: verifica si un numero natural n (incluido el cero) pertenece
-- a la sucecion de fibonacci desde su elemento m.

esFibonacciDesde :: Integer -> Integer -> Bool
esFibonacciDesde n m | fibonacci m > n = False
esFibonacciDesde n m | otherwise       = fibonacci m == n || esFibonacciDesde n (m+1)

-- Ejercicio 18

mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n | n < 10 && mod n 2 /=0                                                                                = -1
                 | n < 10 && mod n 2 == 0                                                                               = n
                 | mod (digitoUnidades n) 2 /= 0                                                                        = mayorDigitoPar (quitarDigitoUnidades n)
                 | mod (digitoUnidades n) 2 == 0 && mod (digitoDecenas n) 2 /= 0                                        = mayorDigitoPar (quitarDigitoDecenas n)
                 | mod (digitoUnidades n) 2 == 0 && mod (digitoDecenas n) 2 == 0 && digitoUnidades n <= digitoDecenas n = mayorDigitoPar (quitarDigitoUnidades n)
                 | mod (digitoUnidades n) 2 == 0 && mod (digitoDecenas n) 2 == 0 && digitoUnidades n >  digitoDecenas n = mayorDigitoPar (quitarDigitoDecenas n)


quitarDigitoDecenas :: Integer -> Integer
quitarDigitoDecenas n = quitarIesimoDigito n (-1 + cantDigitos n)

-- Ejercicio 19

esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos n = esSumaInicialDePrimosDesde 1 n

--esSumaInicialDePrimosDesde: verifica si el numero n es suma de los primeros k primos,
-- contando desde el primo m-esimo.

esSumaInicialDePrimosDesde :: Integer -> Integer -> Bool
esSumaInicialDePrimosDesde m n | n <= 1            = False
esSumaInicialDePrimosDesde m n | sumaPrimos m <  n = esSumaInicialDePrimosDesde (m+1) n 
                               | sumaPrimos m == n = True
                               | sumaPrimos m >  n = False 

-- sumaPrimos: suma los primeros "n" primos.

sumaPrimos :: Integer -> Integer
sumaPrimos 1 = 2
sumaPrimos n = nEsimoPrimo n + sumaPrimos (n-1)

-- Ejercicio 20

tomaValorMax :: Integer -> Integer -> Integer
tomaValorMax n m | n == m                                      = m
                 | n < m && sumaDivisores n <= sumaDivisores m = tomaValorMax (n+1) m
                 | n < m && sumaDivisores n >  sumaDivisores m = tomaValorMax n (m-1)

-- sumaDivisores: suma los divisores de un numero natural n, desde 1 hasta m.

sumaDivisoresHasta :: Integer -> Integer -> Integer
sumaDivisoresHasta n 1                = 1
sumaDivisoresHasta n m | mod n m == 0 = m + sumaDivisoresHasta n (m-1)
                       | otherwise    = sumaDivisoresHasta n (m-1)

-- sumaDivisores: suma los divisores de un numero natural n.

sumaDivisores :: Integer -> Integer
sumaDivisores n = sumaDivisoresHasta n n

-- Ejercicio 21

pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras 0 n r = pitagorasFila 0 n r
pitagoras m n r = pitagorasFila m n r + pitagoras (m-1) n r

-- pitagorasFila: calcula la funcion pitagoras con la primer coordenada fija,
-- el equivalente de calcular pitagoras en la fila iesima de una matriz de
-- m filas y n columnas.

pitagorasFila :: Integer -> Integer -> Integer -> Integer
pitagorasFila i 0 r | sumaCuadrados i 0 r      = 1
pitagorasFila i 0 r | not(sumaCuadrados i 0 r) = 0                           
pitagorasFila i n r | sumaCuadrados i n r      = 1 + pitagorasFila i (n-1) r
                    | otherwise                = pitagorasFila i (n-1) r

-- sumaCuadrados: me dice si la suma de los cuadrados de a y b
-- es menor o igual al cuadrado de c.

sumaCuadrados :: Integer -> Integer -> Integer -> Bool
sumaCuadrados a b c = a^2 + b^2 <= c^2