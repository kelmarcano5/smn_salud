select
		smn_salud.smn_paciente.smn_clasificacion_paciente_id,
	smn_salud.smn_paciente.smn_clase_auxiliar_rf,
	smn_salud.smn_paciente.smn_auxiliar_rf,
	smn_salud.smn_paciente.smn_clasificacion_abc_rf,
	smn_salud.smn_paciente.smn_sector_economico_rf,
	smn_salud.smn_paciente.pac_nacional_ext,
	smn_salud.smn_paciente.pac_vigencia,
	smn_salud.smn_paciente.pac_estatus,
	smn_salud.smn_paciente.pac_fecha_registro,
	smn_salud.smn_paciente.smn_forma_pago_rf,
	smn_salud.smn_paciente.smn_condicion_financiera_rf,
	smn_salud.smn_paciente.pac_requiere_aut_previa,
	smn_salud.smn_paciente.smn_promotor_rf
from
	smn_salud.smn_paciente 
where
	smn_salud.smn_paciente.smn_paciente_id = ${fld:id}
