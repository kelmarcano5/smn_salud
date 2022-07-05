select	
	(select smn_base.smn_servicios.svc_codigo || ' - ' || smn_base.smn_servicios.svc_descripcion from  smn_base.smn_servicios  where smn_base.smn_servicios.smn_servicios_id is not null  and smn_base.smn_servicios.smn_servicios_id=smn_salud.smn_citas_mov.ctm_servicio  order by smn_base.smn_servicios.svc_descripcion ) as ctm_servicio_combo,
	(select smn_salud.smn_estatus_citas.eci_num_secuencia || ' - ' || smn_salud.smn_estatus_citas.eci_descripcion from  smn_salud.smn_estatus_citas  where smn_salud.smn_estatus_citas.smn_estatus_citas_id is not null  and smn_salud.smn_estatus_citas.smn_estatus_citas_id=smn_salud.smn_citas_mov.ctm_estatus  order by smn_salud.smn_estatus_citas.eci_descripcion ) as ctm_estatus_combo,
	(select smn_base.smn_prestadores_servicios.prs_codigo || ' - ' || smn_base.smn_prestadores_servicios.prs_nombres  || '  ' || smn_base.smn_prestadores_servicios.prs_apellidos from  smn_base.smn_prestadores_servicios  where smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id is not null  and smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id=smn_salud.smn_citas_mov.ctm_prestador_servicio  order by smn_base.smn_prestadores_servicios.prs_nombres ) as ctm_prestador_servicio_combo,
	smn_salud.smn_citas_mov.ctm_servicio,
	smn_salud.smn_citas_mov.ctm_localidad,
	smn_salud.smn_citas_mov.ctm_fecha,
	smn_salud.smn_citas_mov.ctm_num_control_cita,
	smn_salud.smn_citas_mov.ctm_fecha_registro,
	smn_salud.smn_citas_mov.ctm_estatus,
	smn_salud.smn_citas_mov.ctm_prestador_servicio,
	smn_salud.smn_citas_mov.smn_citas_mov_id

from
	smn_salud.smn_citas_mov
where
	smn_citas_mov_id is not null	
 	 	${filter}
order by 
	smn_citas_mov_id