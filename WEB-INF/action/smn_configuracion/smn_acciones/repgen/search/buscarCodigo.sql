select
		smn_salud.smn_acciones.acc_codigo
from
		smn_salud.smn_acciones
where
		upper(smn_salud.smn_acciones.acc_codigo) = upper(${fld:acc_codigo})
