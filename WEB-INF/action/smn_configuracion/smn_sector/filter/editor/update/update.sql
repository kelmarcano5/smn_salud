UPDATE smn_salud.smn_sector SET
	sec_codigo=${fld:sec_codigo},
	sec_descripcion=${fld:sec_descripcion},
	smn_pais_rf=${fld:smn_pais_rf},
	smn_entidades_federales_rf=${fld:smn_entidades_federales_rf},
	smn_ciudades_rf=${fld:smn_ciudades_rf},
	smn_municipios_rf=${fld:smn_municipios_rf},
	smn_parroquias_rf=${fld:smn_parroquias_rf},
	smn_zonas_postales_rf=${fld:smn_zonas_postales_rf},
	sec_idioma='${def:locale}',
	sec_usuario_id='${def:user}',
	sec_fecha_registro={d '${def:date}'},
	sec_hora='${def:time}'

WHERE
	smn_sector_id=${fld:id}

