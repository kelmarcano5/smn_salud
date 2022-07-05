select
		smn_salud.smn_horario.hor_codigo
from
		smn_salud.smn_horario
where
		upper(smn_salud.smn_horario.hor_codigo) = upper(${fld:hor_codigo})
