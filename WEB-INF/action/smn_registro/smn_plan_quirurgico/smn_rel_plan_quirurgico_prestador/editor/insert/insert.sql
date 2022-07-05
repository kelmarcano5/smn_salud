INSERT INTO smn_salud.smn_rel_plan_quirurgico_prestador
(
	smn_rel_plan_quirurgico_prestador_id,
	smn_plan_quirurgico_id,
	smn_servicios_rf,
	smn_componentes_rf,
	smn_grupo_prestador_servicio_rf,
	smn_prestador_servicio_rf
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_rel_plan_quirurgico_prestador},
	${fld:smn_plan_quirurgico_id},
	${fld:smn_servicios_rf},
	${fld:smn_componentes_rf},
	${fld:smn_grupo_prestador_servicio_rf},
	${fld:smn_prestador_servicio_rf}
)
