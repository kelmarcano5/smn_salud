INSERT INTO smn_salud.smn_rel_cobertura_horario
(
	smn_rel_cobertura_horario_id,
	smn_coberturas_id,
	smn_horarios_id
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_rel_cobertura_horario},
	${fld:id},
	${fld:smn_horarios_id}
)
