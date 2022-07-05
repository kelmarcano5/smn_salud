SELECT 
	smn_salud.smn_habitaciones.smn_habitaciones_id as id,
	smn_salud.smn_habitaciones.hab_codigo ||' - '|| smn_salud.smn_habitaciones.hab_descripcion as item 
from smn_base.smn_areas_servicios
inner join smn_salud.smn_habitaciones on smn_salud.smn_habitaciones.smn_areas_servicios_rf = smn_base.smn_areas_servicios.smn_areas_servicios_id
where smn_salud.smn_habitaciones.smn_areas_servicios_rf=${fld:id} 
group by id