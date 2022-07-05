SELECT
	smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf AS id,
	smn_base.smn_unidades_servicios.uns_codigo || ' - ' || smn_base.smn_unidades_servicios.uns_descripcion AS item,
   smn_salud.smn_capacidades_unidad.cap_cant_max_pacientes as max_pacientes,
	smn_salud.smn_capacidades_unidad.cap_cant_min_pacientes as min_pacientes
FROM
	smn_base.smn_rel_servicio_area_unidad
	INNER JOIN smn_base.smn_servicios ON smn_base.smn_servicios.smn_servicios_id = smn_base.smn_rel_servicio_area_unidad.smn_servicios_id
	left JOIN smn_base.smn_unidades_servicios ON smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf
	left JOIN smn_salud.smn_capacidades_unidad ON smn_salud.smn_capacidades_unidad.smn_unidad_servicio_rf = smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf 
WHERE
	smn_base.smn_rel_servicio_area_unidad.smn_servicios_id=${fld:id}