UPDATE smn_salud.smn_no_registrados SET
	nfi_num_control=${fld:nfi_num_control},
	nfi_apellidos=${fld:nfi_apellidos},
	nfi_nombres=${fld:nfi_nombres},
	nfi_sexo=${fld:nfi_sexo},
	nfi_telefono_fijo=${fld:nfi_telefono_fijo},
	nfi_telefono_movil=${fld:nfi_telefono_movil},
	nfi_email=${fld:nfi_email},
	nfi_idioma='${def:locale}',
	nfi_usuario='${def:user}',
	nfi_fecha_registro={d '${def:date}'},
	nfi_hora='${def:time}'

WHERE
	smn_no_registrados_id=${fld:id}

