UPDATE smn_base.smn_auxiliar_cuenta_bancaria SET
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	acb_num_cuenta=${fld:acb_num_cuenta},
	acb_tipo_cta_banco=${fld:acb_tipo_cta_banco},
	acb_respons_cuenta=${fld:acb_respons_cuenta},
	acb_banco_pertenece=${fld:acb_banco_pertenece},
	acb_num_aba=${fld:acb_num_aba},
	acb_idioma='${def:locale}',
	acb_usuario='${def:user}',
	acb_fecha_registro={d '${def:date}'},
	acb_hora='${def:time}'

WHERE
	smn_auxiliar_cuenta_bancaria_id=${fld:id}

