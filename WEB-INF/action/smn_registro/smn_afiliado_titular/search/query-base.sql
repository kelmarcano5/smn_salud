
select
		smn_salud.smn_afiliado_titular.smn_afiliados_id,
	smn_salud.smn_afiliado_titular.afi_numero_control,
	(select smn_salud.smn_documento.doc_codigo|| ' - ' || smn_salud.smn_documento.doc_nombre from  smn_salud.smn_documento  where smn_salud.smn_documento.smn_documento_id is not null  and smn_salud.smn_documento.smn_documento_id=smn_salud.smn_afiliado_titular.smn_documento_id  order by smn_salud.smn_documento.doc_nombre ) as smn_documento_id_combo,
	(select smn_salud.smn_contratante.smn_documento_id || ' - ' || smn_salud.smn_contratante.cnt_numero_control from  smn_salud.smn_contratante  where smn_salud.smn_contratante.smn_contratante_id is not null  and smn_salud.smn_contratante.smn_contratante_id=smn_salud.smn_afiliado_titular.smn_contratante_id  order by smn_salud.smn_contratante.cnt_numero_control ) as smn_contratante_id_combo,
	(select smn_base.smn_auxiliar_unidades_negocios.tun_codigo|| ' - ' || smn_base.smn_auxiliar_unidades_negocios.tun_nombre from  smn_base.smn_auxiliar_unidades_negocios  where smn_base.smn_auxiliar_unidades_negocios.smn_auxiliar_unidades_negocios_id is not null  and smn_base.smn_auxiliar_unidades_negocios.smn_auxiliar_unidades_negocios_id=smn_salud.smn_afiliado_titular.smn_auxiliar_unidades_negocios_rf  order by smn_base.smn_auxiliar_unidades_negocios.tun_nombre ) as smn_auxiliar_unidades_negocios_rf_combo,
	(select smn_base.smn_auxiliar_sucursales.trs_codigo|| ' - ' || smn_base.smn_auxiliar_sucursales.trs_nombre from  smn_base.smn_auxiliar_sucursales  where smn_base.smn_auxiliar_sucursales.smn_auxiliar_sucursales_id is not null  and smn_base.smn_auxiliar_sucursales.smn_auxiliar_sucursales_id=smn_salud.smn_afiliado_titular.smn_auxiliar_sucursales_rf  order by smn_base.smn_auxiliar_sucursales.trs_nombre ) as smn_auxiliar_sucursales_rf_combo,
	(select smn_base.smn_auxiliar_areas_servicios.tse_codigo|| ' - ' || smn_base.smn_auxiliar_areas_servicios.tse_descripcion from  smn_base.smn_auxiliar_areas_servicios  where smn_base.smn_auxiliar_areas_servicios.smn_auxiliar_areas_servicios_id is not null  and smn_base.smn_auxiliar_areas_servicios.smn_auxiliar_areas_servicios_id=smn_salud.smn_afiliado_titular.smn_auxiliar_areas_servicios_rf  order by smn_base.smn_auxiliar_areas_servicios.tse_descripcion ) as smn_auxiliar_areas_servicios_rf_combo,
	smn_salud.smn_afiliado_titular.afi_fecha_registro
	
from

	smn_salud.smn_afiliado_titular
where
	smn_afiliados_id is not null