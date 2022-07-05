UPDATE smn_salud.smn_afiliados SET
	afi_num_control=${fld:afi_num_control},
	afi_apellidos=${fld:afi_apellidos},
	afi_nombres=${fld:afi_nombres},
	afi_sexo=${fld:afi_sexo},
	afi_tipo_doc_oficial=${fld:afi_tipo_doc_oficial},
	afi_nro_doc_oficial=${fld:afi_nro_doc_oficial},
	afi_idioma='${def:locale}',
	afi_usuario='${def:user}',
	afi_fecha_registro={d '${def:date}'},
	afi_hora='${def:time}'

WHERE
	smn_afiliados_id=${fld:id}

