select
	smn_salud.smn_contrato_modulo.smn_contrato_modulo_id,
	case
	when smn_salud.smn_contrato_modulo.ctm_estatus_proceso='RE' then '${lbl:b_registrated}'
	when smn_salud.smn_contrato_modulo.ctm_estatus_proceso='AC' then '${lbl:b_active}'
	when smn_salud.smn_contrato_modulo.ctm_estatus_proceso='SU' then '${lbl:b_suspended}'
	when smn_salud.smn_contrato_modulo.ctm_estatus_proceso='VE' then '${lbl:b_expire}'
	end as ctm_estatus_proceso,
	case
	when smn_salud.smn_contrato_modulo.ctm_estatus_financiero='PE' then '${lbl:b_pending}'
	when smn_salud.smn_contrato_modulo.ctm_estatus_financiero='PA' then '${lbl:b_payed}'
	end as ctm_estatus_financiero,
	smn_base.smn_contrato_base.ctr_codigo ||' - '|| smn_base.smn_contrato_base.ctr_nombre as smn_contrato_base_rf,
	smn_salud.smn_documento.doc_codigo ||' - '|| smn_salud.smn_documento.doc_nombre as smn_documento_id,
	smn_salud.smn_contrato_modulo.ctm_numero_contrato,
	contratante.aux_descripcion as smn_contratante_id,
	smn_salud.smn_planes.pla_codigo ||' - '|| smn_salud.smn_planes.pla_descripcion as smn_planes_id,
	smn_salud.smn_contrato_modulo.ctm_cantidad_afiliados,
	smn_salud.smn_contrato_modulo.ctm_monto_contrato,
	smn_salud.smn_contrato_modulo.ctm_monto_cobertura_afiliado,
	smn_salud.smn_contrato_modulo.ctm_cantidad_citas,
	smn_salud.smn_contrato_modulo.ctm_fecha_registro
	
from
	smn_salud.smn_contrato_modulo
	inner join smn_salud.smn_planes on smn_salud.smn_planes.smn_planes_id = smn_salud.smn_contrato_modulo.smn_planes_id
	inner join smn_base.smn_contrato_base on smn_base.smn_contrato_base.smn_contrato_base_id = smn_salud.smn_contrato_modulo.smn_contrato_base_rf
	inner join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_contrato_modulo.smn_documento_id
	left join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_contratante_id = smn_salud.smn_contrato_modulo.smn_contratante_id
	left join smn_base.smn_auxiliar contratante on contratante.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf
where
	smn_contrato_modulo_id is not null
	${filter}
order by
		smn_contrato_modulo_id
