select
	smn_salud.smn_cobertura_admision.smn_cobertura_admision_id,
	case
	when smn_salud.smn_cobertura_admision.coa_estatus_proceso='RE' then '${lbl:b_registrada}'
	when smn_salud.smn_cobertura_admision.coa_estatus_proceso='SO' then '${lbl:b_solicitada}'
	when smn_salud.smn_cobertura_admision.coa_estatus_proceso='AP' then '${lbl:b_aprobado}'
	end as coa_estatus_proceso,
	case
	when smn_salud.smn_cobertura_admision.coa_estatus_financiero='PE' then '${lbl:b_pending}'
	when smn_salud.smn_cobertura_admision.coa_estatus_financiero='SO' then '${lbl:b_solicitada}'
	when smn_salud.smn_cobertura_admision.coa_estatus_financiero='AP' then '${lbl:b_aprobado}'
	end as coa_estatus_financiero,
	smn_salud.smn_cobertura_admision.smn_ingreso_id,
	smn_salud.smn_cobertura_admision.smn_presupuesto_id,
	aux.aux_descripcion as smn_auxiliar_rf,
	smn_salud.smn_cobertura_admision.coa_hora_solicitada,
	smn_salud.smn_cobertura_admision.coa_ejecutivo_atencion_pagador,
	smn_salud.smn_cobertura_admision.coa_observacion_inicial,
	smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_salud.smn_cobertura_admision.smn_tasa_rf,
	smn_salud.smn_cobertura_admision.coa_monto_aprobado_servicios_medicos_ml,
	smn_salud.smn_cobertura_admision.coa_monto_aprobado_medicinas_y_mmq_ml,
	smn_salud.smn_cobertura_admision.coa_monto_aprobado_honorarios_ml,
	smn_salud.smn_cobertura_admision.coa_monto_total_aprobado_ml,
	smn_salud.smn_cobertura_admision.coa_monto_aprobado_servicios_medicos_ma,
	smn_salud.smn_cobertura_admision.coa_monto_aprobado_medicinas_y_mmq_ma,
	smn_salud.smn_cobertura_admision.coa_monto_aprobado_honorarios_ma,
	smn_salud.smn_cobertura_admision.coa_monto_total_aprobado_ma,
	smn_salud.smn_cobertura_admision.coa_fecha_registro
	
from
	smn_salud.smn_cobertura_admision
	inner join smn_base.smn_auxiliar aux on aux.smn_auxiliar_id = smn_salud.smn_cobertura_admision.smn_auxiliar_rf
	left join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_salud.smn_cobertura_admision.smn_moneda_rf
	left join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_salud.smn_cobertura_admision.smn_tasa_rf
	
where
	smn_cobertura_admision_id is not null
	${filter}
order by
		smn_cobertura_admision_id
