select
	smn_salud.smn_motivos.mtv_codigo,
	smn_salud.smn_motivos.mtv_descripcion,
	smn_salud.smn_motivos.mtv_idioma,
	smn_salud.smn_motivos.mtv_usuario,
	smn_salud.smn_motivos.mtv_fecha_registro,
	smn_salud.smn_motivos.mtv_hora,
		smn_salud.smn_motivos.smn_motivos_id
	
from
	smn_salud.smn_motivos
where
	smn_motivos_id is not null
	${filter}
order by
		smn_motivos_id
