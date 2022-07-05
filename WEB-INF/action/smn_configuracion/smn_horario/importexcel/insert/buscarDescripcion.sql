select
		smn_salud.smn_horario.hor_descripcion
from
		smn_salud.smn_horario
where
		upper(smn_salud.smn_horario.hor_descripcion) = upper(${fld:hor_descripcion})
