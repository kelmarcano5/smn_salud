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
	${seq:nextval@smn_salud.seq_smn_rel_plan_quirurgico_prestador},
	?,
	?,
	?,
	?,
	?
)
