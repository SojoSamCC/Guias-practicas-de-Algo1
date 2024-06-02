from queue import LifoQueue as Pila
import random
# archivo=open("C:/Users/ser/Desktop/Varios/Code/mi-repositorio-de-git/guias-practicas-de-algo1/Tareas/guias de python/pruea.txt","r")
# contenido= archivo.read()
# archivo.close()
# archivo=open("C:/Users/ser/Desktop/Varios/Code/mi-repositorio-de-git/guias-practicas-de-algo1/Tareas/guias de python/pruea.txt","r")
# lineas = archivo.readlines()
# archivo.close()
# for linea in lineas:
#     print(linea, end='')

def contar_lineas(nombre_archivo:str):
    archivo=open(nombre_archivo,"r")
    lineas=archivo.readlines()
    archivo.close()
    return len(lineas)
#print(contar_lineas("C:/Users/ser/Desktop/Varios/Code/mi-repositorio-de-git/guias-practicas-de-algo1/Tareas/guias de python/pruea.txt"))

def existe_palabra(palabra:str,nombre_archivo:str):
    archivo=open(nombre_archivo,"r")
    lineas=archivo.readlines()
    archivo.close()
    i=0
    condicion=False
    while i<len(lineas) and condicion!=True:
        j=0
        iguales=True
        while j<len(palabra) and iguales==True:
            if lineas[i][j]==palabra[j]:
                condicion=True
                j+=1
            else:
                condicion=condicion
                j=0
                iguales=False
        i+=1
    return condicion
#print(existe_palabra("","pruea.txt"))

def palabras(linea):
    palabras=[]
    palabra=""
    i=0
    while i<len(linea):
        if i==len(linea)-1 and linea[i]!=" " and linea[i]!="\n":
            palabra+=linea[i]
            palabras.append(palabra)
            i+=1
        elif linea[i]!=" " and linea[i]!="\n":
            palabra+=linea[i]
            i+=1
        else:
            palabras.append(palabra)
            palabra=""
            i+=1
    return palabras

#print(palabras("hola, esto es una prueba"))

def existe_palabra_en_linea(palabra,linea):
    existe=False
    i=0
    while i<len(palabras(linea)) and existe==False:
        if palabra==palabras(linea)[i]:
            existe=True
        else:
            i+=1
    return existe
#print(existe_palabra_en_linea("kk","Mi nombre  es Samuel, hola"))

def pertenece(palabra,lista):
    i=0
    existe=False
    while i<len(lista) and existe==False:
        if palabra==lista[i]:
            existe=True
        else:
            i+=1
    return existe

def cantidad_apariciones(nombre_archivo:str,palabra:str):
    archivo=open(nombre_archivo,"r")
    lineas=archivo.readlines()
    archivo.close()
    cantidad_de_apariciones=0
    for i in range(len(lineas)):
        for j in range(len(palabras(lineas[i]))):
            if palabras(lineas[i])[j]==palabra:
                cantidad_de_apariciones+=1
    return cantidad_de_apariciones
#print(cantidad_apariciones("pruea.txt","prueba"))

def clonar_sin_comentarios(nombre_archivo:str): #Esta no es la función que te pedían en el ejercicio, pero igual me pintó por hacerla.
    archivo=open(nombre_archivo,"r")
    lineas=archivo.readlines()
    archivo.close()
    palabra_sin_numeral_o_espacio_2=""
    for i in range(len(lineas)):
        for j in range(len(lineas[i])):
              if  lineas[i][j]!="#" and lineas[i][j]!=" " and lineas[i][j]!="\n":
                  palabra_sin_numeral_o_espacio_2+=lineas[i][j]
        lineas[i]=palabra_sin_numeral_o_espacio_2+"\n"
        palabra_sin_numeral_o_espacio_2=""
    archivo1=open(nombre_archivo,"w")
    archivo1=archivo1.writelines(lineas)

def clonar_sin_comentarios_posta(nombre_archivo:str):
    archivo=open(nombre_archivo,"r")
    lineas=archivo.readlines()
    archivo.close()
    lineas_sin_comentarios=[]
    for i in range (len(lineas)):
        if lineas[i][0]!="#" and lineas[i][0]!=" ":
            lineas_sin_comentarios.append(lineas[i])
    if lineas_sin_comentarios[len(lineas_sin_comentarios)-1]!="\n":
        lineas_sin_comentarios[len(lineas_sin_comentarios)-1]+="\n"
    nuevo_archivo=open("clon_sin_comentarios.txt","w")
    nuevo_archivo.writelines(lineas_sin_comentarios)
    nuevo_archivo.close()
#clonar_sin_comentarios_posta("pruea.txt")

def invertir_lineas(nombre_archivo:str):
    archivo=open(nombre_archivo,"r")
    lineas=archivo.readlines()
    archivo.close
    nuevas_lineas=[]
    for i in range(len(lineas)-1,-1,-1):
        nuevas_lineas.append(lineas[i])
    reverso=open("reverso.txt","w")
    reverso=reverso.writelines(nuevas_lineas)
    reverso.close()
#invertir_lineas("pruea.txt")

def agregar_frase_al_final(nombre_archivo:str,frase:str):
    archivo=open(nombre_archivo,"r")
    lineas=archivo.readlines()
    archivo.close()
    lineas.append(frase)
    archivo=open(nombre_archivo,"w")
    archivo.writelines(lineas)
    archivo.close()

def agregar_frase_al_principio(nombre_archivo:str,frase:str):
    archivo=open(nombre_archivo,"r")
    lineas=archivo.readlines()
    archivo.close()
    lineas_reverso=[]
    for i in range(len(lineas)-1,-1,-1):
        lineas_reverso.append(lineas[i])
    frase+="\n"
    lineas_reverso.append(frase)
    lineas=[]
    for j in range(len(lineas_reverso)-1,-1,-1):
        lineas.append(lineas_reverso[j])
    archivo=open(nombre_archivo,"w")
    archivo.writelines([])
    archivo.writelines(lineas)
    archivo.close
#agregar_frase_al_principio("pruea.txt","Veamos si funciona")

def listar_palabras_de_archivo(nombre_archivo:str):
    archivo=open(nombre_archivo,"b")
    ni_idea=archivo.read()
    return ni_idea

#def promedio_estudiante(nombre_archivo:str,lu:str)->float:

#PARTE 2
def generar_nros_al_azar(cantidad:int,desde:int,hasta:int)->Pila[int]:
    p=Pila()
    for i in range(cantidad):
        p.put(random.randint(desde,hasta))
    return p

def cantidad_elementos(p : Pila) -> int:
    elementos=[]
    while p.empty()!=False:
        elementos.append(p.get())
    for i in range(len(elementos)-1,-1,-1):
        p.put(elementos[i])
    return len(elementos)
#print(cantidad_elementos([2,3,4]))

def maximo(lista):
    maximo=lista[0] #consultar cómo hacerle si la función recibe una lista vacía
    for i in range(len(lista)):
        if lista[i]>=maximo:
            maximo=lista[i]
    return maximo
#print(maximo([]))
def buscar_el_maximo(p:Pila[int])->int:
    elementos=[]
    while p.empty()!=False:
        elementos.append(p.get())
    for i in range(len(elementos)-1,-1,-1):
        p.put(elementos[i])
    maximo_pila=maximo(elementos)
    return maximo_pila

def esta_bien_balanceada(s:str):
    cantidad_aperturas=0
    cantidad_cierres=0
    balanceados=True
    for i in range(len(s)):
        if s[i]=="(":
            cantidad_aperturas+=1
        elif s[i]==")":
            cantidad_cierres+=1
    if cantidad_aperturas!=cantidad_cierres:
        balanceados=False
    elif len(s)==1 or len(s)==0:
        balanceados=balanceados
    else:
        j=0
        while j<len(s) and balanceados!=False:
            k=0
            while k<len(s)-2 and balanceados!=False:
                if s[k]=="(" and s[k+1]==")":
                    balanceados=False
                    k+=1
                    j+=1
                else:
                    k+=1
                    j+=1
            if s[-2]=="(" and s[-1]==")":
                balanceados=False
            else:
                balanceados=balanceados
    return balanceados
#print(esta_bien_balanceada("2+3+1"))

def evaluar_expresion(s:str):
    resultado=Pila()
    elemento_a_agregar=""
    contador=0
    for i in range(len(s)):
        if contador>=3:
            operador=resultado.get()
            numero_2=int(resultado.get())
            numero_1=int(resultado.get())
            operacion=0
            if operador=="+":
                operacion=numero_1+numero_2
            elif operador=="-":
                operacion=numero_1-numero_2
            elif operador=="*":
                operacion=numero_1*numero_2
            else:
                operacion=numero_1/numero_2
            elemento_a_agregar=""
            elemento_a_agregar=operacion
            resultado.put(elemento_a_agregar)
            elemento_a_agregar=""
            contador=1
        if i==len(s)-2:
            elemento_a_agregar+=s[i]
            resultado.put(elemento_a_agregar)
            elemento_a_agregar=""
            elemento_a_agregar+=s[i+1]
            resultado.put(elemento_a_agregar)
            contador+=4
        elif s[i]>="1" and s[i]<="9" or (s[i]=="+" or s[i]=="-" or s[i]=="*" or s[i]=="/"):
            elemento_a_agregar+=s[i]
        else:
            resultado.put(elemento_a_agregar)
            elemento_a_agregar=""
            contador+=1
    resultado_final=resultado.get()
    return resultado_final
print(evaluar_expresion("3 4 + 5 * 2 - 2 +"))
