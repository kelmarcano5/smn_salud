
select
	smn_salud.smn_tramos_descanso.*,
	(select smn_salud.smn_tramos.trm_codigo|| ' - ' || smn_salud.smn_tramos.trm_descripcion from  smn_salud.smn_tramos where smn_salud.smn_tramos.smn_tramos_id is not null  and smn_salud.smn_tramos.smn_tramos_id=smn_salud.smn_tramos_descanso.smn_tramos_id) as smn_tramos_id_combo
	
from
	smn_salud.smn_tramos_descanso
where
	smn_tramo_descanso_id = ${fld:id}
