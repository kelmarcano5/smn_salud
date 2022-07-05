INSERT INTO smn_salud.smn_salud_plantilla_detalle
(
	smn_salud_plantilla_detalle_id,
  	smn_salud_plantilla_cabecera_id,
  	smn_rel_cues_secc_preg_id,
  	smn_variable_rf,
  	spd_valor_respuesta,
  	spd_idioma,
  	spd_usuario,
  	spd_fecha_registro,
  	spd_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_salud_plantilla_detalle},
	${fld:smn_salud_plantilla_cabecera_id},
	${fld:smn_rel_cues_secc_preg_id},
	${fld:smn_variable_rf},
	${fld:spd_valor_respuesta},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
