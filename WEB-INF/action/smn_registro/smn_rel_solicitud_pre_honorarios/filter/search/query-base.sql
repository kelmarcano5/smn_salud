select
select
select
select
select
select
select
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