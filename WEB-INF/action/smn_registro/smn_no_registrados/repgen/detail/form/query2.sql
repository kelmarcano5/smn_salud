select
		smn_salud.smn_no_registrados.nfi_num_control,
	smn_salud.smn_no_registrados.nfi_apellidos,
	smn_salud.smn_no_registrados.nfi_nombres,
	smn_salud.smn_no_registrados.nfi_sexo,
	smn_salud.smn_no_registrados.nfi_telefono_fijo,
	smn_salud.smn_no_registrados.nfi_telefono_movil,
	smn_salud.smn_no_registrados.nfi_email,
	smn_salud.smn_no_registrados.nfi_fecha_registro
from
	smn_salud.smn_no_registrados 
where
	smn_salud.smn_no_registrados.smn_no_registrados_id = ${fld:id}
