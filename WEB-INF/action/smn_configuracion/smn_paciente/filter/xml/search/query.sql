select
		smn_salud.smn_paciente.smn_paciente_id,
select
		smn_salud.smn_paciente.smn_paciente_id,
select
		smn_salud.smn_paciente.smn_paciente_id,
select
		smn_salud.smn_paciente.smn_paciente_id,
select
		smn_salud.smn_paciente.smn_paciente_id,
select
		smn_salud.smn_paciente.smn_paciente_id,
	case
	when smn_salud.smn_paciente.pac_nacional_ext='N' then '${lbl:b_nacional}'
	when smn_salud.smn_paciente.pac_nacional_ext='E' then '${lbl:b_extranjero}'
	end as pac_nacional_ext,
select
		smn_salud.smn_paciente.smn_paciente_id,
select
		smn_salud.smn_paciente.smn_paciente_id,
	case
	when smn_salud.smn_paciente.pac_estatus='AC' then '${lbl:b_account_type_active}'
	when smn_salud.smn_paciente.pac_estatus='IN' then '${lbl:b_inactive}'
	end as pac_estatus,
	smn_salud.smn_paciente.smn_clasificacion_paciente_id,
	smn_salud.smn_paciente.smn_clase_auxiliar_rf,
	smn_salud.smn_paciente.smn_auxiliar_rf,
	smn_salud.smn_paciente.smn_clasificacion_abc_rf,
	smn_salud.smn_paciente.smn_sector_economico_rf,
	smn_salud.smn_paciente.pac_nacional_ext,
	smn_salud.smn_paciente.smn_promotor_rf,
	smn_salud.smn_paciente.smn_forma_pago_rf,
	smn_salud.smn_paciente.pac_vigencia,
	smn_salud.smn_paciente.pac_estatus,
	smn_salud.smn_paciente.pac_fecha_registro
	
from
	smn_salud.smn_paciente
