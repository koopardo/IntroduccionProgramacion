import random
from queue import LifoQueue as Pila
from queue import Queue as Cola

# Ejercicio 01:
# 01.1:
def contarLineas(nombreArchivo: str) -> int:
    archivo: TextIO = open(nombreArchivo, 'r')
    res: int = len(archivo.readlines())
    archivo.close()
    return res

# 01.2:
def existePalabra(nombreArchivo: str, palabra: str) -> bool:
    archivo: TextIO = open(nombreArchivo, 'r')
    res: bool = False
    for linea in archivo.readlines():
        if palabra in linea.split():
            res = True 
    archivo.close()  
    return res

# 01.3:
def cantidadApariciones(nombreArchivo: str, palabra: str) -> int:
    archivo: TextIO = open(nombreArchivo, 'r')
    res: int = 0
    for linea in archivo.readlines():
        print(linea)
        if palabra in linea:
            res += 1
    archivo.close()
    return res

# Ejercicio 02:
def clonarSinComentarios(nombreArchivo: str, archivoDestino: str):
    archivo: TextIO = open(nombreArchivo, 'r')
    destino: TextIO = open(archivoDestino,'w')
    destino.truncate()
    contenido: list[str] = []
    for linea in archivo.readlines():
        if eliminarEspacios(linea[0]) != '#':
            destino.write(linea)
    archivo.close()
    destino.close()

def eliminarEspacios(lista: str) -> str:
    res: str = ''
    res = lista[:]
    i: int = 0
    cortar: int = 0
    while cortar == 0:
        if res[i] == ' ':
            i += 1
        else:
            res = res[i::1]
            cortar = 1
    return res

# Ejercicio 03:
def reverso(nombreArchivo: str):
    archivo: TextIO = open(nombreArchivo,'r',encoding = "utf8")
    destino: TextIO = open("reverso.txt",'x',encoding = "utf8")
    lineas: list[str] = archivo.readlines()
    for i in range(0,len(lineas),1):
        destino.write(lineas[len(lineas)-(i+1)])
    archivo.close()
    destino.close()

# Ejercicio 04:
def agregarFrase(nombreArchivo: str, frase: str):
    archivo: TextIO = open(nombreArchivo,'a',encoding = "utf8")
    lineas: list[str] = archivos.readlines()
    archivo.close()

# Ejercicio 05:
def agregarAlPrincipio(nombreArchivo: str, frase: str):
    archivo: TextIO = open(nombreArchivo,'r',encoding = "utf8")
    lineas: list[str] = archivo.readlines()
    archivo.close()
    archivo = open(nombreArchivo,'w',encoding = "utf8")
    archivo.write(frase + '\n')
    for linea in lineas:
        archivo.write(linea)
    archivo.close()

# Ejercicio 06:

# Ejercicio 07:
def promedioEstudiante(lu: str) -> float:
    res: float = 0
    nombreArchivo: str = 'alumnos.csv'
    archivo: TextIO = open(nombreArchivo,'r',encoding = 'utf8')
    lineas: list[str] = archivo.readlines()
    notas: list[int] = []
    archivo.close()
    for linea in lineas:
        if lu == linea.split(',')[0]:
            nota = float(linea.split(',')[3].strip())
            notas.append(nota)
    res = sum(notas)/len(notas)
    return res


# Ejercicio 08:
def generarNrosAlAzar(n: int, desde: int, hasta: int) -> list[int]:
    lista: list[int] = range(desde,hasta + 1,1)
    res: list[int] = random.sample(lista,n)
    return res

# Ejercicio 09:
def armarPila(n: int, desde: int, hasta: int) -> Pila[int]:
    res: Pila[int] = Pila()
    lista: list[int] = generarNrosAlAzar(n,desde,hasta)
    for x in lista:
        res.put(x)
    return res

# Ejercicio 10:
def cantidadElementosPila(pila: Pila) -> int:
    res: int = 0
    while not(pila.empty()):
        pila.get()
        res +=1
    return res

# Ejercicio 11:
def buscarElMaximoPila(pila: Pila[int]) -> int:
    res: int = 0
    while not(pila.empty()):
        elemento = pila.get()
        if elemento >= res:
            res = elemento
    return res

# Ejercicio 12:
def estaBienBalanceada(s: str) -> bool:
    pila: Pila[str] = Pila()
    res: bool = True
    ultimo: int = 0
    contador: int = 0
    largoPila: int = 0
    for x in s:
        if x == '(' or x == ')':
            largoPila += 1
            pila.put(x)
    while not(pila.empty()):
        ultimo += 1
        elemento = pila.get()
        if elemento == ')' and ultimo != largoPila:
            contador -= 1
        if elemento == '(' and ultimo != largoPila:
            contador += 1
        if elemento == '(' and ultimo == largoPila:
            contador += 1
        if elemento == ')' and ultimo == largoPila:
            contador += largoPila
    res = (contador == 0)
    return res

# Ejercicio 13:
def armarCola(n: int, desde: int, hasta: int) -> Cola[int]:
    res: Cola[int] = Cola()
    lista: list[int] = generarNrosAlAzar(n,desde,hasta)
    for x in lista:
        res.put(x)
    return res

# Ejercicio 14:
def cantidadElementosCola(cola: Cola[int]) -> int:
    res: int = 0
    while not(cola.empty()):
        cola.get()
        res += 1
    return res

def buscarElMaximoCola(cola: Cola[int]) -> int:
    res: int = 0
    copia: Cola[int] = cola.copy()
    while not(cola.empty()):
        elemento = cola.get()
        if elemento >= res:
            res = elemento
    return res

 
# Ejercicio 16:
#16.1:
def armarSecuenciaDeBingo() -> Cola[int]:
    res: Cola[int] = Cola()
    res = armarCola(100,0,99)
    return res

#16.2:
def jugarCartonDeBingo(carton: list[int], bolillero: Cola[int]) -> int:
    res: int = 0
    while not(bolillero.empty()) and len(carton) != 0:
        x = bolillero.get()
        res += 1
        if x in carton:
            carton.remove(x)
    return res 

# Ejercicio 17:
def nPacientesUrgentes(cola: Cola[(int,str,str)]) -> int:
    res: int = 0
    while not(cola.empty()):
        x = cola.get()
        if x[0] in [1,2,3]:
            res += 1
    return res

# Ejercicio 18:
def agruparPorLongitud(nombreArchivo: str) -> dict:
    res: dict = {}
    archivo: TextIO = open(nombreArchivo,'r',encoding = 'utf8')
    palabras: list[str] = archivo.readlines()
    pila: Pila[str] = Pila()
    archivo.close()
    for palabra in palabras:
        listaPalabras = palabra.split()
        for x in listaPalabras:
            pila.put(x)
    while not(pila.empty()):
        elemento = pila.get()
        n = len(elemento)
        if n not in res:
            res[n] = 1
        else:
            res[n] = res[n] + 1
    return res

# Ejercicio 19:
def promedios() -> dict:
    res: dict = {}
    nombreArchivo: str = 'alumnos.txt'
    archivo = open(nombreArchivo,'r',encoding = 'utf8')
    lineas = archivo.readlines()
    libretas: list[str] = []
    archivo.close()
    for linea in lineas:
        libreta = linea.split(',')[0]
        if libreta not in libretas and libreta != 'Nro LU':
            libretas.append(libreta)
    for libreta in libretas:
        res[libreta] = promedioEstudiante(libreta)
    return res

# Ejercicio 20:
def laPalabraMasFrecuente(nombreArchivo: str) -> str:
    res: int = 0
    diccionario: dict = {}
    archivo: TextIO = open(nombreArchivo,'r',encoding = 'utf8')
    lineas: list[str] = archivo.readlines()
    pila: Pila[str] = Pila()
    archivo.close()
    for linea in lineas:
        palabras = linea.split()
        for palabra in palabras:
            pila.put(palabra)
    while not(pila.empty()):
        palabra = pila.get()
        if palabra not in diccionario:
            diccionario[palabra] = 1
        else:
            diccionario[palabra] = diccionario[palabra] + 1
    print(diccionario)
    res = max(diccionario,key=diccionario.get)
    return res