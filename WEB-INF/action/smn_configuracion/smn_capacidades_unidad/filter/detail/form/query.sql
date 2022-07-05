
select
	smn_salud.smn_capacidades_unidad.*,
	(select smn_base.smn_areas_servicios.ase_codigo || ' - ' || smn_base.smn_areas_servicios.ase_descripcion from  smn_base.smn_areas_servicios  where smn_base.smn_areas_servicios.smn_areas_servicios_id is not null  and smn_base.smn_areas_servicios.smn_areas_servicios_id=smn_salud.smn_capacidades_unidad.smn_areas_servicios_rf  order by smn_base.smn_areas_servicios.ase_descripcion ) as smn_areas_servicios_rf_combo,
	(select smn_base.smn_unidades_servicios.uns_codigo || ' - ' || smn_base.smn_unidades_servicios.uns_descripcion from  smn_base.smn_unidades_servicios  where smn_base.smn_unidades_servicios.smn_unidades_servicios_id is not null  and smn_base.smn_unidades_servicios.smn_unidades_servicios_id=smn_salud.smn_capacidades_unidad.smn_unidad_servicio_rf  order by smn_base.smn_unidades_servicios.uns_descripcion ) as smn_unidad_servicio_rf_combo
	
	
from
	smn_salud.smn_capacidades_unidad
where
	smn_capacidades_id = ${fld:id}
