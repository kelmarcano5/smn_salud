UPDATE smn_salud.smn_ingresos SET
	igs_fecha_salida=${fld:igs_fecha_salida},
	igs_hora_salida=${fld:igs_hora_salida},
	ctm_observaciones_id=${fld:ctm_observaciones_id},
	igs_estatus_financiero='EG'
WHERE
	smn_ingresos_id=${fld:id};

