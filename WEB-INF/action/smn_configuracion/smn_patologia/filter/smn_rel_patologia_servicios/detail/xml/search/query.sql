select
	smn_salud.smn_patologia.smn_patologia_id,
	smn_salud.smn_patologia.pat_codigo as pat_codigo_pl0,
select
select
	smn_salud.smn_rel_patologia_servicios.*
from
	smn_salud.smn_patologia,
	smn_salud.smn_rel_patologia_servicios
where
	smn_salud.smn_patologia.smn_patologia_id=smn_salud.smn_rel_patologia_servicios.smn_patologia_id
	and
	smn_rel_patologia_servicios_id = ${fld:id}
