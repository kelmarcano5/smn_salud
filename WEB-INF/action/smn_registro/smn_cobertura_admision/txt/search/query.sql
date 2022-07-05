select
	smn_base.smn_auxiliar.aux_descripcion,
		smn_salud.smn_cobertura_admision.smn_cobertura_admision_id,
select
		smn_salud.smn_cobertura_admision.smn_cobertura_admision_id,
select
		smn_salud.smn_cobertura_admision.smn_cobertura_admision_id,
select
		smn_salud.smn_cobertura_admision.smn_cobertura_admision_id,
select
		smn_salud.smn_cobertura_admision.smn_cobertura_admision_id,
	case
	when smn_salud.smn_cobertura_admision.coa_estatus_proceso='RE' then '${lbl:b_registrada}'
	when smn_salud.smn_cobertura_admision.coa_estatus_proceso='SO' then '${lbl:b_solicitada}'
	when smn_salud.smn_cobertura_admision.coa_estatus_proceso='AP' then '${lbl:b_aprobado}'
	end as coa_estatus_proceso,
	case
	when smn_salud.smn_cobertura_admision.coa_estatus_financiero='RE' then '${lbl:b_registrada}'
	when smn_salud.smn_cobertura_admision.coa_estatus_financiero='SO' then '${lbl:b_solicitada}'
	when smn_salud.smn_cobertura_admision.coa_estatus_financiero='AP' then '${lbl:b_aprobado}'
	end as coa_estatus_financiero,
	smn_salud.smn_cobertura_admision.smn_ingreso_id,
	smn_salud.smn_cobertura_admision.smn_presupuesto_id,
	smn_salud.smn_cobertura_admision.smn_auxiliar_rf,
	smn_salud.smn_cobertura_admision.coa_hora_solicitada,
	smn_salud.smn_cobertura_admision.coa_ejecutivo_atención_pagador,
	smn_salud.smn_cobertura_admision.coa_observación_inicial,
	smn_salud.smn_cobertura_admision.smn_moneda_rf,
	smn_salud.smn_cobertura_admision.smn_tasa_rf,
	smn_salud.smn_cobertura_admision.coa_monto_aprobado_servicios_medicos_ml,
	smn_salud.smn_cobertura_admision.coa_monto_aprobado_medicinas_y_mmq_ml,
	smn_salud.smn_cobertura_admision.coa_monto_aprobado_honorarios_ml,
	smn_salud.smn_cobertura_admision.coa_monto_total_aprobado_ml,
	smn_salud.smn_cobertura_admision.coa_monto_aprobado_servicios_medicos_ma,
	smn_salud.smn_cobertura_admision.coa_monto_aprobado_medicinas_y_mmq_ma,
	smn_salud.smn_cobertura_admision.coa_monto_aprobado_honorarios_ma,
	smn_salud.smn_cobertura_admision.coa_monto_total_aprobado_ma,
	smn_salud.smn_cobertura_admision.coa_estatus_proceso,
	smn_salud.smn_cobertura_admision.coa_estatus_financiero,
	smn_salud.smn_cobertura_admision.coa_fecha_registro
	
from
	smn_salud.smn_cobertura_admision
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_cobertura_admision.coa_ejecutivo_atención_pagador
