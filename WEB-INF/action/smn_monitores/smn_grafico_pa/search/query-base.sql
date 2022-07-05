
select	
	--smn_salud.smn_ruta_paciente.smn_entidad_rf as ID,

	--(select smn_base.smn_entidades.ent_codigo || ' - ' || smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades  where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_salud.smn_ruta_paciente.smn_entidad_rf  order by smn_base.smn_entidades.ent_descripcion_corta ) as smn_entidad_rf_text,
	--(select smn_base.smn_areas_servicios.ase_codigo || ' - ' || smn_base.smn_areas_servicios.ase_descripcion from  smn_base.smn_areas_servicios  where smn_base.smn_areas_servicios.smn_areas_servicios_id is not null  and smn_base.smn_areas_servicios.smn_areas_servicios_id=smn_salud.smn_ruta_paciente.smn_area_servicio_rf  order by smn_base.smn_areas_servicios.ase_descripcion ) as smn_area_servicio_rf_combo,
	--(select smn_base.smn_sucursales.suc_codigo || ' - ' || smn_base.smn_sucursales.suc_nombre from  smn_base.smn_sucursales  where smn_base.smn_sucursales.smn_sucursales_id is not null  and smn_base.smn_sucursales.smn_sucursales_id=smn_salud.smn_ruta_paciente.smn_sucursal_rf  order by smn_base.smn_sucursales.suc_nombre ) as smn_sucursal_rf_combo,	
	smn_base.smn_unidades_servicios.uns_codigo|| ' - ' || smn_base.smn_unidades_servicios.uns_descripcion as item,
	--(select smn_salud.smn_series.sri_codigo from  smn_salud.smn_series  where smn_salud.smn_series.sri_codigo is not null  and smn_salud.smn_series.sri_codigo=smn_salud.smn_ruta_paciente.smn_serie_id  order by smn_salud.smn_series.smn_series_id  ) as smn_serie_id_combo,
	--COALESCE(SUM(CASE WHEN rta_estatus  in ('PE','ER') THEN 1 ELSE 0 END),0) as pacientes_pendientes,
	--to_char(((COALESCE(SUM(CASE WHEN rta_estatus  in ('PE','ER') THEN rta_hora_salida_unidad-rta_hora_llegada_unidad ELSE NULL END),'00:00:00'))::time),'MI.SS') as tiempo_pacientes_pendientes,
	COALESCE(SUM(CASE WHEN rta_estatus = 'PE' THEN 1 ELSE 0 END),0) as subtotal
	--to_char(((COALESCE(SUM(CASE WHEN rta_estatus = 'AT' THEN rta_hora_salida_unidad-rta_hora_llegada_unidad ELSE NULL END),'00:00:00'))::time),'MI.SS') as tiempo_pacientes_atendidos,
	-- COALESCE(SUM(CASE WHEN rta_estatus = 'EA' THEN 1 ELSE 0 END),0) as pacientes_en_atencion,
	-- to_char(((COALESCE(SUM(CASE WHEN rta_estatus = 'EA' THEN rta_hora_salida_unidad-rta_hora_llegada_unidad ELSE NULL END),'00:00:00'))::time),'MI.SS') as tiempo_pacientes_en_atencion,
	-- COALESCE(SUM(CASE WHEN rta_estatus = 'IN' THEN 1 ELSE 0 END),0) as pacientes_informados,
	-- to_char(((COALESCE(SUM(CASE WHEN rta_estatus = 'IN' THEN rta_hora_salida_unidad-rta_hora_llegada_unidad ELSE NULL END),'00:00:00'))::time),'MI.SS') as tiempo_pacientes_informado,
	-- COUNT(smn_ruta_id) as total_pacientes,
	-- to_char(((COALESCE(SUM(rta_hora_salida_unidad-rta_hora_llegada_unidad),'00:00:00'))::time),'MI.SS') as total_tiempo,
	-- COALESCE(SUM(CASE WHEN rta_estatus = 'EG' THEN 1 ELSE 0 END),0) as subtotal
from
	smn_salud.smn_ruta_paciente
	inner join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id=smn_salud.smn_ruta_paciente.smn_unidad_servicio_rf
	inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.igs_ticket=smn_salud.smn_ruta_paciente.rta_ticket
	and smn_salud.smn_ruta_paciente.rta_fecha_registro=smn_salud.smn_ingresos.igs_fecha_registro 
	--and smn_salud.smn_ruta_paciente.rta_secuencia=1
where 
	smn_ruta_id is not null	
	and rta_estatus = 'PE'
 	 	${filter}
group by 1

