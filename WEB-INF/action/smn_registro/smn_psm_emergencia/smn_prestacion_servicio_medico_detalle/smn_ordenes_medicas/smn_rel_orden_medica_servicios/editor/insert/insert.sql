INSERT INTO smn_salud.smn_rel_orden_medica_servicios
(
	smn_rel_orden_medica_servicios_id,
	smn_ordenes_medicas_id,
	smn_servicios_rf,
	ros_observacion,
	smn_grupo_prestador_rf,
	smn_prestador_servicio_referido_rf
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_rel_orden_medica_servicios},
	${fld:smn_ordenes_medicas_id},
	${fld:smn_servicios_rf},
	${fld:ros_observacion},
	case when ${fld:smn_grupo_prestador_servicio_rf} is null then 0 else ${fld:smn_grupo_prestador_servicio_rf} end,
	case when ${fld:smn_prestador_servicio_rf} is null then 0 else ${fld:smn_prestador_servicio_rf} end 
)
