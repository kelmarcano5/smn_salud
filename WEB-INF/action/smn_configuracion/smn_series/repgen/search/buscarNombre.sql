select
		smn_salud.smn_series.sri_nombre
from
		smn_salud.smn_series
where
		upper(smn_salud.smn_series.sri_nombre) = upper(${fld:sri_nombre})
