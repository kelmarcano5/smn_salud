select	
	smn_salud.smn_coberturas.cob_codigo,
	smn_salud.smn_coberturas.cob_descripcion,
	smn_salud.smn_coberturas.cob_vigencia_desde,
	smn_salud.smn_coberturas.cob_vigencia_hasta,
	smn_salud.smn_coberturas.cob_cobertura_desde,
	smn_salud.smn_coberturas.cob_cobertura_hasta,
	smn_salud.smn_coberturas.cob_fecha_registro,
	smn_salud.smn_coberturas.smn_coberturas_id

from
	smn_salud.smn_coberturas
where
	smn_coberturas_id is not null	
 	 	${filter}
order by 
	smn_coberturas_id