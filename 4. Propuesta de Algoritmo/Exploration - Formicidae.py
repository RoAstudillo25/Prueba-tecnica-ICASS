
from random import randint
from time import sleep
from os import system

elements = {
        'ant':'\U0001F41C', 
        'rock':'\U0001FAA8'
        }

pheromone = {
        'food':'o',
        'exploration':'-'
        }

food = [
        '\U0001F344',  #🍄 principes y princesas
        '\U0001F350',  #🍐 nodrizas
        '\U0001F955',  #🥕 soldados
        '\U0001F33F',  #🌿 obreras
        '\U0001FAD8'   #🫘 sepultureras
    ]

def ExplorationArea (row,col):
    """ Función para generar área de exploración con bordes (estos no son 
        parte del área de exploración)  .

    Args:
        row (int): parámetro que define el número de filas.
        col (int): parámetro que define el número de columnas.

    Returns:
        array: matriz área de exploración.
    """

    matrix = list()
    last_row = row - 1
    last_col = col - 1

    for i in range(row):
        fila = list()
        for j in range(col):
            fila.append(elements['rock'] if i == 0 or i == last_row else 
                        elements['rock'] if j == 0 or j == last_col else ' ')
        matrix.append(fila)

    return matrix

def ShowArea (matrix):
    """ Función para mostrar el area de exploración.

    Args:
        matrix (array): se recibe como parámetro la matriz a visualizar.
    """

    row_count = len(matrix)
    cols_count = len(matrix[0])

    for i in range(0,row_count):
        for j in range(0,cols_count):
            print(matrix[i][j], end='   ')
        print()

def FoodCoords (matrix, ant_coord):
    """ Función encargada de disrtibuir de manera random,
        una cantidad (al azar) de alimentos por el area de exploración.

    Args:
        matrix (array): matriz de área generada previamente.
        ant_coord (tuple): coordenadas de origen de la hormiga.

    Returns:
        array: la nueva matriz con la hormiga en su punto de origen y 
                los alimentos repartidos de manera aleatoria dentro del área.
        int: cantidad de alimentos generados.
    """

    matrix[ant_coord[0]][ant_coord[1]] = elements['ant']

    coord_array = [ant_coord]

    quantity_food = randint(5,10)
    
    count_food = 0

    while count_food < quantity_food:
        
        coord_x = randint(1,len(matrix)-2)
        coord_y = randint(1,len(matrix[0])-2)
        pair = (coord_x, coord_y)
        
        if pair not in coord_array:
            coord_array.append(pair)
            matrix[pair[0]][pair[1]] = food[randint(0,len(food)-1)]
            count_food+=1

    return matrix, quantity_food

def Exploration (matrix, initial_position, quantity_food):
    """Función principal que permite ejecutar la dinámica de exploración y búsqueda de alimentos.

    Args:
        matrix (array): matriz de área de exploración.
        initial_position (tuple): posición inicial de la hormiga.
        quantity_food (int): cantidad de alimento repartido en el área de exploración.
    """

    quota = 0
    success = False

    found_food = tuple()
    current = initial_position   
    
    food_record = dict()
    path_record = {current: pheromone['exploration']}

    while success == False:
        
        print(f'\nPosicion actual: {current}\n')

        ShowArea(matrix)

        next = tuple()

        print('\nMovimiemtos posibles\n- Arriba    : w\n- Abajo     : s\n- Derecha   : d\n- Izquierda : a\n')

        if (matrix[current[0]][current[1] + 1] in food):
            
            found_food = (current[0], current[1] + 1)

            if found_food not in food_record:
                food_record[found_food] = matrix[current[0]][current[1] + 1]
                quota+=1

            for key in path_record:
                path_record[key] = pheromone['food']
                matrix [key[0]] [key[1]] = pheromone['food']         

        elif (matrix[current[0]][current[1] -1] in food):
            
            found_food = (current[0], current[1] - 1)
            
            if found_food not in food_record:
                food_record[found_food] = matrix[current[0]][current[1] - 1]
                quota+=1

            for key in path_record:
                path_record[key] = pheromone['food']
                matrix [key[0]] [key[1]] = pheromone['food']

        elif (matrix[current[0] + 1][current[1]] in food):
            
            comida_econtrada = (current[0] + 1, current[1])
            
            if comida_econtrada not in food_record:
                food_record[comida_econtrada] = matrix[current[0] + 1][current[1]]
                quota+=1

            for key in path_record:
                path_record[key] = pheromone['food']
                matrix [key[0]] [key[1]] = pheromone['food']

        elif (matrix[current[0] - 1][current[1]] in food):
            
            comida_econtrada = (current[0] - 1, current[1])

            if found_food not in food_record:
                food_record[comida_econtrada] = matrix[current[0] - 1][current[1]]
                quota+=1

            for key in path_record:
                path_record[key] = pheromone['food']
                matrix [key[0]] [key[1]] = pheromone['food']

        print(f'\nAlimento recolectado..\n')
        for key in food_record:
            print(f'{key}: {food_record[key]}')
        
        print(f'\nquota: {quota}/{quantity_food}')

        if quota < quantity_food:

            movimiento = input('\nIndique movimiento: ')

            if movimiento == 'd':
                
                # comprobamos si el movimiento dirige a la hormiga hacia una roca
                if matrix[current[0]][current[1] + 1] == elements['rock']:
                    print( elements['rock'] + ' ¡CHOCASTE CON UNA ROCA! ' + elements['rock'])
                    pass
                elif matrix[current[0]][current[1] + 1] in food:
                    print('¡ DEBES RODEAR LA COMIDA !')
                    pass                
                else:
                
                    if matrix [current[0]] [current[1] + 1] == ' ':
                        
                        matrix [current[0]] [current[1]] = pheromone['exploration']
                        
                        next = (current[0], current[1] + 1)
                        current = next
                        path_record[current] = pheromone['exploration']

                        matrix[current[0]][current[1]] = elements['ant']
            
            elif movimiento == 'a':
                
                # comprobamos si el movimiento dirige a la hormiga hacia una roca
                if matrix [current[0]] [current[1] - 1] == elements['rock']:
                    print( elements['rock'] + ' CHOCASTE CON UNA ROCA ' + elements['rock'])
                    pass
                elif matrix[current[0]][current[1] - 1] in food:
                    print('¡ DEBES RODEAR LA COMIDA !')
                    pass                
                else:
                
                    if matrix [current[0]] [current[1] - 1] == ' ':
                        
                        matrix [current[0]] [current[1]] = pheromone['exploration']
                        
                        next = (current[0], current[1] - 1)
                        current = next
                        path_record[current] = pheromone['exploration']

                        matrix[current[0]][current[1]] = elements['ant']

            elif movimiento == 'w':
                
                # comprobamos si el movimiento dirige a la hormiga hacia una roca
                if matrix [current[0] - 1] [current[1]] == elements['rock']:
                    print( elements['rock'] + ' CHOCASTE CON UNA ROCA ' + elements['rock'])
                    pass
                elif matrix[current[0] - 1][current[1]] in food:
                    print('¡ DEBES RODEAR LA COMIDA !')
                    pass                
                else:
                
                    if matrix [current[0] - 1] [current[1]] == ' ':
                        
                        matrix [current[0]] [current[1]] = pheromone['exploration']
                        
                        next = (current[0] - 1, current[1])
                        current = next
                        path_record[current] = pheromone['exploration']

                        matrix[current[0]][current[1]] = elements['ant']

            elif movimiento == 's':
            
                # comprobamos si el movimiento dirige a la hormiga hacia una roca
                if matrix [current[0] + 1] [current[1]] == elements['rock']:
                    print( elements['rock'] + ' CHOCASTE CON UNA ROCA ' + elements['rock'])
                    pass
                elif matrix[current[0] + 1][current[1]] in food:
                    print('¡ DEBES RODEAR LA COMIDA !')
                    pass
                else:
                
                    if matrix [current[0] + 1] [current[1]] == ' ':
                        
                        matrix [current[0]] [current[1]] = pheromone['exploration']
                        
                        next = (current[0] + 1, current[1])
                        current = next
                        path_record[current] = pheromone['exploration']

                        matrix[current[0]][current[1]] = elements['ant']

        else: success = True

        if success == False:
            
            sleep(1)
            system('clear')

        else: 

            system('clear')

            ShowArea(matrix)

            print(f'\nRegistro de comida\n')
            for key in food_record:
                print(f'{key}: {food_record[key]}\n')


initial_area = ExplorationArea(15,15)
initial_position = (1,1)
food_area, quantity_food = FoodCoords(initial_area, initial_position)

Exploration(food_area, initial_position, quantity_food)
