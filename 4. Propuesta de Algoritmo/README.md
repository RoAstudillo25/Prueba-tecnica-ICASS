## Popuesta algorítmica para Sprint 2: Algoritmo de búsqueda de alimento

Inicialmente se dispone de una matriz que representa el territorio de exploración por parte de un hormiga, cuyo punto de inicio corresponde a las coordenadas (1,1) de la matriz. Además se distribuyen 
de manera aleatoria dentro del territorio de exploración, cierta cantidad de alimentos los cuales debe recolectar la hormiga.

![TERRITORIO](TERRITORIO.png)

## Modo de interacción

El programa responde a la interacción del usuario por teclado, ingresando los movimientos indicados en pantalla que son posibles de realizar. Esto permite el movimiento de la hormiga dentro del territorio
de exploración hacia la derecha, izquierda, arriba y abajo. 

Luego de realizar algunos movimientos posicionando a la hormiga lo más cerca posible al alimento, esta es capaz de recolectar cada alimento encontrado, almacenando tanto la coordenada (clave), como el 
alimento (valor) en un diccionario compuesto de un clave y valor, respectivamente.

![ALIMENTOS RECOLECTADOR Y MOVIMIENTOS](ALIMENTOSyMOVIMIENTOS.png)

Es importante recalcar, que en cada paso que da la hormiga, desprende una feromona que indica si aun se encuentra explorando (feromona de exploración: ' - ') o si encontro comida (feromona de hallazgo 
de aliemnto = ' o ') 

![FEROMONAS1](FEROMONAS1.png) -> ![FEROMONAS2](FEROMONAS2.png)

La exploración finaliza cuando la hormiga halla recolectado todos los alimentos dispuestos en la zona de exploración

![TERMINO](TERMINO.png)
