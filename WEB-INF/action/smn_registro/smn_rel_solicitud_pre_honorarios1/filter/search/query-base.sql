select	
	(select smn_base.smn_servicios.svc_descripcion from  smn_base.smn_servicios  where smn_base.smn_servicios.smn_servicios_id is not null  and smn_base.smn_servicios.smn_servicios_id=smn_salud.smn_rel_solicitud_pre_honorarios.smn_servicios_rf  order by smn_base.smn_servicios.svc_descripcion ) as smn_servicios_rf_combo,
	(select smn_base.smn_componentes.cmp_codigo ||' - '|| smn_base.smn_componentes.cmp_descripcion from  smn_base.smn_componentes where smn_base.smn_componentes.smn_componentes_id is not null  and smn_base.smn_componentes.smn_componentes_id=smn_salud.smn_rel_solicitud_pre_honorarios.smn_componentes_rf) as smn_componentes_rf_combo,
	(select smn_base.smn_grupos_prestadores.gpp_codigo || ' - ' || smn_base.smn_grupos_prestadores.gpp_descripcion from  smn_base.smn_grupos_prestadores  where smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id is not null  and smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id=smn_salud.smn_rel_solicitud_pre_honorarios.smn_grupo_prestador_servicio_rf  order by smn_base.smn_grupos_prestadores.gpp_descripcion ) as smn_grupo_prestador_servicio_rf_combo,
	(select smn_base.smn_prestadores_servicios.prs_codigo || ' - ' || smn_base.smn_prestadores_servicios.prs_descripcion from  smn_base.smn_prestadores_servicios  where smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id is not null  and smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id=smn_salud.smn_rel_solicitud_pre_honorarios.smn_prestador_serviciorf  order by smn_base.smn_prestadores_servicios.prs_descripcion ) as smn_prestador_serviciorf_combo,
	(select smn_base.smn_tasas_de_cambio.tca_tasa_cambio from  smn_base.smn_tasas_de_cambio where smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id is not null  and smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id=smn_salud.smn_rel_solicitud_pre_honorarios.smn_tasa_id) as smn_tasa_id_combo,
	(select smn_base.smn_monedas.mon_codigo|| ' - ' || smn_base.smn_monedas.mon_nombre from  smn_base.smn_monedas where smn_base.smn_monedas.smn_monedas_id is not null  and smn_base.smn_monedas.smn_monedas_id=smn_salud.smn_rel_solicitud_pre_honorarios.smn_moneda_id) as smn_moneda_id_combo,
	smn_salud.smn_rel_solicitud_pre_honorarios.smn_solicitud_presupuesto_id,
	smn_salud.smn_rel_solicitud_pre_honorarios.smn_servicios_rf,
	smn_salud.smn_rel_solicitud_pre_honorarios.smn_componentes_rf,
	smn_salud.smn_rel_solicitud_pre_honorarios.smn_grupo_prestador_servicio_rf,
	smn_salud.smn_rel_solicitud_pre_honorarios.smn_prestador_serviciorf,
	smn_salud.smn_rel_solicitud_pre_honorarios.rsh_monto_solicitado_ml,
	smn_salud.smn_rel_solicitud_pre_honorarios.rsh_monto_solicitado_ma,
	smn_salud.smn_rel_solicitud_pre_honorarios.smn_tasa_id,
	smn_salud.smn_rel_solicitud_pre_honorarios.smn_moneda_id,
	smn_salud.smn_rel_solicitud_pre_honorarios.rsh_fecha_registro,
	smn_salud.smn_rel_solicitud_pre_honorarios.smn_rel_solicitud_pre_honorarios_id

from
	smn_salud.smn_rel_solicitud_pre_honorarios
where
	smn_rel_solicitud_pre_honorarios_id is not null	
 	 	${filter}
order by 
	smn_rel_solicitud_pre_honorarios_id