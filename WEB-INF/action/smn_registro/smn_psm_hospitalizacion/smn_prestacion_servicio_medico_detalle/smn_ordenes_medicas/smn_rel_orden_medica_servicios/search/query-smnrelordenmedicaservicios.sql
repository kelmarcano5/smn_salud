select
	smn_salud.smn_rel_orden_medica_servicios.smn_rel_orden_medica_servicios_id,
	smn_salud.smn_rel_orden_medica_servicios.smn_ordenes_medicas_id,
	smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	smn_salud.smn_rel_orden_medica_servicios.ros_observacion,
	smn_base.smn_grupos_prestadores.gpp_descripcion as smn_grupo_prestador_rf,
	smn_base.smn_prestadores_servicios.prs_descripcion as smn_prestador_servicio_referido_rf
from
	smn_salud.smn_rel_orden_medica_servicios
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_rel_orden_medica_servicios.smn_servicios_rf
	left join smn_base.smn_grupos_prestadores on smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id = smn_salud.smn_rel_orden_medica_servicios.smn_grupo_prestador_rf
	left join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_salud.smn_rel_orden_medica_servicios.smn_prestador_servicio_referido_rf
where
	smn_salud.smn_rel_orden_medica_servicios.smn_rel_orden_medica_servicios_id is not null and smn_salud.smn_rel_orden_medica_servicios.smn_ordenes_medicas_id=${fld:id2}