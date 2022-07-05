select
		smn_salud.smn_tipo_coberturas.smn_tipo_coberturas_id,
	${field}
from
	smn_salud.smn_tipo_coberturas
where
		smn_salud.smn_tipo_coberturas.smn_tipo_coberturas_id is not null
	${filter}
	
	
