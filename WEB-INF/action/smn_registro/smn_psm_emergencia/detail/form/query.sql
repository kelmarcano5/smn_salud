select
		smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id,
	case
	when smn_salud.smn_prestacion_servicio_medico_cabecera.psc_estatus='PE' then '${lbl:b_pending}'
	when smn_salud.smn_prestacion_servicio_medico_cabecera.psc_estatus='EA' then '${lbl:b_in_atention}'
	when smn_salud.smn_prestacion_servicio_medico_cabecera.psc_estatus='AT' then '${lbl:b_atending}'
	end as psc_estatus,
	smn_salud.smn_ingresos.smn_ingresos_id ||' - '|| smn_salud.smn_ingresos.smn_documento_id as smn_ingresos_id,
	smn_salud.smn_prestacion_servicio_medico_cabecera.smn_mov_caja_cabecera_id,
	smn_base.smn_unidades_servicios.uns_codigo ||' - '||smn_base.smn_unidades_servicios.uns_descripcion as smn_unidades_servicios_rf,
	smn_salud.smn_prestacion_servicio_medico_cabecera.psc_fecha_registro
	
from
	smn_salud.smn_prestacion_servicio_medico_cabecera
	inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_prestacion_servicio_medico_cabecera.smn_ingresos_id
	inner join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_salud.smn_prestacion_servicio_medico_cabecera.smn_unidades_servicios_rf
where
	smn_salud.smn_ingresos.smn_ingresos_id=smn_salud.smn_prestacion_servicio_medico_cabecera.smn_ingresos_id

 and 
	smn_prestacion_servicio_medico_cabecera_id = ${fld:id}
