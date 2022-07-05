INSERT INTO smn_salud.smn_rel_control_quirofano_prestador
(
	smn_rel_control_quirofano_prestador_id,
	smn_control_quirofano_id,
	smn_servicios_rf,
	smn_componente_rf,
	smn_grupo_prestador_servicio_rf,
	smn_prestador_servicio_rf
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_rel_control_quirofano_prestador},
	${fld:smn_control_quirofano_id},
	${fld:smn_servicios_rf},
	${fld:smn_componente_rf},
	${fld:smn_grupo_prestador_servicio_rf},
	${fld:smn_prestador_servicio_rf}
)
