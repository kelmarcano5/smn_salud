select
		smn_salud.smn_sintoma.stm_codigo,
	smn_salud.smn_sintoma.stm_descripcion,
	smn_salud.smn_sintoma.stm_fecha_registro
from 
	smn_salud.smn_sintoma
order by 
	smn_salud.smn_sintoma.smn_sintoma_id
