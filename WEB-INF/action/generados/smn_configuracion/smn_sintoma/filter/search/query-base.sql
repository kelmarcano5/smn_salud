select	
	smn_salud.smn_sintoma.stm_codigo,
	smn_salud.smn_sintoma.stm_descripcion,
	smn_salud.smn_sintoma.stm_idioma,
	smn_salud.smn_sintoma.stm_usuario,
	smn_salud.smn_sintoma.stm_fecha_registro,
	smn_salud.smn_sintoma.stm_hora,
	smn_salud.smn_sintoma.smn_sintoma_id

from
	smn_salud.smn_sintoma
where
	smn_sintoma_id is not null	
 	 	${filter}
order by 
	smn_sintoma_id