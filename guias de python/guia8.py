from queue import LifoQueue as Pila
from queue import Queue as Cola
import random
# archivo=open("C:/Users/ser/Desktop/Varios/Code/mi-repositorio-de-git/guias-practicas-de-algo1/Tareas/guias de python/pruea.txt","r")
# contenido= archivo.read()
# archivo.close()
# archivo=open("C:/Users/ser/Desktop/Varios/Code/mi-repositorio-de-git/guias-practicas-de-algo1/Tareas/guias de python/pruea.txt","r")
# lineas = archivo.readlines()
# archivo.close()
# for linea in lineas:
#     print(linea, end='')


#Funciones útiles:

def pertenece(palabra,lista):
    i=0
    existe=False
    while i<len(lista) and existe==False:
        if palabra==lista[i]:
            existe=True
        else:
            i+=1
    return existe

def palabras(linea):
    palabras_posta=[]
    palabras=[]
    palabra=""
    for j in range(len(linea)):
        if (linea[j]==" " or linea[j]=="\n" or linea[j]==",") and palabra!="":
            palabras.append(palabra)
            palabra=""
        else:
            palabra+=linea[j]
    for i in range(len(palabras)):
        if palabras[i]!=" " and palabras[i]!='""':
            palabras_posta.append(palabras[i])
    return palabras_posta

def cantidad_elementos(p : Pila) -> int:
    elementos=[]
    while p.empty()!=False:
        elementos.append(p.get())
    for i in range(len(elementos)-1,-1,-1):
        p.put(elementos[i])
    return len(elementos)

def maximo(lista):
    maximo=lista[0] #consultar cómo hacerle si la función recibe una lista vacía
    for i in range(len(lista)):
        if lista[i]>=maximo:
            maximo=lista[i]
    return maximo

def meter_en_tupla(linea):
    valor=""
    lista=[]
    cant_comas=0
    i=0
    while cant_comas<3:
        if linea[i]!=",":
            valor+=linea[i]
            i+=1
        else:
            cant_comas+=1
            lista.append(valor)
            valor=""
            i+=1
    while i<len(linea):
        valor+=linea[i]
        i+=1
    nuevo_valor=float(valor)
    lista.append(nuevo_valor)
    tupla=tuple(lista)
    return tupla


def cantidad_elementos(c:Cola)->int:
    lista=[]
    while c.empty()==False:
        lista.append(c.get())
    for i in range(len(lista)):
        c.put(lista[i])
    res:int = len(lista)
    return res

def copia_cola(c:Cola[int])->Cola[int]:
    copia=Cola()
    lista=[]
    while c.empty()==False:
        lista.append(c.get())    
    for i in range(len(lista)):
        copia.put(lista[i])
        c.put(lista[i])
    return copia

def elementos_cola(c:Cola[int])->Cola[int]:
    lista=[]
    while c.empty()==False:
        lista.append(c.get)
    for i in range(len(lista)):
        c.put(lista[i])
    return lista

def crear_cola(lista):
    c=Cola()
    for i in range(len(lista)):
        c.put(lista[i])
    return c

def ver_cola(c):
    cola=[]
    copia_c=copia_cola(c)
    while copia_c.empty()==False:
        cola.append(copia_c.get())
    return cola

#####################3
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
# def quitar_todos(palabra,lista):
#     lista_nueva=lista.copy()
#     for i in range(len(lista_nueva)):
#         if lista_nueva[i]==palabra:
#             lista_nueva[i]=""
#     return lista_nueva
# print(quitar_todos(" ","hola hola hola hola"))
# def sacar_espacios_repetidos(lista):
#     lista_sin_espacios=[]
#     for i in range(len(lista)-1):
#         if lista[i]!=" "
def palabras(linea):
    palabras_posta=[]
    palabras=[]
    palabra=""
    for j in range(len(linea)):
        if (linea[j]==" " or linea[j]=="\n" or linea[j]==",") and palabra!="":
            palabras.append(palabra)
            palabra=""
        else:
            palabra+=linea[j]
    for i in range(len(palabras)):
        if palabras[i]!=" " and palabras[i]!='""':
            palabras_posta.append(palabras[i])
    return palabras_posta


#print(palabras("hola hola hola   hola\n    "))

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
#print(cantidad_apariciones("pruea.txt","hola"))

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
#invertir_lineas("prueba.txt")

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

#print(float("10"))
#print(meter_en_tupla("853/24,ip,hoy,10"))
# def sacar_saltos(linea):
#     nueva_linea=""
#     i=0
#     while i<len(linea) and pertenece("\n",palabras(linea))==True:
#         for i in range(len(linea)):
#             nueva_linea+=linea[i]
#             i+=1
#     return nueva_linea
#print(sacar_saltos('853/24,algebra I,hoy,5\n'))
def promedio_estudiante(nombre_archivo:str,lu:str)->float:
    archivo=open(nombre_archivo,"r")
    lineas=archivo.readlines()
    notas=[]
    suma_notas=0
    for i in range(len(lineas)):
        if pertenece(lu,palabras(lineas[i])):
            notas.append(meter_en_tupla(lineas[i])[3])
    for j in range(len(notas)):
        suma_notas+=notas[j]
    promedio=suma_notas/len(notas)
    return promedio 

def calcular_promedio_por_estudiante(nombre_archivo_notas:str,nombre_archivo_promedios:str)->None:
    archivo=open(nombre_archivo_notas,"r")
    lineas=archivo.readlines()
    archivo.close()
    lineas_en_tuplas=[]
    lista_lu=[]
    lista_promedios=[]
    alumno_momentaneo=""
    for i in range(len(lineas)):
        lineas_en_tuplas.append(meter_en_tupla(lineas[i]))
    for j in range(len(lineas_en_tuplas)):
        if pertenece(lineas_en_tuplas[j][0],lista_lu)==False:
            lista_lu.append(lineas_en_tuplas[j][0])
    for k in range(len(lista_lu)):
        alumno_momentaneo+=lista_lu[k]+";"
        promedio=str(promedio_estudiante(nombre_archivo_notas,lista_lu[k]))
        lista_promedios.append(alumno_momentaneo+promedio)
        alumno_momentaneo=""
    for m in range(len(lista_promedios)):
        lista_promedios[m]=lista_promedios[m]+"\n"
    archivo=open(nombre_archivo_promedios,"w")
    archivo.writelines(lista_promedios)
    archivo.close

#print(promedio_estudiante("notas.txt","853/24"))
#calcular_promedio_por_estudiante("notas.txt","promedios.xlsm")
#PARTE 2
def generar_nros_al_azar(cantidad:int,desde:int,hasta:int)->Pila[int]:
    p=Pila()
    for i in range(cantidad):
        p.put(random.randint(desde,hasta))
    return p


#print(cantidad_elementos([2,3,4]))

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
##print(evaluar_expresion("3 4 + 5 * 2 - 2 +"))

def generar_nros_al_azar_colas(cantidad:int,desde:int,hasta:int)->Cola[int]:
    c=Cola()
    for i in range(cantidad):
        c.put(random.randint(desde,hasta))
    return c

def buscar_el_maximo(c:Cola[int])->int:
    lista=[]
    while c.empty()==False:
        lista.append(c.get())
    for i in range(len(lista)):
        c.put(lista[i])
    res:int = maximo(lista)
    return res

def armar_secuencia_de_bingo()->Cola[int]:
    c=Cola()
    lista=[]
    i=0
    while (len(lista))<100:
        elemento=random.randint(0,99)
        if pertenece(elemento,lista)==False:
            lista.append(elemento)
            c.put(elemento)
    return c
#print(armar_secuencia_de_bingo())

#print(elementos_cola(armar_secuencia_de_bingo())) #peligro tarda demasiado en ejecutarse.
def jugar_carton_de_bingo(carton:list[int],bolillero:Cola[int])->int:
    contador=0
    jugadas=0
    copia_bolillero=copia_cola(bolillero)
    while contador<12:
        numero=copia_bolillero.get()
        if pertenece(numero,carton):
            contador+=1
            jugadas+=1
        else:
            jugadas+=1
    return jugadas
#print(jugar_carton_de_bingo([2,5,4,6,1,7,90,54,36,17,53,30],armar_secuencia_de_bingo()))

def n_pacientes_urgentes(c:Cola[(int,str,str)])->int:
    copia_c=copia_cola(c)
    contador=0
    prioridad=[1,2,3]
    while copia_c.empty()==False:
        if pertenece(copia_c.get()[0],prioridad)==True:
            contador+=1
    return contador
#print(n_pacientes_urgentes(crear_cola([(2,"",""),(5,"",""),(1,"",""),(6,"",""),(2,"",""),(3,"","")])))


def atencion_a_clientes(c:Cola[(str,int,bool,bool)])->Cola[(str,int,bool,bool)]:
    copia_c=copia_cola(c)
    cola_prioridad=Cola()
    lista_prioritarios=[]
    lista_preferenciales=[]
    lista_resto=[]
    while copia_c.empty()==False:
        persona=copia_c.get()
        if (persona[3])==True:
            lista_prioritarios.append(persona)
        elif (persona[2])==True:
            lista_preferenciales.append(persona)
        else:
            lista_resto.append(persona)
    lista_total=lista_prioritarios+lista_preferenciales+lista_resto
    for i in range(len(lista_total)):
        cola_prioridad.put(lista_total[i])
    return cola_prioridad

#print(ver_cola(atencion_a_clientes(crear_cola([("persona1",123,True,True),("persona2",123,True,False),("persona3",123,False,False),("persona4",123,False,True),("persona1",123,False,False),("persona1",123,True,True),("persona1",123,False,True),("persona1",123,False,True)]))))

#parte de diccionarios
def agrupar_por_longitud(nombre_archivo:str)->dict:
    res:dict={}
    archivo=open(nombre_archivo,"r")
    lineas=archivo.readlines()
    archivo.close
    todas_las_palabras=[]
    for i in range(len(lineas)):
        todas_las_palabras.append(palabras(lineas[i]))
    for k in range(len(todas_las_palabras)):
        for j in range (len(todas_las_palabras[k])):
            if pertenece(len(todas_las_palabras[k][j]),list(res.keys()))==False:
                res[len(todas_las_palabras[k][j])]=1
            else:
                res[len(todas_las_palabras[k][j])]+=1
    return res
#print(agrupar_por_longitud("prueba.txt"))

# def minimo(lista):        Esta función está piola para hallar el mínimo de una lista, se puede implementar en varios contextos.
#     menor=lista[0]
#     for i in range(len(lista)):
#         if menor>=lista[i]:
#             menor=lista[i]
#     return menor

def hacer_lista(lista):
    lista1=[]
    for i in range(len(lista)):
        lista1.append([lista[i]])
    return lista1
#print(hacer_lista(['hola,', 'esto', 'es', 'una', 'prueba']))

def cant_apariciones_palabra_en_lista(palabra,lista):
    contador=0
    lista_posta=hacer_lista(lista)
    for j in range(len(lista_posta)):
        if lista_posta[j]==[palabra]:
            contador+=1
    return contador
#print(cant_apariciones_palabra_en_lista("hola,",['hola,', 'esto', 'es', 'una', 'prueba']))
def la_palabra_mas_frecuente(nombre_archivo:str)->str: # se cómo resolver en lo que falla, pero en este momento se me complica hallar un método
    res=""
    diccionario_palabras={}
    lista_palabras=[]
    archivo=open(nombre_archivo,"r")
    lineas=archivo.readlines()
    archivo.close()
    for i in range(len(lineas)):
        lista_palabras.append(palabras(lineas[i])) #mi idea hasta acá es crear una lista de listas de todas las palabras en cada línea
    for k in range(len(lista_palabras)):
        for j in range(len(lista_palabras[k])):
            if pertenece(diccionario_palabras[lista_palabras[k][j]],list(diccionario_palabras.keys()))==False:
                diccionario_palabras[lista_palabras[k][j]]=cant_apariciones_palabra_en_lista(lista_palabras[k][j],lista_palabras[k]) #mi idea hasta acá es crear un par clave-valor tal que clave es la palabra y valor es la cantidad de apariciones en la lista de palabras en el archivo
            else:
                diccionario_palabras[lista_palabras[k][j]]+=cant_apariciones_palabra_en_lista(lista_palabras[k][j],lista_palabras[k])
    valores=list(diccionario_palabras.values())
    mas_repetido=0
    for t in range(len(valores)):
        if mas_repetido<=valores[t]:
            mas_repetido=valores[t]

    claves=list(diccionario_palabras.items())
    u=0
    while u<len(claves) and res=="":
        if claves[u][1]==mas_repetido:
            res+=claves[u][0]
            u+=1
        else:
            u+=1

    return res
#print(la_palabra_mas_frecuente("pruea.txt")) # me rehúso a seguir con este ejercicio, es más fácil con listas.

def calcular_promedio_por_estudiante_diccionario(nombre_archivo_notas:str)->None:
    archivo=open(nombre_archivo_notas,"r")
    lineas=archivo.readlines()
    archivo.close()
    lineas_en_tuplas=[]
    lista_lu=[]
    lista_promedios=[]
    alumno_momentaneo=""
    for i in range(len(lineas)):
        lineas_en_tuplas.append(meter_en_tupla(lineas[i]))
    for j in range(len(lineas_en_tuplas)):
        if pertenece(lineas_en_tuplas[j][0],lista_lu)==False:
            lista_lu.append(lineas_en_tuplas[j][0])
    for k in range(len(lista_lu)):
        alumno_momentaneo+=lista_lu[k]
        promedio=promedio_estudiante(nombre_archivo_notas,lista_lu[k])
        lista_promedios.append([alumno_momentaneo,promedio])
        alumno_momentaneo=""
    return lista_promedios
#print(calcular_promedio_por_estudiante_diccionario("notas.txt"))
def calcular_promedio_por_estudiante(nombre_archivo:str)->dict[str,float]:
    promedios=calcular_promedio_por_estudiante_diccionario(nombre_archivo)
    diccionario_promedios={}
    for i in range(len(promedios)):
        diccionario_promedios[promedios[i][0]]=promedios[i][1]
    return diccionario_promedios
print(calcular_promedio_por_estudiante("notas.txt"))
