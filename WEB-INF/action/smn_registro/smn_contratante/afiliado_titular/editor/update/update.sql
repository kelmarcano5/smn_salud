UPDATE smn_salud.smn_afiliado_titular SET
	smn_documento_id=${fld:smn_documento_id},
	afi_numero_control=${fld:afi_numero_control},
	smn_contratante_id=${fld:smn_contratante_id},
	smn_auxiliar_unidades_negocios_rf=${fld:smn_auxiliar_unidades_negocios_rf},
	smn_auxiliar_sucursales_rf=${fld:smn_auxiliar_sucursales_rf},
	smn_auxiliar_areas_servicios_rf=${fld:smn_auxiliar_areas_servicios_rf},
	smn_auxiliar_unidades_servicios_rf=${fld:smn_auxiliar_unidades_servicios_rf},
	afi_clase_auxiliar_rf=${fld:afi_clase_auxiliar_rf},
	afi_auxiliar_rf=${fld:afi_auxiliar_rf},
	afi_fecha_de_registro=${fld:afi_fecha_de_registro},
	afi_fecha_de_inicio=${fld:afi_fecha_de_inicio},
	afi_estatus=${fld:afi_estatus},
	afi_fecha_desafiliado=${fld:afi_fecha_desafiliado},
	afi_idioma='${def:locale}',
	afi_usuario_id='${def:user}',
	afi_fecha_registro='${def:date}',
	afi_hora='${def:time}'

WHERE
	smn_afiliados_id=${fld:id}

