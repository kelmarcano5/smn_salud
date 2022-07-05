select
		smn_salud.smn_sector.sec_codigo
from
		smn_salud.smn_sector
where
		upper(smn_salud.smn_sector.sec_codigo) = upper(${fld:sec_codigo})
