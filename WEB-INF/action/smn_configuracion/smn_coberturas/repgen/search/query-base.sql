select
	smn_base.smn_unidad_medida.unm_descripcion,
		smn_salud.smn_coberturas.smn_coberturas_id,
	${field}
from
	smn_base.smn_unidad_medida,
	smn_salud.smn_coberturas
where
	smn_base.smn_unidad_medida.smn_unidad_medida_id = smn_salud.smn_coberturas.cob_unidad_tiempo_rf and
		smn_salud.smn_coberturas.smn_coberturas_id is not null
	${filter}
	
	