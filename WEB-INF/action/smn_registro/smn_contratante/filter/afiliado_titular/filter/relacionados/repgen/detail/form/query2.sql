select
		smn_salud.smn_relacionados.smn_relacionado_id,
	smn_salud.smn_relacionados.smn_afiliados_id,
	smn_salud.smn_relacionados.smn_documento_id,
	smn_salud.smn_relacionados.rel_numero_control,
	smn_salud.smn_relacionados.smn_clase_rf,
	smn_salud.smn_relacionados.smn_auxiliar_rf,
	smn_salud.smn_relacionados.smn_parentesco_rf,
	smn_salud.smn_relacionados.smn_numero_hijo,
	smn_salud.smn_relacionados.rel_fecha_registro
from
	smn_salud.smn_relacionados 
where
	smn_salud.smn_relacionados.smn_relacionado_id = ${fld:id}
