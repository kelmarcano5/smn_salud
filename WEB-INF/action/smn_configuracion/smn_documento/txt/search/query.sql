select
	smn_salud.smn_documento.doc_codigo,
	smn_base.smn_documentos_generales.dcg_codigo || ' - ' || smn_base.smn_documentos_generales.dcg_descripcion as smn_documento_general_rf_combo,
	smn_salud.smn_tipo_documento.tdc_codigo || ' - ' || smn_salud.smn_tipo_documento.tdc_nombre as smn_tipo_documento_id_combo,
	smn_salud.smn_documento.doc_nombre,
	smn_salud.smn_documento.doc_secuencia,
	smn_salud.smn_documento.doc_fecha_registro,
		smn_salud.smn_documento.smn_documento_id
	
from
	smn_salud.smn_documento
	left outer join smn_base.smn_documentos_generales on smn_base.smn_documentos_generales.smn_documentos_generales_id=smn_salud.smn_documento.smn_documento_general_rf
	left outer join smn_salud.smn_tipo_documento on smn_salud.smn_tipo_documento.smn_tipo_documento_id=smn_salud.smn_documento.smn_tipo_documento_id
