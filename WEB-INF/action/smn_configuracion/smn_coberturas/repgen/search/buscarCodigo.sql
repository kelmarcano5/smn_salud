select
		smn_salud.smn_coberturas.cob_codigo
from
		smn_salud.smn_coberturas
where
		upper(smn_salud.smn_coberturas.cob_codigo) = upper(${fld:cob_codigo})
