select
		smn_salud.smn_contratante.smn_contratante_id,
	  smn_base.smn_auxiliar.aux_codigo|| ' - ' || smn_base.smn_auxiliar.aux_descripcion as smn_auxiliar_rf,
		smn_base.smn_auxiliar.smn_auxiliar_id as auxiliar_id,
		smn_base.smn_auxiliar.aux_codigo,
		smn_base.smn_auxiliar.aux_descripcion,
		smn_salud.smn_documento.doc_codigo || ' - ' || smn_salud.smn_documento.doc_nombre as smn_documento_id,
		smn_salud.smn_documento.smn_documento_id as documento_rf,
		smn_salud.smn_documento.doc_codigo,
		smn_salud.smn_documento.doc_nombre,
	smn_salud.smn_contratante.cnt_numero_control,
	(select smn_base.smn_clase_auxiliar.cla_codigo|| ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar  where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id is not null  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_salud.smn_contratante.smn_clase_auxiliar_rf  order by smn_base.smn_clase_auxiliar.cla_nombre ) as smn_clase_auxiliar_rf,
	(select smn_base.smn_auxiliar.aux_codigo || ' - ' ||  smn_base.smn_auxiliar.aux_descripcion from  smn_base.smn_auxiliar  where smn_base.smn_auxiliar.smn_auxiliar_id is not null  and smn_base.smn_auxiliar.smn_auxiliar_id=smn_salud.smn_contratante.smn_auxiliar_rf  order by smn_base.smn_auxiliar.aux_descripcion ) as smn_auxiliar_rf,
	(select smn_salud.smn_planes.pla_codigo || ' - ' || smn_salud.smn_planes.pla_descripcion from  smn_salud.smn_planes  where smn_salud.smn_planes.smn_planes_id is not null  and smn_salud.smn_planes.smn_planes_id=smn_salud.smn_contratante.smn_plan_id  order by smn_salud.smn_planes.pla_descripcion ) as smn_plan_id,smn_salud.smn_contratante.cnt_cantidad_citas,
	smn_salud.smn_contratante.cnt_fecha_registro
	
from
	smn_salud.smn_contratante
	left outer join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_contratante.smn_documento_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id=	smn_salud.smn_contratante.smn_auxiliar_rf
order by 
	smn_salud.smn_contratante.smn_contratante_id desc