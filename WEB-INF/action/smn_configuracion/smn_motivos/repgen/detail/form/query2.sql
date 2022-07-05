select
		smn_salud.smn_motivos.mtv_codigo,
	smn_salud.smn_motivos.mtv_descripcion,
	smn_salud.smn_motivos.mtv_fecha_registro
from
	smn_salud.smn_motivos 
where
	smn_salud.smn_motivos.smn_motivos_id = ${fld:id}
