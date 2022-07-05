UPDATE smn_base.smn_auxiliar_contacto SET
	smn_tipo_contactos_rf=${fld:smn_tipo_contactos_rf},
	auc_descripcion=${fld:auc_descripcion},
	auc_idioma='${def:locale}',
	auc_usuario='${def:user}',
	auc_fecha_registro={d '${def:date}'},
	auc_hora='${def:time}'

WHERE
	smn_auxiliar_rf=${fld:id}
