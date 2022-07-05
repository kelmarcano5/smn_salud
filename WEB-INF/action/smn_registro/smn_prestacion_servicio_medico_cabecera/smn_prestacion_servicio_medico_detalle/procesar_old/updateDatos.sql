UPDATE smn_salud.smn_prestacion_servicio_medico_cabecera SET
	psc_estatus='AT'
WHERE
	smn_ingresos_id=${fld:ingreso_id};

UPDATE smn_salud.smn_prestacion_servicio_medico_detalle SET
	psd_estatus='GE'
WHERE
	smn_ingresos_id=${fld:ingreso_id} and smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_detalle_id=${fld:id};

UPDATE smn_salud.smn_ordenes_medicas SET
	omd_estatus='GE'
WHERE
	smn_ingreso_id=${fld:ingreso_id};
	
UPDATE smn_salud.smn_recipe_medico SET
	rec_estatus='GE'
WHERE
	smn_prestacion_servicio_medico_id=(select smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id from smn_salud.smn_prestacion_servicio_medico_detalle where smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_detalle_id=${fld:id_prestacion} limit 1);