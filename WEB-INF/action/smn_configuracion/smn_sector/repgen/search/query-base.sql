select
		smn_salud.smn_sector.smn_sector_id,
	${field}
from
	smn_salud.smn_sector
where
		smn_salud.smn_sector.smn_sector_id is not null
	${filter}
	
	
