select
		smn_salud.smn_reposos_constancias.smn_ingreso_id,
	smn_salud.smn_reposos_constancias.smn_auxiliar_rf,
	smn_salud.smn_reposos_constancias.smn_diagnostico_rf,
	smn_salud.smn_reposos_constancias.rpc_fecha_desde,
	smn_salud.smn_reposos_constancias.rpc_fecha_hasta,
	smn_salud.smn_reposos_constancias.rpc_fecha_reintegro,
	smn_salud.smn_reposos_constancias.rpc_motivo,
	smn_salud.smn_reposos_constancias.rpc_observacion,
	smn_salud.smn_reposos_constancias.rpc_fecha_registro
from
	smn_salud.smn_reposos_constancias 
where
	smn_salud.smn_reposos_constancias.smn_reposos_constancias_id = ${fld:id}
