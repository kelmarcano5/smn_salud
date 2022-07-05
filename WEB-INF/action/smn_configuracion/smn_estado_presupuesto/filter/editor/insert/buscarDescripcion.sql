select
		smn_salud.smn_estado_presupuesto.epr_descripcion
from
		smn_salud.smn_estado_presupuesto
where
		upper(smn_salud.smn_estado_presupuesto.epr_descripcion) = upper(${fld:epr_descripcion})
