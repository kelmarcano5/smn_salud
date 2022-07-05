UPDATE smn_salud.smn_series SET
	sri_codigo=${fld:sri_codigo},
	sri_nombre=${fld:sri_nombre},
	sri_estatus=${fld:sri_estatus},
	sri_ultimo_numero=${fld:sri_ultimo_numero},
	sri_reinicio=${fld:sri_reinicio},
	ctm_idioma='${def:locale}',
	ctm_usuario_id='${def:user}',
	ctm_fecha_registro={d '${def:date}'},
	ctm_hora='${def:time}',
	sri_paciente_nuevo=${fld:sri_paciente_nuevo},
	smn_contratante_id=${fld:smn_contratante_id},
	sri_particular=${fld:sri_particular}

WHERE
	smn_series_id=${fld:id}

