select
		smn_salud.smn_series.smn_series_id,
	${field}
from
	smn_salud.smn_series
where
		smn_salud.smn_series.smn_series_id is not null
	${filter}
	
	
