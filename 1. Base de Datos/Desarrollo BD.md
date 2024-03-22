Modelo Entidad-Relación (MER)

El modelo representa las relaciones entre entidades de una posible base de datos que manejará la organización y 
jerarquización de distintas colonias de hormigas que pueda llegar a tener Simón. 

Entidades y Atributos

  a)	Entidad Hormiga
  
  -	id: Identificador único de una hormiga (Llave Primaria de tipo entero).
  -	id_rol: Identificador del rol al que fue asignada una hormiga. Este proviene de la entidad ‘Rol’ (Llave Foránea de tipo entero).
  -	tipo: Corresponde al nombre de la colonia a la cual pertenece. Este atributo proviene de la Entidad ‘Colonia’ (Llave Foránea de 
    tipo varchar).
  -	reina: Evidencia la jerarquización dentro de una colonia. El valor de este atributo será ‘null’ en caso de que corresponda a la 
    reina, de lo contrario, tomará el valor correspondiente al ‘id’ de la reina de dicha colonia.

  b)	Entidad Rol
  
  -	id: Identificador único de cada rol existente (Llave Primaria de tipo entero).
  -	nombre_rol: atributo que corresponde al nombre del rol en particular (tipo varchar).
  
  c)	Entidad Colonia
  
  -	nombre_colonia: nombre propio de cada colonia (Llave Primaria de tipo varchar).
  -	descripcion: contiene una breve descripción sobre una colonia en particular (tipo varchar).


Relaciones y Cardinalidad

La importancia de la cardinalidad es fundamental, tanto para el entendimiento como para la ejecución de esta posible base de datos. 

  a)	La relación entre la Entidad Hormiga y la Entidad Rol da a entender que una hormiga solo puede tener un rol dentro de la colonia, 
      a su vez pueden coexistir muchos hormigas que tengan el mismo rol.
  
  b)	La relación entre la Entidad Hormiga y la Entidad Colonia expone que una de estas colonias puede poseer un gran número de 
      hormigas, pero que una hormiga solo pertenece a una única colonia.

La finalidad de este MER es conducir hacia una base de datos que logre organizar y estructurar las distintas colonias que Simón 
logre tener a partir de una cantidad finita de hormigas cuyo tipo y rol sea conocido desde un inicio.


Modelo Relacional

Se desarrolla a modo de complemento, y entregando una visión formal de lo que podría ser esta base de datos, evidenciando lo 
explicado acerca de las Llaves Primarias (PK) y Llaves Foráneas (FK) en el Modelo Entidad-Relacion.

2.	Sentencias SQL

A partir de la base de datos ‘Formicidae’ (nombre científico de las hormigas) desarrollada en base al punto anterior, se ejecutan una serie 
de querys con el fin de visualizar los registros almacenados. 

Query #1: Hormigas pertenecientes a la familia real de cada colonia; entiéndase familia real como REINA, PRINCESA y PRINCIPE.

  select Ha.tipo as Colonia, Ha.id as ID_Hormiga, R.id as ID_Rol, R.nombre_rol as Rol
  from Hormiga as Ha
  	join Rol as R
      on Ha.id_rol = R.id
  where R.id in (1,2,3)
  order by Colonia;


Query #2: Cantidad de hormigas OBRERAS por Colonia.

  select Colonia, count(ID_Rol) as Cant_Obreras
  from Hormigas_X_Colonia
  where ID_Rol  = 5
  group by Colonia
  order by Cant_Obreras asc;


Query #3: Mayor número de SOLDADOS entre las colonias. Nombrar dicha colonia como 'Clase Guerrera'.

  select concat_ws(' ',Colonia,': Clase Guerrera') as Colonia, count(ID_Rol) as Cant_Soldados
  from Hormigas_X_Colonia
  where ID_Rol = 6
  group by Colonia
  order by Cant_Soldados desc
  limit 1;


