INSERT INTO smn_salud.smn_agenda
(
	smn_agenda_id,
	smn_citas_id,
  	smn_ingreso_id,
  	smn_entidades_rf,
  	smn_sucursales_rf,
  	smn_areas_servicios_rf,
  	smn_unidades_servicios_rf,
  	smn_grupo_prestador_servicio_rf,
  	smn_prestador_servicio_rf,
  	smn_servicios_rf,
  	age_fecha,
  	age_turno,
  	age_hora_agendado,
  	smn_estatus_citas_id,
  	age_idioma,
  	age_usuario,
  	age_fecha_registro,
  	age_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_agenda},
	${seq:currval@smn_salud.seq_smn_citas},
	0,
	0,
	${fld:smn_sedes},
	0,
	0,
	1,
	1,
	1,
	${fld:smn_fecha_cita},
	0,
	0,
	3,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'	
);


