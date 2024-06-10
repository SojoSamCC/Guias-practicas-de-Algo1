### 1) Fila en ExactaBank (1 punto)

En el banco ExactaBank los clientes hacen cola para ser atendidos por un representante. Los clientes son representados por las tuplas `(nombre, tipo afiliado)` donde la primera componente es el nombre y el tipo afiliado puede ser "comun" o "vip". Se nos pide implementar una función en Python que dada una cola de clientes del banco, devuelva una nueva cola con los mismos clientes pero en donde los clientes vip están primero que los clientes comunes manteniendo el orden original de los clientes vips y los comunes entre sí.

#### Problema

```
problema reordenar_cola_priorizando_vips (in filaClientes: Cola(String x String)) : Cola(String) {
    requiere: {La longitud de los valores de la primera componente de las tuplas de la cola filaClientes es mayor a 0}
    requiere: {Los valores de la segunda componente de las tuplas de la cola filaClientes son "comun" o "vip"}
    requiere: {No hay dos tuplas en filaClientes que tengan la primera componente iguales entre sí}

    asegura: {todo valor de res aparece como primera componente de alguna tupla de filaClientes}
    asegura: { |res| = |filaClientes| }
    asegura: {res no tiene elementos repetidos}
    asegura: {No hay ningún cliente "comun" antes que un "vip" en res}
    asegura: {Para todo cliente c1 y cliente c2 de tipo "comun" pertenecientes a filaClientes si c1 aparece antes que c2 en filaClientes entonces el nombre de c1 aparece antes que el nombre de c2 en res}
    asegura: {Para todo cliente c1 y cliente c2 de tipo "vip" pertenecientes a filaClientes si c1 aparece antes que c2 en filaClientes entonces el nombre de c1 aparece antes que el nombre de c2 en res}
}
```

---

Aquí tienes el segundo ejercicio en formato Markdown:

---

### 2) Chicken Game (3 puntos)

El juego del gallina es una competición en la que dos participantes conducen un vehículo en dirección al del contrario; si alguno se desvía de la trayectoria de choque pierde y es humillado por comportarse como un "gallina". Se hizo un torneo para ver quién es el menos gallina. Juegan todos contra todos una vez y van sumando puntos, o restando. Si dos jugadores juegan y se chocan entre sí, entonces pierde cada uno 5 puntos por haberse dañado. Si ambos jugadores se desvían, pierde cada uno 10 puntos por gallinas. Si uno no se desvía y el otro sí, el gallina pierde 15 puntos por ser humillado y el ganador suma 10 puntos! En este torneo, cada persona que participa tiene una estrategia predefinida para competir: o siempre se desvía, o nunca lo hace. Se debe programar la función `torneo_de_gallinas` que recibe un diccionario (donde las claves representan los nombres de los participantes que se anotaron en el torneo, y los valores sus respectivas estrategias) y devuelve un diccionario con los puntajes obtenidos por cada jugador.

#### Problema

```
problema torneo_de_gallinas (in estrategias: dict(String,String)) : dict(String,Z) {
    requiere: {estrategias tiene por lo menos 2 elementos (jugadores)}
    requiere: {Las claves de estrategias tienen longitud mayor a 0}
    requiere: {Los valores de estrategias sólo pueden ser los strings "me desvio siempre" o "me la banco y no me desvío"}

    asegura: {Las claves de res y las claves de estrategias son iguales}
    asegura: {para cada jugador p perteneciente a claves(estrategias), res[p] es igual a la cantidad de puntos que obtuvo al finalizar el torneo, dado que jugó una vez contra cada otro jugador}
}
```

---

Aquí tienes el tercer ejercicio en formato Markdown:

---

### 3) Cuasi Ta-Te-Ti (2 puntos)

Ana y Beto juegan al Ta-Te-Ti-Facilito. El juego es en un tablero cuadrado de lado entre 5 y 10. Cada jugador va poniendo su ficha en cada turno. Juegan intercaladamente y comienza Ana. Ana pone siempre una 'X' en su turno y Beto pone una 'O' en el suyo. Gana la persona que logra poner 3 fichas suyas consecutivas en forma vertical. Si el tablero está completo y no ganó nadie, entonces se declara un empate. El tablero comienza vacío, representado por ' ' en cada posición.  
Notar que dado que juegan por turnos y comienza Ana poniendo una 'X' se cumple que la cantidad de 'X' es igual a la cantidad de 'O' o bien la cantidad de 'X' son unas más que la cantidad de 'O'.  
Se nos pide implementar una función en Python `problema quien_gano_el_tateti_facilito` que determine si ganó alguno, o si Beto hizo trampa (puso una 'O' cuando Ana ya había ganado).

#### Problema

```
problema quien_gano_el_tateti_facilito(in tablero: seq(seq(Char)) : Z {
    requiere: {tablero es una matriz cuadrada}
    requiere: {5 <= |tablero[0]| <= 10}
    requiere: {tablero sólo tiene 'X', 'O' y ' ' (espacio vacío) como elementos}
    requiere: {En tablero la cantidad de 'X' es igual a la cantidad de 'O' o bien la cantidad de 'X' es uno más que la cantidad de 'O'}

    asegura: {res = 1 <==> hay tres 'X' consecutivas en forma vertical (misma columna) y no hay tres 'O' consecutivas en forma vertical (misma columna)}
    asegura: {res = 2 <==> hay tres 'O' consecutivas en forma vertical (misma columna) y no hay tres 'X' consecutivas en forma vertical (misma columna)}
    asegura: {res = 0 <==> no hay tres 'O' ni hay tres 'X' consecutivas en forma vertical}
    asegura: {res = 3 <==> hay tres 'X' y hay tres 'O' consecutivas en forma vertical (evidenciando que Beto hizo trampa)}
}
```

---

### 4) Cuántos palíndromos sufijos (2 puntos)

Decimos que una palabra es palíndromo si se lee igual de izquierda a derecha que de derecha a izquierda. Se nos pide programar en python la siguiente función:

#### Problema

```
problema cuantos_sufijos_son_palindromos(in texto: String) : Z {
    requiere: -

    asegura: { res es igual a la cantidad de palíndromos que hay en el conjunto de sufijos de texto }
}
```

Nota: un sufijo es una subsecuencia de texto que va desde una posición cualquiera hasta el al final de la palabra.
Ej: "Diego", el conjunto de sufijos es: "Diego", "o". Para este ejercicio no consideraremos a como sufijo de ningun texto.

---

### 5) Preguntas teóricas (2 puntos)

Conteste marcando la opción correcta.

##### A) ¿Cuál es la función de un ciclo en Python? (0,75 punto)

<label>
  <input type="radio" id="1" name="prg1" value="1"  />
  Ejecutar un conjunto de instrucciones una sola vez.
</label>
<br>
<label>
  <input type="radio" id="2" name="prg1" value="2"  />
  Ejecutar repetidamente un conjunto de instrucciones'hasta que una condición se evalúe como falsa.
</label>
<br>
<label>
  <input type="radio" id="3" name="prg1" value="3"  />
  Definir una constante que no puede ser cambiada.
</label>

##### B) ¿Qué es una variable en Python? (0.75 punto)
<label>
  <input type="radio" id="1" name="prg2" value="1"  />
  Una función que devuelve valores aleatorios.
</label>
<br>
<label>
  <input type="radio" id="2" name="prg2" value="2"  />
  Un contenedor para almacenar datos que puede cambiar durante la ejecución del programa.
</label>
<br>
<label>
  <input type="radio" id="3" name="prg2" value="3"  />
  Un tipo de dato que solo puede contener números enteros.
</label>

##### C) ¿Cuál es la finalidad de un Control Flow Graph en testing? (0.5 punto)
<label>
  <input type="radio" id="1" name="prg2" value="1"  />
  Identificar todas las posibles salidas de un programa.
</label>
<br>
<label>
  <input type="radio" id="2" name="prg2" value="2"  />
  Visualizar todos los posibles caminos de ejecución para asegurar la cobertura completa del código.
</label>
<br>
<label>
  <input type="radio" id="3" name="prg2" value="3"  />
  Determinar los puntos de entrada y salida del programa.
</label>
