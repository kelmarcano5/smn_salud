select
		smn_salud.smn_coberturas.cob_codigo,
	smn_salud.smn_coberturas.cob_descripcion,
	smn_salud.smn_coberturas.cob_descuento,
	smn_salud.smn_coberturas.cob_tiempo_servicio,
	smn_salud.smn_coberturas.cob_unidad_tiempo_rf,
	smn_salud.smn_coberturas.cob_deducible,
	smn_salud.smn_coberturas.cob_time_desp_afil,
	smn_salud.smn_coberturas.cob_otros_centros,
	smn_salud.smn_coberturas.cob_cantidad_servicio,
	smn_salud.smn_coberturas.cob_vigencia_desde,
	smn_salud.smn_coberturas.cob_vigencia_hasta,
	smn_salud.smn_coberturas.cob_cobertura_desde,
	smn_salud.smn_coberturas.cob_cobertura_hasta,
	smn_salud.smn_coberturas.cob_deducible_centro,
	smn_salud.smn_coberturas.cob_porc_deducible,
	smn_salud.smn_coberturas.cob_fecha_registro
from
	smn_salud.smn_coberturas 
where
	smn_salud.smn_coberturas.smn_coberturas_id = ${fld:id}
