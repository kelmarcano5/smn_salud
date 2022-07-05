select
		smn_salud.smn_estado_presupuesto.epr_codigo
from
		smn_salud.smn_estado_presupuesto
where
		upper(smn_salud.smn_estado_presupuesto.epr_codigo) = upper(${fld:epr_codigo})
