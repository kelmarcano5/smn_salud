select
		smn_salud.smn_marca_comercial.smn_marca_comercial_id,
	${field}
from
	smn_salud.smn_marca_comercial
where
		smn_salud.smn_marca_comercial.smn_marca_comercial_id is not null
	${filter}
	
	
