select
		smn_salud.smn_contrato_modulo.smn_contrato_modulo_id,
select
		smn_salud.smn_contrato_modulo.smn_contrato_modulo_id,
select
		smn_salud.smn_contrato_modulo.smn_contrato_modulo_id,
select
		smn_salud.smn_contrato_modulo.smn_contrato_modulo_id,
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
	smn_salud.smn_contrato_modulo.smn_contrato_base_rf,
	smn_salud.smn_contrato_modulo.smn_documento_id,
	smn_salud.smn_contrato_modulo.ctm_numero_contrato,
	smn_salud.smn_contrato_modulo.smn_contratante_id,
	smn_salud.smn_contrato_modulo.smn_planes_id,
	smn_salud.smn_contrato_modulo.ctm_cantidad_afiliados,
	smn_salud.smn_contrato_modulo.ctm_monto_contrato,
	smn_salud.smn_contrato_modulo.ctm_monto_cobertura_afiliado,
	smn_salud.smn_contrato_modulo.ctm_cantidad_citas,
	smn_salud.smn_contrato_modulo.ctm_estatus_proceso,
	smn_salud.smn_contrato_modulo.ctm_estatus_financiero,
	smn_salud.smn_contrato_modulo.ctm_fecha_registro
	
from
	smn_salud.smn_contrato_modulo
