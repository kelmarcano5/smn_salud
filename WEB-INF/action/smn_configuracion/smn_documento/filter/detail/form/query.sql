select
	smn_salud.smn_documento.doc_codigo,
	smn_base.smn_documentos_generales.dcg_codigo || ' - ' || smn_base.smn_documentos_generales.dcg_descripcion as smn_documento_general_rf_combo,
	smn_salud.smn_tipo_documento.tdc_codigo || ' - ' || smn_salud.smn_tipo_documento.tdc_nombre as smn_tipo_documento_id_combo,
	smn_salud.smn_documento.doc_nombre,
	smn_salud.smn_documento.doc_fecha_registro,
	case
		when smn_salud.smn_documento.tca_tipo_tasa='OF' then 'OFICIAL'
		when smn_salud.smn_documento.tca_tipo_tasa='LI' then 'LIBRE'
		when smn_salud.smn_documento.tca_tipo_tasa='PR' then 'PROYECTADA'
	end as tca_tipo_tasa,
	case
		when smn_salud.smn_documento.doc_maneja_moneda_alt='SI' then 'SI'
		when smn_salud.smn_documento.doc_maneja_moneda_alt='NO' then 'NO'
	end as doc_maneja_moneda_alt,
	case
		when smn_salud.smn_documento.doc_afiliacion_persona_natural='SI' then 'SI'
		when smn_salud.smn_documento.doc_afiliacion_persona_natural='NO' then 'NO'
	end as doc_afiliacion_persona_natural,
	case
		when smn_salud.smn_documento.doc_contratante='SI' then 'SI'
		when smn_salud.smn_documento.doc_contratante='NO' then 'NO'
	end as doc_contratante,
		smn_salud.smn_documento.smn_documento_id
	
from
	smn_salud.smn_documento
	left outer join smn_base.smn_documentos_generales on smn_base.smn_documentos_generales.smn_documentos_generales_id=smn_salud.smn_documento.smn_documento_general_rf
	left outer join smn_salud.smn_tipo_documento on smn_salud.smn_tipo_documento.smn_tipo_documento_id=smn_salud.smn_documento.smn_tipo_documento_id
where
	smn_documento_id = ${fld:id}
