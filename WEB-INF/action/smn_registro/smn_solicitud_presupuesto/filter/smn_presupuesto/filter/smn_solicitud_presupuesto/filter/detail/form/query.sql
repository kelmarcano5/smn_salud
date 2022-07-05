select
	smn_salud.smn_solicitud_presupuesto.smn_solicitud_presupuesto_id,
	case
	when smn_salud.smn_solicitud_presupuesto.spr_estatus='SO' then '${lbl:b_solicitado}'
	when smn_salud.smn_solicitud_presupuesto.spr_estatus='GE' then '${lbl:b_generado}'
	when smn_salud.smn_solicitud_presupuesto.spr_estatus='AP' then '${lbl:b_aprobado}'
	when smn_salud.smn_solicitud_presupuesto.spr_estatus='EN' then '${lbl:b_enviado}'
	end as spr_estatus,
	smn_salud.smn_solicitud_presupuesto.spr_solicitud,
	smn_base.smn_auxiliar.aux_codigo||''|| smn_base.smn_auxiliar.aux_descripcion as smn_auxiliar,
	contra.aux_codigo ||' - '|| contra.aux_descripcion as smn_contratante_id,
	smn_salud.smn_patologia.pat_codigo ||' - '|| smn_salud.smn_patologia.pat_descripcion as smn_patologia_id,
	smn_salud.smn_solicitud_presupuesto.spr_dias_hospitalizacion,
	smn_salud.smn_solicitud_presupuesto.spr_horas_quirofano,
	smn_salud.smn_solicitud_presupuesto.spr_instrumentales,
	smn_salud.smn_solicitud_presupuesto.spr_honorarios,
	smn_salud.smn_solicitud_presupuesto.spr_fecha_registro
	
from
	smn_salud.smn_solicitud_presupuesto
	inner join smn_salud.smn_patologia on smn_salud.smn_patologia.smn_patologia_id = smn_salud.smn_solicitud_presupuesto.smn_patologia_id
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_solicitud_presupuesto.smn_auxiliar
	left join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_contratante_id = smn_salud.smn_solicitud_presupuesto.smn_contratante_id
	inner join smn_base.smn_auxiliar contra on contra.smn_auxiliar_id = smn_salud.smn_solicitud_presupuesto.smn_auxiliar
where
	smn_solicitud_presupuesto_id = ${fld:id}
