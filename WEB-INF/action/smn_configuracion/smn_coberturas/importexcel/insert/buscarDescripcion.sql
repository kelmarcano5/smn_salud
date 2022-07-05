select
		smn_salud.smn_coberturas.cob_descripcion
from
		smn_salud.smn_coberturas
where
		upper(smn_salud.smn_coberturas.cob_descripcion) = upper(${fld:cob_descripcion})
