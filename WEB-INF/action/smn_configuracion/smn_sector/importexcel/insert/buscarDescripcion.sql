select
		smn_salud.smn_sector.sec_descripcion
from
		smn_salud.smn_sector
where
		upper(smn_salud.smn_sector.sec_descripcion) = upper(${fld:sec_descripcion})
