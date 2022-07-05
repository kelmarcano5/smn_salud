select
	smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id,
	case
	when smn_salud.smn_ordenes_medicas.omd_tipo_orden='UG' then '${lbl:b_urgente}'
	when smn_salud.smn_ordenes_medicas.omd_tipo_orden='NR' then '${lbl:b_normal}'
	end as omd_tipo_orden,
	smn_salud.smn_ordenes_medicas.smn_ingreso_id,
	smn_salud.smn_ordenes_medicas.omd_numero_orden,
	smn_salud.smn_ordenes_medicas.omd_descripcion,
	smn_base.smn_prestadores_servicios.prs_codigo ||' - '|| smn_base.smn_prestadores_servicios.prs_descripcion as smn_prestador_servicio_rf,
	smn_base.smn_clase_auxiliar.cla_codigo||' - '|| smn_base.smn_clase_auxiliar.cla_nombre as omd_clase_auxiliar,
	smn_base.smn_v_auxiliar.smn_codigo ||' - '||smn_base.smn_v_auxiliar.smn_item as omd_auxiliar,
	smn_salud.smn_ordenes_medicas.omd_indicaciones,
	case
		when smn_salud.smn_ordenes_medicas.omd_estatus='EM' then 'Emitido'
		when smn_salud.smn_ordenes_medicas.omd_estatus='PR' then 'Presupuestado'
	end as omd_estatus,
	smn_salud.smn_ordenes_medicas.omd_fecha_registro,
	smn_base.smn_servicios.svc_codigo ||' - '|| smn_base.smn_servicios.svc_descripcion as smn_servicios_rf
from
	smn_salud.smn_ordenes_medicas
	inner join smn_base.smn_v_auxiliar on smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_salud.smn_ordenes_medicas.omd_auxiliar
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_ordenes_medicas.omd_clase_auxiliar
	left join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_salud.smn_ordenes_medicas.smn_prestador_servicio_rf
	inner join smn_salud.smn_rel_orden_medica_servicios on smn_salud.smn_rel_orden_medica_servicios.smn_ordenes_medicas_id = smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_rel_orden_medica_servicios.smn_servicios_rf
--where
	 --smn_salud.smn_recipe_medico.smn_prestacion_servicio_medico_id = ${fld:id2}