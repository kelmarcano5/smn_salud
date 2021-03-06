INSERT INTO smn_salud.smn_contratante
(
	smn_contratante_id,
	smn_documento_id,
	cnt_numero_control,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	smn_plan_id,
	cnt_fecha_de_inicio,
	cnt_cantidad_citas,
	cnt_idioma,
	cnt_usuario_id,
	cnt_fecha_registro,
	cnt_hora,
	smn_estructura_organizacional_rf,
	smn_baremos_id,
	smn_clase_baremos_rf,
	smn_documento_ingreso_id
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_contratante},
	${fld:smn_documento_id},
	${seq:currval@smn_salud.seq_numero_control},
	${fld:smn_clase_auxiliar_rf},
	${fld:smn_auxiliar_rf},
	${fld:smn_plan_id},
	${fld:cnt_fecha_de_inicio},
	${fld:cnt_cantidad_citas},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:smn_estructura_organizacional_rf},
	${fld:smn_baremos_id},
	${fld:smn_clase_baremos_rf},
	${fld:smn_documento_ingreso_id}
);

