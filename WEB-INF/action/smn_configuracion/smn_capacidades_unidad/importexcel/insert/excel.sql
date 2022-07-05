INSERT INTO smn_salud.smn_capacidades_unidad
(
	smn_capacidades_id,
	smn_areas_servicios_rf,
	smn_unidad_servicio_rf,
	cap_cant_max_pacientes,
	cap_cant_min_pacientes,
	cap_idioma,
	cap_usuario_id,
	cap_fecha_registro,
	cap_hora
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_capacidades_unidad},
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
