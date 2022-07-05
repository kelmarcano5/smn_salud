select
	case
		when smn_salud.smn_paciente.pac_estatus='AC' then '${lbl:b_account_type_active}'
		when smn_salud.smn_paciente.pac_estatus='IN' then '${lbl:b_inactive}'
	end as pac_estatus,
	smn_salud.smn_paciente.*
from
	smn_salud.smn_paciente
where
	smn_paciente_id = ${fld:id}
