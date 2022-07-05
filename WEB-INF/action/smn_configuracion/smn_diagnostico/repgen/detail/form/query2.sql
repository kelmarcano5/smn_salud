select
		smn_salud.smn_diagnostico.dgn_codigo,
	smn_salud.smn_diagnostico.dgn_descripcion,
	smn_salud.smn_diagnostico.dgn_fecha_registro,
	smn_salud.smn_diagnostico.dgn_tipo
from
	smn_salud.smn_diagnostico 
where
	smn_salud.smn_diagnostico.smn_diagnostico_id = ${fld:id}
