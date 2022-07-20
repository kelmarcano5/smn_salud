select ${fld:id} as cedula, coalesce((select smn_salud.smn_documento.smn_documento_id 
from smn_salud.smn_documento
 inner join smn_salud.smn_tipo_documento
 on smn_salud.smn_documento.smn_tipo_documento_id = smn_salud.smn_tipo_documento.smn_tipo_documento_id
 where smn_salud.smn_documento.smn_documento_id = (select smn_salud.smn_ingreso_cola_virtual.smn_documento_id
         from smn_salud.smn_ingreso_cola_virtual 
         where upper(icv_numero_documento_identidad) = upper(${fld:id}))), 0) as docId, coalesce((select smn_salud.smn_tipo_documento.tdc_codigo 
from smn_salud.smn_documento
 inner join smn_salud.smn_tipo_documento
 on smn_salud.smn_documento.smn_tipo_documento_id = smn_salud.smn_tipo_documento.smn_tipo_documento_id
 where smn_salud.smn_documento.smn_documento_id = (select smn_salud.smn_ingreso_cola_virtual.smn_documento_id
         from smn_salud.smn_ingreso_cola_virtual 
         where upper(icv_numero_documento_identidad) = upper(${fld:id}))), '') as codigo