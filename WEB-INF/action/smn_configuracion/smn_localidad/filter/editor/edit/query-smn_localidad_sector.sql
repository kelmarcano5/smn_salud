select
	smn_salud.smn_localidad_sector.*,
	smn_salud.smn_sector.*
from 
	smn_salud.smn_localidad_sector,
	smn_salud.smn_sector
where 
	smn_salud.smn_localidad_sector.smn_localidad_id = ${fld:id} and
	smn_salud.smn_localidad_sector.smn_sector_id = smn_salud.smn_sector.smn_sector_id