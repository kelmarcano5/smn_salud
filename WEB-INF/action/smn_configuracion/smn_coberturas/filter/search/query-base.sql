select
	(select smn_base.smn_unidad_medida.unm_codigo|| ' - ' || smn_base.smn_unidad_medida.unm_descripcion from  smn_base.smn_unidad_medida  where smn_base.smn_unidad_medida.smn_unidad_medida_id is not null  and smn_base.smn_unidad_medida.smn_unidad_medida_id=smn_salud.smn_coberturas.cob_unidad_tiempo_rf  order by smn_base.smn_unidad_medida.unm_descripcion ) as unm_descripcion_combo,
	smn_salud.smn_coberturas.smn_coberturas_id,
	smn_salud.smn_coberturas.cob_codigo,
	smn_salud.smn_coberturas.cob_descripcion,
	smn_salud.smn_coberturas.cob_tiempo_servicio,
	smn_salud.smn_coberturas.cob_unidad_tiempo_rf,
	smn_salud.smn_coberturas.cob_deducible,
	smn_salud.smn_tipo_coberturas.tco_codigo ||' - '|| smn_salud.smn_tipo_coberturas.tco_descripcion as smn_tipo_coberturas_id,
	smn_salud.smn_coberturas.cob_fecha_registro
	
from
	smn_salud.smn_coberturas
	left join smn_base.smn_unidad_medida on smn_base.smn_unidad_medida.smn_unidad_medida_id = smn_salud.smn_coberturas.cob_unidad_tiempo_rf
	left join smn_salud.smn_tipo_coberturas on smn_salud.smn_tipo_coberturas.smn_tipo_coberturas_id = 	smn_salud.smn_coberturas.smn_tipo_coberturas_id
where
	smn_base.smn_unidad_medida.smn_unidad_medida_id = smn_salud.smn_coberturas.cob_unidad_tiempo_rf and
	smn_coberturas_id is not null
	${filter}
order by
		smn_coberturas_id
