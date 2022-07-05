select
		smn_salud.smn_acciones.acc_descripcion
from
		smn_salud.smn_acciones
where
		upper(smn_salud.smn_acciones.acc_descripcion) = upper(${fld:acc_descripcion})
