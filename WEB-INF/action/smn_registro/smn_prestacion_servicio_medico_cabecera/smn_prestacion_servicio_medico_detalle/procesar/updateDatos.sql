UPDATE smn_salud.smn_prestacion_servicio_medico_detalle SET
	psd_estatus='AT'
WHERE
	smn_ingresos_id=${fld:ingreso_id};

UPDATE smn_salud.smn_prestacion_servicio_medico_cabecera SET
	psc_estatus='AT'
WHERE
	smn_ingresos_id=${fld:ingreso_id};

UPDATE smn_salud.smn_ruta_paciente set rta_estatus =  'AT'
     WHERE rta_estatus = 'EA' and rta_secuencia = 1 and rta_ticket IN (
         SELECT igs_ticket 
         FROM smn_salud.smn_ingresos 
         WHERE smn_ingresos_id = ${fld:ingreso_id}
);

UPDATE smn_salud.smn_ordenes_medicas SET
	omd_estatus='GE'
WHERE
	smn_ingreso_id=${fld:ingreso_id};

UPDATE smn_salud.smn_recipe_medico SET
	rec_estatus='GE'
WHERE
	smn_prestacion_servicio_medico_id=(select smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id from smn_salud.smn_prestacion_servicio_medico_detalle where smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_detalle_id=${fld:id_prestacion} limit 1);