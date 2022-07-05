INSERT INTO smn_salud.smn_recipe_medico
(
	smn_recipe_medico_id,
	rec_fecha,
	smn_auxiliar_rf,
	smn_patologia_id,
	smn_prestador_servicio_rf,
	rec_ordenante_nombre,
	smn_contratante_id,
	smn_farmaceuta_prestador_servicio_rf,
	rec_fecha_aprobacion,
	rec_estatus,
	rec_fecha_registro
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_recipe_medico},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
