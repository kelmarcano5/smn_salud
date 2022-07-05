select
	smn_salud.smn_ruta_paciente.*
from
	smn_salud.smn_ruta_paciente
where
	smn_ruta_id = ${fld:id}
