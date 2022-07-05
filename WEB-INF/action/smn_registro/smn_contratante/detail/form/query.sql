
select
	smn_salud.smn_contratante.*,
	(select smn_salud.smn_documento.doc_codigo || ' - ' || smn_salud.smn_documento.doc_nombre from  smn_salud.smn_documento  where smn_salud.smn_documento.smn_documento_id is not null  and smn_salud.smn_documento.smn_documento_id=smn_salud.smn_contratante.smn_documento_id  order by smn_salud.smn_documento.doc_nombre ) as smn_documento_id,
	(select smn_base.smn_clase_auxiliar.cla_codigo|| ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar  where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id is not null  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_salud.smn_contratante.smn_clase_auxiliar_rf  order by smn_base.smn_clase_auxiliar.cla_nombre ) as smn_clase_auxiliar_rf,
	(select smn_base.smn_auxiliar_terceros.atr_codigo || ' - ' ||  smn_base.smn_auxiliar_terceros.atr_descripcion from  smn_base.smn_auxiliar_terceros  where smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id is not null  and smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id=smn_salud.smn_contratante.smn_auxiliar_rf  order by smn_base.smn_auxiliar_terceros.atr_descripcion ) as smn_auxiliar_rf,
	(select smn_salud.smn_planes.pla_codigo || ' - ' || smn_salud.smn_planes.pla_descripcion from  smn_salud.smn_planes  where smn_salud.smn_planes.smn_planes_id is not null  and smn_salud.smn_planes.smn_planes_id=smn_salud.smn_contratante.smn_plan_id  order by smn_salud.smn_planes.pla_descripcion ) as smn_plan_id,smn_salud.smn_contratante.cnt_cantidad_citas
	
from
	smn_salud.smn_contratante,
	smn_base.smn_clase_auxiliar,
	smn_base.smn_auxiliar_terceros,
	smn_salud.smn_planes,
	smn_salud.smn_documento
where
	smn_contratante_id = ${fld:id}
