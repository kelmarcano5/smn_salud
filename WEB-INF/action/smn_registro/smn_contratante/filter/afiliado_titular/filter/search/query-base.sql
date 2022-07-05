select
	smn_salud.smn_afiliado_titular.smn_afiliados_id,
	smn_salud.smn_afiliado_titular.afi_numero_control,
	smn_base.smn_auxiliar.aux_num_doc_oficial,
	smn_base.smn_auxiliar_terceros.atr_codigo ||' - '|| smn_base.smn_auxiliar_terceros.atr_descripcion as smn_contratante_id,
	smn_base.smn_auxiliar.aux_codigo||'-'|| smn_base.smn_auxiliar.aux_descripcion as smn_auxiliar_rf,
	(select smn_salud.smn_documento.doc_codigo|| ' - ' || smn_salud.smn_documento.doc_nombre from  smn_salud.smn_documento  where smn_salud.smn_documento.smn_documento_id is not null  and smn_salud.smn_documento.smn_documento_id=smn_salud.smn_afiliado_titular.smn_documento_id  order by smn_salud.smn_documento.doc_nombre ) as smn_documento_id,
	(select smn_base.smn_auxiliar_unidades_negocios.tun_codigo|| ' - ' || smn_base.smn_auxiliar_unidades_negocios.tun_nombre from  smn_base.smn_auxiliar_unidades_negocios  where smn_base.smn_auxiliar_unidades_negocios.smn_auxiliar_unidades_negocios_id is not null  and smn_base.smn_auxiliar_unidades_negocios.smn_auxiliar_unidades_negocios_id=smn_salud.smn_afiliado_titular.smn_auxiliar_unidades_negocios_rf  order by smn_base.smn_auxiliar_unidades_negocios.tun_nombre ) as smn_auxiliar_unidades_negocios_rf,
	(select smn_base.smn_auxiliar_sucursales.trs_codigo|| ' - ' || smn_base.smn_auxiliar_sucursales.trs_nombre from  smn_base.smn_auxiliar_sucursales  where smn_base.smn_auxiliar_sucursales.smn_auxiliar_sucursales_id is not null  and smn_base.smn_auxiliar_sucursales.smn_auxiliar_sucursales_id=smn_salud.smn_afiliado_titular.smn_auxiliar_sucursales_rf  order by smn_base.smn_auxiliar_sucursales.trs_nombre ) as smn_auxiliar_sucursales_rf,
	(select smn_base.smn_auxiliar_areas_servicios.tse_codigo|| ' - ' || smn_base.smn_auxiliar_areas_servicios.tse_descripcion from  smn_base.smn_auxiliar_areas_servicios  where smn_base.smn_auxiliar_areas_servicios.smn_auxiliar_areas_servicios_id is not null  and smn_base.smn_auxiliar_areas_servicios.smn_auxiliar_areas_servicios_id=smn_salud.smn_afiliado_titular.smn_auxiliar_areas_servicios_rf  order by smn_base.smn_auxiliar_areas_servicios.tse_descripcion ) as smn_auxiliar_areas_servicios_rf,
	smn_salud.smn_afiliado_titular.afi_fecha_registro
	
from

	smn_salud.smn_afiliado_titular
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_afiliado_titular.afi_auxiliar_rf
	left outer join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_contratante_id = smn_salud.smn_afiliado_titular.smn_contratante_id
	left outer join smn_base.smn_auxiliar_terceros on smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id = smn_salud.smn_contratante.smn_auxiliar_rf


where
	smn_salud.smn_afiliado_titular.smn_contratante_id=${fld:contratante_id}
${filter}