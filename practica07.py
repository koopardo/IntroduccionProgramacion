import math

# Ejercicio 01:
#1.01:
def raizDe2() -> float:
    res: float = round(math.sqrt(2),4)
    return res

#1.02:
def imprimir_hola() -> None:
    print("hola")

#1.03:
def imprimir_un_verso() -> None:
    print("Hola\nMundo!")

# 1.04:
def factorial_2() -> int:
    res: int = factorial(2)
    return res

def factorial(n: int) -> int:
    res: int = 1
    for i in range(1,n+1):
        res = res*i
    return res

# 1.05:
def factorial_3() -> int:
    res: int = factorial(3)
    return res

# 1.06:
def factorial_4() -> int:
    res: int = factorial(4)
    return res

# 1.07
def factorial_5() -> int:
    res: int = factorial(5)
    return res

# Ejercicio 02:
# 2.01:
def imprimir_saludo(nombre: str) -> None:
    print("Hola " + nombre)

# 2.02:
def raiz_cuadrada(x: float) -> float:
    res: float = math.sqrt(x)
    return res

# 2.03:
def imprimir_dos_veces(estribillo: str) -> None:
    print((estribillo + "\n")*2)

# 2.04:
def es_multiplo_de(n: int, m: int) -> bool:
    res: bool
    if n % m == 0:
        res = True
    else:
        res = False
    return res

# 2.05:
def es_par(numero: int) -> bool:
    return es_multiplo_de(numero,2)

# 2.06:
def cantidad_de_pizzas(comensales: int, min_cant_de_porciones: int) -> int:
    res: int
    if comensales*min_cant_de_porciones % 8 == 0:
        res = comensales*min_cant_de_porciones // 8
    else:
        res = 1 + (comensales*min_cant_de_porciones // 8)
    return res

# Ejercicio 03:
# 3.01:
def alguno_es_0(a: float, b: float) -> bool:
    res: bool = a == 0 or b == 0
    return res

# 3.02:
def ambos_son_0(a: float, b: float) -> bool:
    res: bool = a == 0 and b == 0
    return res

# 3.03:
def es_nombre_largo(nombre: str) -> bool:
    res: bool = len(nombre) >= 3 and len(nombre) <=8
    return res

# 3.04:
def es_bisiesto(n: int) -> bool:
    res: bool = es_multiplo_de(n,4) and not(es_multiplo_de(n,100))
    return res

# Ejercicio 04:
def peso_pino(altura: int) -> int:
    res: int = min(altura,3)*3*100 + (max(altura,3) - 3)*2*100
    return res

def es_peso_util(peso: int) -> bool:
    res: bool = peso >= 100 and peso <= 1000
    return res

def sirve_pino(altura: int) -> bool:
    return es_peso_util(peso_pino(altura))

# Ejercicio 05:
# 5.01:
def devolver_el_doble_si_es_par(n: int) -> int:
    res: int
    if es_par(n):
        res = 2*n
    else:
        res = n
    return res

# 5.02:
def devolver_valor_si_es_par_sino_el_que_sigue(n: int) -> int:
    res: int
    if es_par(n):
        res = n
    if not(es_par(n)):
        res = n + 1
    return res

# 5.03:
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(n: int) -> int:
    res: int = 0
    if n%3 == 0 and n%9 != 0:
        res = 2*n
    if n%3 == 0 and n%9 == 0:
        res = 3*n
    if n%3 !=0 and n%9 != 0:
        res = n
    return res

def problema(n: int) -> int:
    res: int = 0
    if n%3 == 0 and n%9 != 0:
        res = 2*n
    elif n%3 == 0 and n%9 == 0:
        res = 3*n
    else:
        res = n
    return res

def problema2(n: int) -> int:
    res: int = 0
    if n%3 == 0 and n%9 == 0:
        res = 3*n
    if n%3 == 0 and n%9 != 0:
        res = 2*n
    else:
        res = n
    return res

def problema3(n: int) -> int:
    res: int = 0
    if n%3 == 0 and n%9 != 0:
        res = 2*n
    else:
        res = n
    if n%3 == 0 and n%9 == 0:
        res = 3*n
    return res

# 5.04:
def muchasLetras(nombre: str) -> str:
    res: str = ""
    if len(nombre) >= 5:
        res = "Tu nombre tiene muchas letras!" 
    else:
        res = "Tu nombre tiene menos de 5 caracteres"
    return res 

# 5.05:
def vacacionesOTrabajar(sexo: str, edad: int) -> str:
    res: str = ""
    if sexo == "F" and (edad < 18 or edad >= 60):
        res = "Andá de vacaciones"
    if sexo == "M" and (edad < 18 or edad >= 65):
        res = "Andá de vacaciones"
    if sexo == 'F' and edad >= 18 and edad < 60:
        res = "Te toca trabajar"
    if sexo == 'M' and edad >= 18 and edad < 65:
        res = "Te toca trabajar"
    return res

# Ejercicio 06:
# 6.01:
def primeros_10_numeros() -> None:
    n: int = 1
    while n <= 10:
        print(n)
        n = n + 1

# 6.02:
def pares_entre_10_y_40() -> None:
    n: int = 10
    while n <= 40 and es_par(n):
        print(n)
        n = n + 2

# 6.03:
def eco() -> None:
    n: int = 1
    while n <= 10:
        print("eco")
        n = n + 1

# 6.04:
def cuenta_regresiva(numero: int) -> None:
    while numero >= 1:
        print(numero)
        numero = numero - 1
    print("Despegue")

# 6.05:
def viaje_al_pasado(partida:int, llegada: int) -> None:
    while partida > llegada:
        partida = partida - 1
        print("Viajó un año al pasado, estamos en el año: " + "<" + str(partida) + ">")

# 6.06:
def viaje_al_384_aC(partida: int) -> None:
    saltoAdelante: int
    while partida > 0:
        partida = partida - 20
        saltoAdelante = partida - 20
        print("Viajó 20 años al pasado, estamos en el año: " + "<" + str(partida) + ">")
    while partida > -384 and not(saltoAdelante < -384 and distancia(saltoAdelante,-384) > distancia(partida, -384)):
        partida = partida - 20
        saltoAdelante = partida - 20
        print("Viajó 20 años al pasado, estamos en el año: " + "<" + str(-1*partida) + " a.C.>") 

def distancia(a: int, b: int) -> int:
    res: int = abs(b - a)
    return res