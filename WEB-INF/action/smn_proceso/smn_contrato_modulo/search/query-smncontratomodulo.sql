select
	smn_salud.smn_contrato_modulo.smn_contrato_modulo_id,
	smn_base.smn_contrato_base.ctr_nombre as smn_contrato_base_rf,
	smn_salud.smn_documento.doc_nombre as smn_documento_id,
	smn_salud.smn_contrato_modulo.ctm_numero_contrato,
	smn_base.smn_auxiliar.aux_descripcion as smn_contratante_id,
	smn_salud.smn_contrato_modulo.ctm_fecha_vigencia_desde,
	smn_salud.smn_contrato_modulo.ctm_fecha_vigencia_hasta,
	smn_salud.smn_planes.pla_descripcion as smn_planes_id,
	smn_salud.smn_contrato_modulo.ctm_monto_contrato,
	smn_salud.smn_contrato_modulo.ctm_monto_cobertura_afiliado,
	smn_salud.smn_contrato_modulo.ctm_fecha_registro
	
from
	smn_salud.smn_contrato_modulo
	inner join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_contrato_modulo.smn_documento_id
	inner join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_contratante_id = smn_salud.smn_contrato_modulo.smn_contratante_id
	inner join smn_base.smn_contrato_base on smn_base.smn_contrato_base.smn_contrato_base_id = smn_salud.smn_contrato_modulo.smn_contrato_base_rf
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf
	inner join smn_salud.smn_planes on smn_salud.smn_planes.smn_planes_id = smn_salud.smn_contrato_modulo.smn_planes_id
	