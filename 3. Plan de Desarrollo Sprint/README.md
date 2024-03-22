## Sprint 1: Base de Datos

Primer Sprint del plan de desarrollo, cuyo objetivo es la creación de una base de datos capaz de almacenar toda la información acerca de las hormigas y sus colonias.

+ Épica: Desarrollo de base de datos
+ Prioridad del requerimiento: Alta
+ Dificultad: Alta
+ Personas: 1
+ Tiempo máx.: 15 horas

Requerimiento 1.1: Simón necesita un modelo para explicarle a su madre como él puede ser capaz de mantener un ambiente controlado y organizar colonias de hormigas sin mezclar en un 
hormiguero distintos tipos de hormigas. Para ello se establece un modelo Entidad-Relación que ejemplifique la composición y jerarquización dentro de una colonia en su hormiguero. 
- HU 1.1: Establecer Modelo Entidad-Relación

Requerimiento 1.2: Una pieza fundamental para una base de datos, es precisamente la información, es por esto que Simón necesita conocer cada tipo de hormiga que va a tener y que rol cumplirá 
dentro de la colonia. En este punto se determina que datos (información) son relevantes para el desarrollo de esta base de datos y se establecen los tipos de datos que se 
utilizarán (int, varchar, entre otros).
- HU 1.2: Recopilar información relevante que responda a la definición de la problemática

Requerimiento 1.3: Simón necesita digitalizar toda la información recopilada, por lo que se desarrolla un script SQL donde se cree una base de datos capaz de almacenar estos registros en diversas 
tablas, cuidando la relación entre ellas.
- HU 1.3: Crear base de datos


## Sprint 2: Algoritmo de búsqueda de alimento

La segunda etapa de este proyecto, tiene como objetivo desarrollar un algoritmo capaz de replicar la búsqueda de alimento de la hormigas en un ambiente controlado que actúe como simulador.

+ Épica: Territorio de exploración de hormigas
+ Prioridad del requerimiento: Alta
+ Dificultad: Alta
+ Personas: 1
+ Tiempo máx.: 18 horas

Requerimiento 2.1: En primer lugar, para que Simón pueda obtener este ansiado simulador, se debe definir la estructura de datos que permita manejar un ambiente delimitado y controlado como territorio 
de exploración para un número finito de hormigas que deberán recorrer este espacio virtual.
- HU 2.1: Definir estructura de datos para manejar la creación de territorio de exploración.

Requerimiento 2.2: El cómo recorrer este territorio es una gran interrogante que debe responder Simón, para ello debe establecer una estrategia de búsqueda y recorrido dentro de este ambiente virtual.
- HU 2.2: Definir interacción de hormigas con la estructura definida para el territorio.

Requerimiento 2.3: Se requiere de la creación de instancias que simule un territorio de posible exploración.
- HU 2.3: Implementar creación de instancias de territorios de exploración.

Requerimiento 2.4: Establecer métodos para el movimiento de hormigas dentro del ambiente virtual de exporación.
- HU 2.4: Integrar interacción entre instancias de territorio de exploración y las hormigas

 
## Sprint 3: Algoritmo de ataque/defensa

Para el tercer sprint de esta planificación, se requiere de un algoritmo que simule la comunican entre hormigas en caso de encontrarse con una amenaza durante la exploración de 
nuevo territorio o el ataque de una colonia enemiga hacia el hormiguero.

+ Épica: Ataque y defensa de colonia
+ Prioridad del requerimiento: Alta
+ Dificultad: Alta
+ Personas: 1
+ Tiempo máx.: 22 horas

Requerimiento 3.1: Para entender el funcionamiento de la comunicación entre hormigas, se requiere de un ambiente virtual en donde se pueda desarrollar esta comunicación, para ello se necesita 
definir una estructura de datos que permita simular la comunicación entre las hormigas en momentos de ataques contra otras colonias.
- HU 3.1: Definir estructura de datos para manejar la creación de una zona que simule eventos de ataque/defensa
  
Requerimiento 3.2: Se requiere de una estrategia de comunicación a través de las feromonas que desprende una hormiga en una situación de ataque/defensa.
- HU 3.2: Definir interacción de hormigas con la estructura definida para el territorio.

Requerimiento 3.3: Se necesita simular un ambiente virtual que permita desarrollar tanto comunicación como enfrentamiento entre hormigas.
- HU 3.3: Implementar creación de instancias de zonas de batalla.

Requerimiento 3.4: Se desea definir la comunicación en este simulador virtual de una supuesta ‘guerra’ entre colonias, por lo que es fundamental comprender el 
comportamiento de las hormigas a través de las feromonas que desprenden en situaciones como estas.
- HU 3.4: Integrar interacción entre hormigas durante eventos de ataque/defensa

