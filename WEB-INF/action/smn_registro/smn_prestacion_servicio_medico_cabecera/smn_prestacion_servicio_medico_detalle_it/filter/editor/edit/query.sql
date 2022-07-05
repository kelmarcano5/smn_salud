select	
	smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id, 
	smn_salud.smn_prestacion_servicio_medico_cabecera.psc_estatus as psc_estatus_pl0,
	smn_salud.smn_ingresos_mov.smn_ingresos_mov_id, 
	smn_salud.smn_ingresos_mov.inm_localidad as inm_localidad_pl1,
	smn_salud.smn_prestacion_servicio_medico_detalle.*
from
	smn_salud.smn_prestacion_servicio_medico_cabecera,
	smn_salud.smn_ingresos_mov,
	smn_salud.smn_prestacion_servicio_medico_detalle 
where
	smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id=smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id and
	smn_salud.smn_ingresos_mov.smn_ingresos_mov_id=smn_salud.smn_prestacion_servicio_medico_detalle.smn_ingresos_mov_id and
	smn_prestacion_servicio_medico_detalle_id = ${fld:id} 
	

