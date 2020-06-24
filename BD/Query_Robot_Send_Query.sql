#QUERY PARA VER PERIODOS ABIERTOS Y SIN REVISION 
select 
pr.Nombre, pr.idProyecto, pr.idProyecto_Cliente, pr.Dias_Actualizacion,
pc.Tipo,
ets.Estado_Actual, ets.Estado_Anterior, ets.Fecha_Actualizacion
from estado_actualizacion as ets
inner join proyecto as pr on (ets.idProyecto=pr.idProyecto)
inner join periodo_controlable as pc on (ets.idProyecto=pc.idProyecto)
inner join lider_tecnico as lt on (pr.idLider_Tecnico=lt.idLider_Tecnico)
inner join gerente as gt on (pr.idGerente=gt.idGerente)
inner join facilitador as faci on (pr.idFacilitador=faci.idFacilitador)
where ets.Estado_Actual = 'Sin revision'
and pc.Estado = 'Abierto' and pr.Dias_Actualizacion = 0;

#QUERY PARA VER PERIODOS ABIERTOS Y EN ACTUALIZACION 	
select 
pr.Nombre, pr.idProyecto, pr.idProyecto_Cliente, pr.Dias_Actualizacion,
pc.Tipo, pc.Estado,
ets.Estado_Actual, ets.Estado_Anterior
from estado_actualizacion as ets
inner join proyecto as pr on (ets.idProyecto=pr.idProyecto)
inner join periodo_controlable as pc on (ets.idProyecto=pc.idProyecto)
inner join lider_tecnico as lt on (pr.idLider_Tecnico=lt.idLider_Tecnico)
inner join gerente as gt on (pr.idGerente=gt.idGerente)
inner join facilitador as faci on (pr.idFacilitador=faci.idFacilitador)
where ets.Estado_Actual = 'Actualizacion'
and pc.Estado = 'Abierto';

#QUERY PARA ACTUALIZAR TABLA DE SEGUIMIENTO DESPUES DEL ENVIO (GERENTE)
select * from estado_actualizacion;
update estado_actualizacion set Estado_Actual = 'Actualizacion', Fecha_Actualizacion = now() WHERE idProyecto = '123';

#QUERY PARA ACTUALIZAR TABLA DE SEGUIMIENTO DESPUES DEL ENVIO (FACILITADOR)
select * from estado_actualizacion;
update estado_actualizacion set Estado_Actual = 'Actualizacion', Fecha_Actualizacion = now() WHERE idProyecto = '456';

#QUERY PARA ACTUALIZAR TABLA DE SEGUIMIENTO DESPUES DEL ENVIO (LIDER TECNICO)
select * from estado_actualizacion;
update estado_actualizacion set Estado_Actual = 'Actualizacion', Fecha_Actualizacion = now() WHERE idProyecto = '789';

#
select datediff('2020-05-20',now());
select * from proyecto where Dias_Actualizacion = 0 and idProyecto = 123;

#
insert into estado_actualizacion(Estado_Actual, Fecha_Actualizacion, idProyecto)
values ('Actualizacion',now(),'123')
on duplicate key update
Estado_Actual = 'Actualizacion',
Fecha_Actualizacion = now(),
idProyecto = '123'
