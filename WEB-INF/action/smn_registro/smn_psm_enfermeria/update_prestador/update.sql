UPDATE smn_salud.smn_prestacion_servicio_medico_cabecera SET
	smn_prestador_servicio_rf=${fld:presta},
	psc_estatus='EA'
WHERE
	smn_prestacion_servicio_medico_cabecera_id=${fld:id2}