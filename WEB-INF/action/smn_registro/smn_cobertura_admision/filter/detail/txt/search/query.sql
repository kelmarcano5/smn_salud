select
select
select
select
select
	smn_base.smn_auxiliar.aux_descripcion,
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
	smn_salud.smn_cobertura_admision.*
from
	smn_salud.smn_cobertura_admision
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_cobertura_admision.coa_ejecutivo_atención_pagador
where
	smn_cobertura_admision_id = ${fld:id}
