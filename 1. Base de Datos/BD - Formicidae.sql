drop database if exists Formicidae;
create database Formicidae;
use Formicidae;

-- TABLAS --
drop table if exists Rol;
drop table if exists Colonia;
drop table if exists Hormiga;

create table Rol(
	
    id int not null auto_increment,
	nombre_rol varchar(30),
    
    primary key (id)

);

create table Colonia(
	
    nombre_colonia varchar(40),
    descripcion varchar(300),
    
    primary key (nombre_colonia)
    
);

create table Hormiga(
	
	id int not null auto_increment,
    id_rol int not null,
    reina int,
    tipo varchar(40),

    primary key (id),
    foreign key (id_rol) references Rol(id),
    foreign key (tipo) references Colonia(nombre_colonia)

);
-- FIN TABLAS --


-- INSERTS --
insert into Rol
(nombre_rol)
values
('Reina'),
('Princesa'),
('Principe'),
('Nodriza'),
('Obrera'),
('Soldado'),
('Sepulturera');
 
insert into Colonia
(nombre_colonia, descripcion)
values
('Paraponera Clavata','Su nombre es producto del dolor que causa su picada, ya que esta es considerada de las más dolorosas entre los insectos.'),
('Eciton Burchellii','Conocidas por tener conductas bastante intimidantes a la hora de atacar y capturar su presas.'),
('Formica Rufa','Posee un pequeñó aguijón del cual desprende un ácido (ácido fórmico) hacias sus victimas luego de causarles heridas por su mordida.'),
('Monomorium Pharaonis','Su gran capacidad de prosperar en lugares con poca higiene las convierte en una posible plaga en hogares y edificios');

insert into Hormiga
(id_rol, reina, tipo)
values 
-- 1. Reinas (1-4)
(1,null,'Paraponera Clavata'),(1,null,'Eciton Burchellii'),(1,null,'Formica Rufa'),(1,null,'Monomorium Pharaonis'),
-- 2. Princesa (5-8)
(2,1,'Paraponera Clavata'),(2,2,'Eciton Burchellii'),(2,3,'Formica Rufa'),(2,4,'Monomorium Pharaonis'),
-- 3. Principe (9-12)
(3,1,'Paraponera Clavata'),(3,2,'Eciton Burchellii'),(3,3,'Formica Rufa'),(3,4,'Monomorium Pharaonis'),
-- 4. Nodriza (13-16)
(4,1,'Paraponera Clavata'),(4,2,'Eciton Burchellii'),(4,3,'Formica Rufa'),(4,4,'Monomorium Pharaonis'),
-- 5. Obrera (17-28)
(5,1,'Paraponera Clavata'),(5,1,'Paraponera Clavata'),
(5,2,'Eciton Burchellii'),(5,2,'Eciton Burchellii'),(5,2,'Eciton Burchellii'),(5,3,'Formica Rufa'), 
(5,3,'Formica Rufa'),(5,3,'Formica Rufa'),(5,3,'Formica Rufa'), 
(5,4,'Monomorium Pharaonis'),(5,4,'Monomorium Pharaonis'),(5,4,'Monomorium Pharaonis'),
-- 6. Soldado (29-40)
(6,1,'Paraponera Clavata'),(6,1,'Paraponera Clavata'), 
(6,2,'Eciton Burchellii'),(6,2,'Eciton Burchellii'),(6,2,'Eciton Burchellii'),(6,2,'Eciton Burchellii'), 
(6,3,'Formica Rufa'),(6,3,'Formica Rufa'),(6,3,'Formica Rufa'),
(6,4,'Monomorium Pharaonis'),(6,4,'Monomorium Pharaonis'),(6,4,'Monomorium Pharaonis'),
-- 7. Sepulturera (41-44)
(7,1,'Paraponera Clavata'),(7,2,'Eciton Burchellii'),(7,3,'Formica Rufa'),(7,4,'Monomorium Pharaonis');
-- FIN INSERTS --


-- VIEWS --
drop view if exists Hormigas_X_Colonia;
drop view if exists Paraponera_Clavata;
drop view if exists Eciton_Burchellii;
drop view if exists Formica_Rufa;
drop view if exists Monomorium_Pharaonis;

create view Hormigas_X_Colonia as
	select C.nombre_colonia as Colonia, Ha.id as Hormiga, Ha.id_rol as ID_Rol, R.nombre_rol as Rol, Ha.reina as Reina
	from Colonia as C
		join Hormiga as Ha
		on C.nombre_colonia = Ha.tipo
			join Rol as R
            on Ha.id_rol = R.id;

create view Paraponera_Clavata as
	select * 
    from Hormigas_X_Colonia
    where Colonia like '%clava%';

create view Eciton_Burchellii as
	select * 
    from Hormigas_X_Colonia
    where Colonia in ('Eciton Burchellii');
    
create view Formica_Rufa as
	select * 
    from Hormigas_X_Colonia
    where Colonia = 'Formica Rufa';

create view Monomorium_Pharaonis as
	select * 
    from Hormigas_X_Colonia
    where Colonia like 'Monomorium%';
-- FIN VIEWS --


-- SELECTS --
select id as ID_Rol, nombre_rol as Rol from Rol;
select id as ID_Hormiga, id_rol as ID_Rol, reina as Reina, tipo as Tipo from Hormiga;
select nombre_colonia as Colonia, descripcion as Descripcion from Colonia;

select * from Hormigas_X_Colonia; 
select * from Paraponera_Clavata;
select * from Eciton_Burchellii;
select * from Formica_Rufa;
select * from Monomorium_Pharaonis;


/*
Tabla Hormigas X Rol
1. Mostrar todas la hormigas existente y su rol especifico
2. Mostrar cantida de hormigas por cada rol
3. Hormigas cuyo rol contenga el string 'rera'
4. Hormigas pertenecientes a la familia real de cada colonia; entiendase la familia real como Reina, Princesas y Principes (X)
*/

-- 1. Mostrar todas la hormigas existente y su rol especifico
select Ha.id as ID_Hormiga, R.id as ID_Rol, R.nombre_rol as Rol
from Hormiga as Ha
	join Rol as R
	on Ha.id_rol = R.id
order by Ha.id;

-- 2. Mostrar cantidad de hormigas por cada rol
select R.nombre_rol as Rol, count(Ha.id_rol) as Cant_Hormigas
from Hormiga as Ha
	join Rol as R
    on Ha.id_rol = R.id
group by R.nombre_rol;

-- 3. Hormigas cuyo rol contenga la cadena de texto '...rera...'
select Ha.id as ID_Hormiga, Ha.tipo as Colonia, R.id as ID_Rol, R.nombre_rol as Rol
from Hormiga as Ha
	join Rol as R
	on Ha.id_rol = R.id
where R.nombre_rol like '%rera%';

-- 4. Hormigas pertenecientes a la familia real de cada colonia; entiendase la familia real como Reina, Princesas y Principes
select Ha.tipo as Colonia, Ha.id as ID_Hormiga, R.id as ID_Rol, R.nombre_rol as Rol
from Hormiga as Ha
	join Rol as R
    on Ha.id_rol = R.id
where R.id in (1,2,3)
order by Colonia;


/*
VIEW HORMIGAS_X_COLONIA
1. Cantidad de hormigas de cada Colonia (orden asc)
2. Cantidad de hormigas OBRERAS por Colonia (X)
	2.1. Cantidad de hormigas OBRERAS de la colonia si su nombre lleva la palabra 'Formica'
3. Mayor numero de SOLDADOS de las colonias. Nombrar dicha colonia como 'Clase Guerrera' (X)
*/


/*
Ho.id_colonia 			as ID_Colonia
Col.nombre_colonia 		as Colonia
Ho.id_hormiga 			as Hormiga
Ha.id_rol				as ID_Rol
R.nombre_rol 			as Rol
Ha.reina 				as Reina
*/

-- 1. Cantidad de hormigas de cada Colonia (orden asc)
select Colonia, count(Hormiga) as Cant_Hormigas
from Hormigas_X_Colonia
group by Colonia
order by Cant_Hormigas;

-- 2. Cantidad de hormigas OBRERAS por Colonia
select Colonia, count(ID_Rol) as Cant_Obreras
from Hormigas_X_Colonia
where ID_Rol  = 5
group by Colonia
order by Cant_Obreras asc;

-- 2.1. Cantidad de hormigas OBRERAS de la colonia si su nombre lleva la palabra 'Formica'
select Colonia, count(ID_Rol) as Cant_Obreras
from Hormigas_X_Colonia
where ID_Rol = 5 and Colonia like '%Formica%'
group by Colonia
order by Cant_Obreras asc;

-- 3. Mayor numero de SOLDADOS de las colonias. Nombrar dicha colonia como 'Clase Guerrera'
select concat_ws(' ',Colonia,': Clase Guerrera') as Colonia, count(ID_Rol) as Cant_Soldados
from Hormigas_X_Colonia
where ID_Rol = 6
group by Colonia
order by Cant_Soldados desc
limit 1;
-- FIN SELECTS --


