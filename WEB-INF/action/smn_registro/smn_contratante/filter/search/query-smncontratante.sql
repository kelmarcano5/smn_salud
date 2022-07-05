select
		smn_salud.smn_contratante.smn_contratante_id,
	  smn_base.smn_auxiliar_terceros.atr_codigo|| ' - ' || smn_base.smn_auxiliar_terceros.atr_descripcion as smn_auxiliar_rf,
		smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id as auxiliar_id,
		smn_base.smn_auxiliar_terceros.atr_codigo,
		smn_base.smn_auxiliar_terceros.atr_descripcion,
		smn_salud.smn_documento.doc_codigo || ' - ' || smn_salud.smn_documento.doc_nombre as smn_documento_id,
		smn_salud.smn_documento.smn_documento_id as documento_rf,
		smn_salud.smn_documento.doc_codigo,
		smn_salud.smn_documento.doc_nombre,
		smn_salud.smn_contratante.cnt_numero_control,		
		smn_salud.smn_contratante.cnt_cantidad_citas,
		smn_salud.smn_contratante.cnt_fecha_registro,
		smn_base.smn_estructura_organizacional.eor_nombre as departamento,
		smn_salud.smn_planes.pla_descripcion as smn_plan_id,
		smn_base.smn_clase_auxiliar.cla_nombre as smn_clase_auxiliar_rf
	
from
	smn_salud.smn_contratante
	left outer join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_contratante.smn_documento_id
	left outer join smn_base.smn_auxiliar_terceros on smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id=	smn_salud.smn_contratante.smn_auxiliar_rf
	left join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id = smn_salud.smn_contratante.smn_estructura_organizacional_rf
	inner join smn_salud.smn_planes on smn_salud.smn_planes.smn_planes_id = smn_salud.smn_contratante.smn_plan_id
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_contratante.smn_clase_auxiliar_rf
where
	smn_salud.smn_contratante.smn_contratante_id is not null
	${filter}
order by 
	smn_salud.smn_contratante.smn_contratante_id desc