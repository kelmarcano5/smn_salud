select
	smn_salud.smn_ingreso_movimiento.*,
	(select smn_base.smn_servicios.svc_codigo || ' - ' || smn_base.smn_servicios.svc_descripcion from  smn_base.smn_servicios  where smn_base.smn_servicios.smn_servicios_id is not null  and smn_base.smn_servicios.smn_servicios_id=smn_salud.smn_ingreso_movimiento.smn_servicios_rf  order by smn_base.smn_servicios.svc_descripcion ) as smn_servicios_rf_combo,
	(select smn_base.smn_componentes.cmp_codigo || ' - ' || smn_base.smn_componentes.cmp_descripcion from  smn_base.smn_componentes  where smn_base.smn_componentes.smn_componentes_id is not null  and smn_base.smn_componentes.smn_componentes_id=smn_salud.smn_ingreso_movimiento.smn_componente_rf  order by smn_base.smn_componentes.cmp_descripcion ) as smn_componente_rf_combo,
	(select smn_salud.smn_tipo_consulta.tcs_codigo || ' - ' || smn_salud.smn_tipo_consulta.tcs_nombre from  smn_salud.smn_tipo_consulta  where smn_salud.smn_tipo_consulta.smn_tipo_consulta_id is not null  and smn_salud.smn_tipo_consulta.smn_tipo_consulta_id=smn_salud.smn_ingreso_movimiento.smn_tipo_consulta_rf  order by smn_salud.smn_tipo_consulta.tcs_nombre ) as smn_tipo_consulta_rf_combo,
	(select smn_base.smn_grupos_prestadores.gpp_codigo || ' - ' || smn_base.smn_grupos_prestadores.gpp_descripcion from  smn_base.smn_grupos_prestadores  where smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id is not null  and smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id=smn_salud.smn_ingreso_movimiento.smn_grupo_prestador_servicio_rf  order by smn_base.smn_grupos_prestadores.gpp_descripcion ) as smn_grupo_prestador_servicio_rf_combo,
	(select smn_base.smn_prestadores_servicios.prs_codigo || ' - ' || smn_base.smn_prestadores_servicios.prs_descripcion  from  smn_base.smn_prestadores_servicios  where smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id is not null  and smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id=smn_salud.smn_ingreso_movimiento.smn_prestador_servicio_rf  order by smn_base.smn_prestadores_servicios.prs_descripcion ) as smn_prestador_servicio_rf_combo,
	(select smn_base.smn_clase_auxiliar.cla_codigo|| ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from smn_base.smn_clase_auxiliar where smn_base.smn_clase_auxiliar.cla_codigo = 'MD') as smn_clase_auxiliar_rf,
	(select smn_salud.smn_motivos.mtv_codigo || ' - ' || smn_salud.smn_motivos.mtv_descripcion from  smn_salud.smn_motivos  where smn_salud.smn_motivos.smn_motivos_id is not null  and smn_salud.smn_motivos.smn_motivos_id=smn_salud.smn_ingreso_movimiento.smn_motivos_id  order by smn_salud.smn_motivos.mtv_descripcion ) as smn_motivos_id_combo,
	(select smn_salud.smn_sintoma.stm_codigo || ' - ' || smn_salud.smn_sintoma.stm_descripcion from  smn_salud.smn_sintoma  where smn_salud.smn_sintoma.smn_sintoma_id is not null  and smn_salud.smn_sintoma.smn_sintoma_id=smn_salud.smn_ingreso_movimiento.smn_sintoma_id  order by smn_salud.smn_sintoma.stm_descripcion ) as smn_sintoma_id_combo,
	case
		when smn_salud.smn_ingreso_movimiento.inm_estatus ='AC' then 'Activo'
		when smn_salud.smn_ingreso_movimiento.inm_estatus ='IN' then 'Inactivo'
	end as inm_estatus_combo,
	case
	when smn_salud.smn_ingreso_movimiento.inm_tipo_orden='UR' then '${lbl:b_Urgente}'
	when smn_salud.smn_ingreso_movimiento.inm_tipo_orden='CO' then '${lbl:b_control}'
	when smn_salud.smn_ingreso_movimiento.inm_tipo_orden='SE' then '${lbl:b_segunda_opinion}'
	end as inm_tipo_orden_combo

from
	smn_salud.smn_ingreso_movimiento
