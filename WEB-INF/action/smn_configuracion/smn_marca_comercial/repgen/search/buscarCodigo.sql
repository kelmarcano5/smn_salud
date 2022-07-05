select
		smn_salud.smn_marca_comercial.mac_codigo
from
		smn_salud.smn_marca_comercial
where
		upper(smn_salud.smn_marca_comercial.mac_codigo) = upper(${fld:mac_codigo})
