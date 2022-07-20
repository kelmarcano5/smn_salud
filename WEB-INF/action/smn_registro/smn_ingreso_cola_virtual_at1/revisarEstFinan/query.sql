select smn_salud.smn_ingreso_cola_virtual.icv_numero_documento_identidad as cedula, smn_salud.smn_ingreso_cola_virtual.ivc_estatus_financiero as status
from
   smn_salud.smn_ingreso_cola_virtual
where upper(icv_numero_documento_identidad) = upper(${fld:cedula})