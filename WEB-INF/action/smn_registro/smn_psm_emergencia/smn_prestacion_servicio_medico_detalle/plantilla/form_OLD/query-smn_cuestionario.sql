SELECT 
	smn_cuestionario_id AS id, 
	cue_codigo || ' - ' || cue_descripcion AS item 
FROM 
	smn_base.smn_cuestionario
	INNER JOIN
	smn_base.smn_modulos ON smn_base.smn_cuestionario.smn_modulo_rf = smn_base.smn_modulos.smn_modulos_id
WHERE
	smn_base.smn_modulos.mod_codigo IN ('SMN_ADM')
	AND 
	(SELECT prs_nivel_seguridad FROM smn_base.smn_prestadores_servicios INNER JOIN smn_salud.smn_prestacion_servicio_medico_detalle ON smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestador_servicio_rf=smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id WHERE smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_detalle_id=${fld:smn_prestacion_servicio_medico_detalle_id}) >= smn_base.smn_cuestionario.cue_nivel_seguridad
ORDER BY 
	cue_codigo
