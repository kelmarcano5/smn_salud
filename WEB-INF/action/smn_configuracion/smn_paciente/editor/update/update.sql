UPDATE smn_salud.smn_paciente SET
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	smn_clasificacion_abc_rf=${fld:smn_clasificacion_abc_rf},
	pac_vigencia=${fld:pac_vigencia},
	pac_estatus=${fld:pac_estatus},
	smn_forma_pago_rf=${fld:smn_forma_pago_rf},
	smn_condicion_financiera_rf=${fld:smn_condicion_financiera_rf},
	smn_promotor_rf=${fld:smn_promotor_rf},
	pac_idioma='${def:locale}',
	pac_usuario='${def:user}',
	pac_fecha_registro={d '${def:date}'},
	pac_hora='${def:time}'

WHERE
	smn_paciente_id=${fld:id}

