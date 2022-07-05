select
	smn_salud.smn_tipo_coberturas.tco_codigo,
	smn_salud.smn_tipo_coberturas.tco_descripcion,
	smn_salud.smn_tipo_coberturas.tco_idioma,
	smn_salud.smn_tipo_coberturas.tco_usuario,
	smn_salud.smn_tipo_coberturas.tco_fecha_registro,
	smn_salud.smn_tipo_coberturas.tco_hora,
		smn_salud.smn_tipo_coberturas.smn_tipo_coberturas_id
	
from
	smn_salud.smn_tipo_coberturas
where
	smn_tipo_coberturas_id is not null
	${filter}
order by
		smn_tipo_coberturas_id
