select
		smn_salud.smn_series.sri_codigo
from
		smn_salud.smn_series
where
		upper(smn_salud.smn_series.sri_codigo) = upper(${fld:sri_codigo})
