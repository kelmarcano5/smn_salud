select smn_salud.smn_habitaciones.smn_habitaciones_id as id, smn_salud.smn_habitaciones.hab_codigo ||' - '|| smn_salud.smn_habitaciones.hab_descripcion as item from smn_salud.smn_habitaciones where smn_salud.smn_habitaciones.hab_estatus='DI' 
and smn_salud.smn_habitaciones.hab_naturaleza='QX'
order by smn_salud.smn_habitaciones.smn_habitaciones_id asc
