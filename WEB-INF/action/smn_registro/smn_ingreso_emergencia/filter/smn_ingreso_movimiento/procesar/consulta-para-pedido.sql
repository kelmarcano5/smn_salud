select 
	smn_salud.smn_ingresos.smn_ingresos_id as id_ingreso,
	smn_salud.smn_ingresos.igs_monto_moneda_local,
	smn_salud.smn_ingresos.igs_monto_moneda_alterna,
	smn_salud.smn_ingresos.igs_dias_hospitalizacion,
	smn_salud.smn_ingresos.smn_auxiliar_rf,
	smn_salud.smn_ingresos.igs_monto_cobertura,
	smn_salud.smn_ingresos.igs_monto_cobertura_ma,
	smn_salud.smn_ingresos.smn_contratante_id,
	smn_salud.smn_ingresos.smn_entidades_rf as smn_entidad_rf,
	smn_salud.smn_ingresos.smn_sucursales_rf as smn_sucursal_rf,
	smn_salud.smn_ingresos.smn_areas_servicios_rf as smn_area_servicio_rf,
	smn_salud.smn_ingresos.smn_unidades_servicios_rf as smn_unidad_servicio_rf,
	smn_salud.smn_ingresos.smn_moneda_rf,
	smn_salud.smn_documento.tca_tipo_tasa,
	smn_salud.smn_ingresos.igs_fecha_registro
from smn_salud.smn_ingresos
inner join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_ingresos.smn_documento_id
where smn_salud.smn_ingresos.smn_ingresos_id=${fld:id_ingreso}