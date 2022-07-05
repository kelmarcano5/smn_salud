select
		smn_salud.smn_tipo_coberturas.tco_codigo,
	smn_salud.smn_tipo_coberturas.tco_descripcion,
	smn_salud.smn_tipo_coberturas.tco_fecha_registro
from
	smn_salud.smn_tipo_coberturas 
where
	smn_salud.smn_tipo_coberturas.smn_tipo_coberturas_id = ${fld:id}
