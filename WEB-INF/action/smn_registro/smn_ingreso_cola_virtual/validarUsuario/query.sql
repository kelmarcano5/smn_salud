select coalesce((select icv_numero_documento_identidad
from
   smn_salud.smn_ingreso_cola_virtual
where upper(icv_numero_documento_identidad) = upper(${fld:id}) 
limit 1), '') as cedula, coalesce((select icv_numero_ticket
from
   smn_salud.smn_ingreso_cola_virtual
where upper(icv_numero_documento_identidad) = upper(${fld:id})
limit 1), 0) as ticket, ${fld:id} as ced


