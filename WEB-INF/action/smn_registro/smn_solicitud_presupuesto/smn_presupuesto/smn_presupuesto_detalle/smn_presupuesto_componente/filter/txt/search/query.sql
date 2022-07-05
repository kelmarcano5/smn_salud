select
		smn_salud.smn_presupuesto_componente.smn_presupuesto_componente_id,
select
		smn_salud.smn_presupuesto_componente.smn_presupuesto_componente_id,
	case
	when smn_salud.smn_presupuesto_componente.smn_tipos_componentes_rf='IT' then '${lbl:b_item}'
	when smn_salud.smn_presupuesto_componente.smn_tipos_componentes_rf='HO' then '${lbl:b_honorary}'
	when smn_salud.smn_presupuesto_componente.smn_tipos_componentes_rf='SE' then '${lbl:b_services}'
	end as smn_tipos_componentes_rf,
select
		smn_salud.smn_presupuesto_componente.smn_presupuesto_componente_id,
select
		smn_salud.smn_presupuesto_componente.smn_presupuesto_componente_id,
select
		smn_salud.smn_presupuesto_componente.smn_presupuesto_componente_id,
	case
	when smn_salud.smn_presupuesto_componente.prc_forma_calculo_rf='RP' then '${lbl:b_price_inv}'
	when smn_salud.smn_presupuesto_componente.prc_forma_calculo_rf='R' then '${lbl:b_price_inv_plus}'
	when smn_salud.smn_presupuesto_componente.prc_forma_calculo_rf='PP' then '${lbl:b_presupuesto_plus}'
	when smn_salud.smn_presupuesto_componente.prc_forma_calculo_rf='PR' then '${lbl:b_presupuesto}'
	when smn_salud.smn_presupuesto_componente.prc_forma_calculo_rf='D' then '${lbl:b_diference}'
	when smn_salud.smn_presupuesto_componente.prc_forma_calculo_rf='M' then '${lbl:b_amount}'
	when smn_salud.smn_presupuesto_componente.prc_forma_calculo_rf='PO' then '${lbl:b_porcentage}'
	end as prc_forma_calculo_rf,
	smn_salud.smn_presupuesto_componente.smn_presupuesto_detalle_id,
	smn_salud.smn_presupuesto_componente.smn_presupuesto_id,
	smn_salud.smn_presupuesto_componente.smn_servicios_rf,
	smn_salud.smn_presupuesto_componente.smn_tipos_componentes_rf,
	smn_salud.smn_presupuesto_componente.smn_componentes_rf,
	smn_salud.smn_presupuesto_componente.smn_grupo_prestador_rf,
	smn_salud.smn_presupuesto_componente.smn_prestadores_servicios_rf,
	smn_salud.smn_presupuesto_componente.prc_forma_calculo_rf,
	smn_salud.smn_presupuesto_componente.prc_cantidad,
	smn_salud.smn_presupuesto_componente.prc_monto_ml,
	smn_salud.smn_presupuesto_componente.prc_monto_ma,
	smn_salud.smn_presupuesto_componente.prc_monto_neto_ml,
	smn_salud.smn_presupuesto_componente.prc_fecha_registro
	
from
	smn_salud.smn_presupuesto_componente
