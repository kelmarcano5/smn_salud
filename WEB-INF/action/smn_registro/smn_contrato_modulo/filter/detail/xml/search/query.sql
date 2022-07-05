select
select
select
select
select
	case
	when smn_salud.smn_contrato_modulo.smn_descuento_rf='SI' then '${lbl:b_yes}'
	when smn_salud.smn_contrato_modulo.smn_descuento_rf='No' then '${lbl:b_not}'
	end as smn_descuento_rf,
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
	smn_salud.smn_contrato_modulo.*
from
	smn_salud.smn_contrato_modulo
where
	smn_contrato_modulo_id = ${fld:id}
