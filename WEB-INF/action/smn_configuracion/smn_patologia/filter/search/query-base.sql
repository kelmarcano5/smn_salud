select
	case
	when smn_salud.smn_patologia.pat_estatus='AC' then '${lbl:b_active}'
	when smn_salud.smn_patologia.pat_estatus='IN' then '${lbl:b_inactive}'
	end as pat_estatus,
	smn_salud.smn_patologia.pat_codigo,
	smn_salud.smn_patologia.pat_descripcion,
	smn_salud.smn_patologia.pat_fecha_registro,
		smn_salud.smn_patologia.smn_patologia_id
	
from
	smn_salud.smn_patologia
where
	smn_patologia_id is not null
	${filter}
order by
		smn_patologia_id
