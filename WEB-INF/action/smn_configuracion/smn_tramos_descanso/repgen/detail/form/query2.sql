select
		smn_salud.smn_tramos_descanso.smn_tramo_descanso_id,
	smn_salud.smn_tramos_descanso.smn_tramos_id,
	smn_salud.smn_tramos_descanso.trd_fecha_registro
from
	smn_salud.smn_tramos_descanso 
where
	smn_salud.smn_tramos_descanso.smn_tramo_descanso_id = ${fld:id}
