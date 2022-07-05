SELECT
	smn_salud.smn_diagnostico.dgn_codigo ||' - '|| smn_salud.smn_diagnostico.dgn_descripcion AS smn_diagnostico_rf_combo,
	smn_salud.smn_reposos_constancias.rpc_fecha_desde,
	smn_salud.smn_reposos_constancias.rpc_fecha_hasta,
	smn_salud.smn_reposos_constancias.rpc_fecha_reintegro,
 	smn_salud.smn_motivos.mtv_codigo ||' - '|| smn_salud.smn_motivos.mtv_descripcion AS smn_motivos_id_combo,
 	smn_salud.smn_reposos_constancias.rpc_numero_reposo_certificado,
 	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion AS smn_auxiliar_id_combo,
 	smn_salud.smn_reposos_constancias.rpc_numero_sanidad,
 	smn_salud.smn_reposos_constancias.rpc_entidad_emisora,
 	smn_salud.smn_reposos_constancias.rpc_observacion
FROM
	smn_salud.smn_reposos_constancias
	INNER JOIN
	smn_salud.smn_diagnostico ON smn_salud.smn_diagnostico.smn_diagnostico_id=smn_salud.smn_reposos_constancias.smn_diagnostico_rf
	INNER JOIN 
	smn_salud.smn_motivos ON smn_salud.smn_motivos.smn_motivos_id=smn_salud.smn_reposos_constancias.rpc_motivo
	LEFT OUTER JOIN
	smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id=smn_salud.smn_reposos_constancias.smn_medico_auxiliar_rf
WHERE
	smn_salud.smn_reposos_constancias.smn_reposos_constancias_id=${fld:id}