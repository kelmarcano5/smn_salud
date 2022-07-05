select
	smn_salud.smn_paciente.smn_paciente_id,
	case
	when smn_salud.smn_paciente.pac_estatus='AC' then '${lbl:b_account_type_active}'
	when smn_salud.smn_paciente.pac_estatus='IN' then '${lbl:b_inactive}'
	end as pac_estatus,
	smn_salud.smn_paciente.smn_clase_auxiliar_rf,
	smn_salud.smn_paciente.smn_auxiliar_rf,
	smn_salud.smn_paciente.smn_clasificacion_abc_rf,
	smn_salud.smn_paciente.smn_promotor_rf,
	smn_salud.smn_paciente.smn_forma_pago_rf,
	smn_salud.smn_paciente.pac_vigencia,
	smn_salud.smn_paciente.pac_estatus,
	smn_salud.smn_paciente.pac_fecha_registro
	
from
	smn_salud.smn_paciente
where
	smn_paciente_id is not null
	${filter}
order by
		smn_paciente_id
