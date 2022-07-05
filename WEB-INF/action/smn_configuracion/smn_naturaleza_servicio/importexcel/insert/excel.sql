INSERT INTO smn_salud.smn_naturaleza_servicio
(
	smn_naturaleza_servicio_id,
	smn_tipo_servicio_rf,
	nts_naturaleza,
	nts_fecha_registro
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_naturaleza_servicio},
	?,
	?,
	{d '${def:date}'}
)
