select
	(select smn_base.smn_servicios.svc_codigo || ' - ' || smn_base.smn_servicios.svc_descripcion from  smn_base.smn_servicios  where smn_base.smn_servicios.smn_servicios_id is not null  and smn_base.smn_servicios.smn_servicios_id=smn_salud.smn_citas_mov.smn_servicios_rf  order by smn_base.smn_servicios.svc_descripcion ) as smn_servicios_rf,
	(select smn_base.smn_prestadores_servicios.prs_codigo || ' - ' || smn_base.smn_prestadores_servicios.prs_descripcion  from  smn_base.smn_prestadores_servicios  where smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id is not null  and smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id=smn_salud.smn_citas_mov.smn_prestador_servicio_rf  order by smn_base.smn_prestadores_servicios.prs_descripcion ) as smn_prestador_servicio_rf,
	(select smn_salud.smn_estatus_citas.eci_num_secuencia || ' - ' || smn_salud.smn_estatus_citas.eci_descripcion from  smn_salud.smn_estatus_citas  where smn_salud.smn_estatus_citas.smn_estatus_citas_id is not null  and smn_salud.smn_estatus_citas.smn_estatus_citas_id=smn_salud.smn_citas_mov.ctm_estatus_id  order by smn_salud.smn_estatus_citas.eci_descripcion ) as ctm_estatus_id,
	smn_salud.smn_citas_mov.ctm_num_control_cita,
	smn_salud.smn_citas_mov.ctm_fecha_cita,
	smn_salud.smn_citas_mov.ctm_turno_cita,
	smn_salud.smn_citas_mov.ctm_fecha_registro,
	smn_salud.smn_citas_mov.smn_citas_mov_id

from 
	smn_salud.smn_citas_mov

	where smn_salud.smn_citas_mov.smn_citas_id = '${fld:id}'
