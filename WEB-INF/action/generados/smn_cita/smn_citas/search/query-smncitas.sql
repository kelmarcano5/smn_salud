select
	(select smn_base.smn_clase_auxiliar.cla_codigo|| ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar  where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id is not null  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_salud.smn_citas.cts_clase_auxiliar  order by smn_base.smn_clase_auxiliar.cla_nombre ) as cla_nombre_combo,
	(select smn_base.smn_auxiliar_terceros.atr_codigo || ' - ' ||  smn_base.smn_auxiliar_terceros.atr_descripcion from  smn_base.smn_auxiliar_terceros  where smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id is not null  and smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id=smn_salud.smn_citas.cts_auxiliar  order by smn_base.smn_auxiliar_terceros.atr_descripcion ) as smn_item_combo,
	(select smn_base.smn_prestadores_servicios.prs_codigo || ' - ' || smn_base.smn_prestadores_servicios.prs_nombres || ' ' || smn_base.smn_prestadores_servicios.prs_apellidos from  smn_base.smn_prestadores_servicios  where smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id is not null  and smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id=smn_salud.smn_citas.cts_ordenante  order by smn_base.smn_prestadores_servicios.prs_nombres ) as prs_apellidos_combo,
	(select smn_salud.smn_afiliados.afi_nombres || ' ' || smn_salud.smn_afiliados.afi_apellidos from  smn_salud.smn_afiliados  where smn_salud.smn_afiliados.smn_afiliados_id is not null  and smn_salud.smn_afiliados.smn_afiliados_id=smn_salud.smn_citas.cts_titular  order by  smn_salud.smn_afiliados.afi_nombres ) as afi_apellidos_combo,
	smn_salud.smn_citas.smn_citas_id,
	smn_salud.smn_citas.cts_num_control,
	smn_salud.smn_citas.cts_num_doc_oficial,
	smn_salud.smn_citas.cts_clase_auxiliar,
	smn_salud.smn_citas.cts_auxiliar,
	smn_salud.smn_citas.cts_ordenante,
	smn_salud.smn_citas.cts_titular,
	smn_salud.smn_citas.cts_fecha_registro

from 
	smn_salud.smn_citas
