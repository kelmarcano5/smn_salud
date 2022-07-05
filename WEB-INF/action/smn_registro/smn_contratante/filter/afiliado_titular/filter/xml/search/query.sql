
select

	(select smn_salud.smn_documento.doc_codigo|| ' - ' || smn_salud.smn_documento.doc_nombre from  smn_salud.smn_documento  where smn_salud.smn_documento.smn_documento_id is not null  and smn_salud.smn_documento.smn_documento_id=smn_salud.smn_afiliado_titular.smn_documento_id  order by smn_salud.smn_documento.doc_nombre ) as smn_documento_id,
	(select smn_salud.smn_contratante.smn_documento_id || ' - ' || smn_salud.smn_contratante.cnt_numero_control from  smn_salud.smn_contratante  where smn_salud.smn_contratante.smn_contratante_id is not null  and smn_salud.smn_contratante.smn_contratante_id=smn_salud.smn_afiliado_titular.smn_contratante_id  order by smn_salud.smn_contratante.cnt_numero_control ) as smn_contratante_id,
	(select smn_base.smn_auxiliar_unidades_negocios.tun_codigo|| ' - ' || smn_base.smn_auxiliar_unidades_negocios.tun_nombre from  smn_base.smn_auxiliar_unidades_negocios  where smn_base.smn_auxiliar_unidades_negocios.smn_auxiliar_unidades_negocios_id is not null  and smn_base.smn_auxiliar_unidades_negocios.smn_auxiliar_unidades_negocios_id=smn_salud.smn_afiliado_titular.smn_auxiliar_unidades_negocios_rf  order by smn_base.smn_auxiliar_unidades_negocios.tun_nombre ) as smn_auxiliar_unidades_negocios_rf,
	(select smn_base.smn_auxiliar_sucursales.trs_codigo|| ' - ' || smn_base.smn_auxiliar_sucursales.trs_nombre from  smn_base.smn_auxiliar_sucursales  where smn_base.smn_auxiliar_sucursales.smn_auxiliar_sucursales_id is not null  and smn_base.smn_auxiliar_sucursales.smn_auxiliar_sucursales_id=smn_salud.smn_afiliado_titular.smn_auxiliar_sucursales_rf  order by smn_base.smn_auxiliar_sucursales.trs_nombre ) as smn_auxiliar_sucursales_rf,
	(select smn_base.smn_auxiliar_areas_servicios.tse_codigo|| ' - ' || smn_base.smn_auxiliar_areas_servicios.tse_descripcion from  smn_base.smn_auxiliar_areas_servicios  where smn_base.smn_auxiliar_areas_servicios.smn_auxiliar_areas_servicios_id is not null  and smn_base.smn_auxiliar_areas_servicios.smn_auxiliar_areas_servicios_id=smn_salud.smn_afiliado_titular.smn_auxiliar_areas_servicios_rf  order by smn_base.smn_auxiliar_areas_servicios.tse_descripcion ) as smn_auxiliar_areas_servicios_rf,
	(select smn_base.smn_auxiliar_unidades_servicios.tns_codigo|| ' - ' || smn_base.smn_auxiliar_unidades_servicios.tns_descripcion from  smn_base.smn_auxiliar_unidades_servicios  where smn_base.smn_auxiliar_unidades_servicios.smn_auxiliar_unidades_servicios_id is not null  and smn_base.smn_auxiliar_unidades_servicios.smn_auxiliar_unidades_servicios_id=smn_salud.smn_afiliado_titular.smn_auxiliar_unidades_servicios_rf  order by smn_base.smn_auxiliar_unidades_servicios.tns_descripcion ) as smn_auxiliar_unidades_servicios_rf,
	smn_salud.smn_afiliado_titular.afi_fecha_desafiliado,
	smn_salud.smn_afiliado_titular.afi_numero_control,
	smn_salud.smn_afiliado_titular.smn_contratante_id,
	smn_salud.smn_afiliado_titular.afi_fecha_registro,
	smn_salud.smn_afiliado_titular.afi_estatus,
	smn_salud.smn_afiliado_titular.afi_fecha_de_inicio,
	smn_salud.smn_afiliado_titular.smn_afiliados_id

	
from

	smn_base.smn_auxiliar_terceros,
	smn_base.smn_clase_auxiliar,
	smn_salud.smn_afiliado_titular
where
	smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id = smn_salud.smn_afiliado_titular.afi_auxiliar_rf and
	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_afiliado_titular.afi_clase_auxiliar_rf
