# Ejercicio 01:
# 1.01:
def pertenece(lista: list, elemento: int) -> bool:
    res: bool
    for i in lista:
        res = (elemento == i)
        if res == True:
            break
    return res

def pertenece2(lista: list, elemento: int) -> bool:
    res: bool = False
    for i in lista:
        res = res or (elemento == i)
    return res

def pertenece3(lista: list, elemento: int) -> bool:
    res: bool
    for i in range(1, len(lista)-1):
        if elemento == i:
            res = True
            break
        else:
            res = False
    return res

# 1.02:
def divideATodos(lista: list, e: int) -> bool:
    res: bool = True
    for elemento in lista:
        res = res and (elemento % e == 0)
    return res

# 1.03:
def sumaTotal(lista: list) -> int:
    res: int = 0
    for elemento in lista:
        res = res + elemento
    return res

# 1.04:
def ordenados(lista: list) -> bool:
    res: bool = True
    for i in range(0,len(lista)-2):
        res = res and (lista[i] < lista[i+1])
    return res

# 1.05:
def tiene_palabra_larga(lista: list) -> bool:
    res: bool = False
    for elemento in lista:
        res = res or (len(elemento) > 7)
    return res

# 1.06:
def palindromo(lista: list) -> bool:
    res: bool = True
    ultima: int = len(lista) - 1
    for i in range(0,len(lista),1):
        print(i)
        res = res and (lista[i] == lista[ultima - i])
    return res

def palindromo2(lista: list) -> bool:
    res: bool = True
    ultima: int = len(lista) - 1
    for i in range(0,round(len(lista) // 2),1):
        res = res and (lista[i] == lista[ultima - i])
    return res


def palindromo3(palabra: str) -> bool:
    res: bool = True
    ultima: int = len(palabra) - 1
    for i in range(0,len(palabra),1):
        res = res and (palabra[i] == palabra[ultima - i])
    return res

# 1.07:
#def fortaleza(contraseña: list) -> list:
   # res: list = []
   # if len(contraseña)

