select
	smn_caja.smn_documento.smn_documento_id AS smn_documento_id_caja
from
	smn_salud.smn_documento
	inner join smn_base.smn_documentos_generales on smn_salud.smn_documento.smn_documento_general_rf = smn_base.smn_documentos_generales.smn_documentos_generales_id
	inner join smn_caja.smn_documento on smn_base.smn_documentos_generales.smn_documentos_generales_id = smn_caja.smn_documento.smn_documento_general_rf
	inner join smn_salud.smn_ingresos on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_ingresos.smn_documento_id
	inner join smn_caja.smn_tipo_documento on smn_caja.smn_documento.smn_tipo_documento_id = smn_caja.smn_tipo_documento.smn_tipo_documento_id 
where
	smn_salud.smn_ingresos.smn_ingresos_id = ${fld:smn_ingresos_id} and 
	smn_caja.smn_tipo_documento.tdo_tipo_movimiento = 'IR'