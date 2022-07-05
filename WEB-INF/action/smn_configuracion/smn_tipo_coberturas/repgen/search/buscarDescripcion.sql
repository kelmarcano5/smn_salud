select
		smn_salud.smn_tipo_coberturas.tco_descripcion
from
		smn_salud.smn_tipo_coberturas
where
		upper(smn_salud.smn_tipo_coberturas.tco_descripcion) = upper(${fld:tco_descripcion})
