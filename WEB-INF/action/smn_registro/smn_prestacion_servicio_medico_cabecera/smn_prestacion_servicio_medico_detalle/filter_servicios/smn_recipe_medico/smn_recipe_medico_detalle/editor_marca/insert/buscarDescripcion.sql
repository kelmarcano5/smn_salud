select
		smn_salud.smn_marca_comercial.mac_descripcion
from
		smn_salud.smn_marca_comercial
where
		upper(smn_salud.smn_marca_comercial.mac_descripcion) = upper(${fld:mac_descripcion})
