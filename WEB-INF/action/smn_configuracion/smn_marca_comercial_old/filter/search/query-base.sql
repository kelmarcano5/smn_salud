select	
	smn_salud.smn_marca_comercial.mac_codigo,
	smn_salud.smn_marca_comercial.mac_descripcion,
	smn_salud.smn_marca_comercial.mac_fecha_registro,
	smn_salud.smn_marca_comercial.smn_marca_comercial_id

from
	smn_salud.smn_marca_comercial
where
	smn_marca_comercial_id is not null	
 	 	${filter}
order by 
	smn_marca_comercial_id