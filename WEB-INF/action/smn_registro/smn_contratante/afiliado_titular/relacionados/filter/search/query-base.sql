
select
	(select smn_salud.smn_afiliado_titular.afi_numero_control|| ' - ' || smn_salud.smn_afiliado_titular.smn_contratante_id from  smn_salud.smn_afiliado_titular where smn_salud.smn_afiliado_titular.smn_afiliados_id is not null  and smn_salud.smn_afiliado_titular.smn_afiliados_id=smn_salud.smn_relacionados.smn_afiliados_id order by smn_salud.smn_afiliado_titular.smn_contratante_id ) as smn_afiliados_id,
	(select smn_salud.smn_documento.doc_codigo|| ' - ' || smn_salud.smn_documento.doc_nombre from  smn_salud.smn_documento  where smn_salud.smn_documento.smn_documento_id is not null  and smn_salud.smn_documento.smn_documento_id=smn_salud.smn_relacionados.smn_documento_id  order by smn_salud.smn_documento.doc_nombre ) as smn_documento_id,
	(select smn_base.smn_clase_auxiliar.cla_codigo|| ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar  where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id is not null  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_salud.smn_relacionados.smn_clase_rf  order by smn_base.smn_clase_auxiliar.cla_nombre ) as smn_clase_rf,
	(select smn_base.smn_auxiliar_terceros.atr_codigo || ' - ' ||  smn_base.smn_auxiliar_terceros.atr_descripcion from  smn_base.smn_auxiliar_terceros  where smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id is not null  and smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id=smn_salud.smn_relacionados.smn_auxiliar_rf  order by smn_base.smn_auxiliar_terceros.atr_descripcion ) as smn_auxiliar_rf,
	(select smn_base.smn_parentezco.ptz_codigo|| ' - ' || smn_base.smn_parentezco.ptz_descripcion from  smn_base.smn_parentezco  where smn_base.smn_parentezco.smn_parentezco_id is not null  and smn_base.smn_parentezco.smn_parentezco_id=smn_salud.smn_relacionados.smn_parentesco_rf  order by smn_base.smn_parentezco.ptz_descripcion ) as smn_parentesco_rf,
	smn_salud.smn_relacionados.smn_relacionado_id,
	smn_salud.smn_relacionados.rel_numero_control,
	smn_salud.smn_relacionados.rel_fecha_registro,
	smn_salud.smn_relacionados.smn_afiliados_id,
	smn_base.smn_auxiliar.aux_codigo || '-' || smn_base.smn_auxiliar.aux_descripcion as afiliado,
	smn_base.smn_auxiliar.aux_codigo,
	smn_base.smn_auxiliar.aux_descripcion
	
from
	smn_salud.smn_relacionados
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_relacionados.smn_auxiliar_rf

where 

	smn_salud.smn_relacionados.smn_afiliados_id = ${fld:smn_afiliados_id}
