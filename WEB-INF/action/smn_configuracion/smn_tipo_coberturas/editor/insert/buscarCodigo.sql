select
		smn_salud.smn_tipo_coberturas.tco_codigo
from
		smn_salud.smn_tipo_coberturas
where
		upper(smn_salud.smn_tipo_coberturas.tco_codigo) = upper(${fld:tco_codigo})
