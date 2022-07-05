select
	smn_salud.smn_rel_plan_contrato.*,
	smn_salud.smn_contrato_modulo.*
from 
	smn_salud.smn_rel_plan_contrato,
	smn_salud.smn_contrato_modulo
where 
	smn_salud.smn_rel_plan_contrato.smn_planes_id = ${fld:id} and
	smn_salud.smn_rel_plan_contrato.smn_contrato_modulo_id = smn_salud.smn_contrato_modulo.smn_contrato_modulo_id