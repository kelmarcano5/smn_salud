select
		smn_salud.smn_relacion_unidad_paso.smn_rel_unidad_paso,
	(select smn_base.smn_areas_servicios.ase_codigo || ' - ' ||  smn_base.smn_areas_servicios.ase_descripcion from  smn_base.smn_areas_servicios  where smn_base.smn_areas_servicios.smn_areas_servicios_id is not null  and smn_base.smn_areas_servicios.smn_areas_servicios_id=smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf  order by smn_base.smn_areas_servicios.ase_descripcion ) as smn_area_servicio_rf_combo,
	(select smn_base.smn_unidades_servicios.uns_codigo || ' - ' ||  smn_base.smn_unidades_servicios.uns_descripcion from  smn_base.smn_unidades_servicios  where smn_base.smn_unidades_servicios.smn_unidades_servicios_id is not null  and smn_base.smn_unidades_servicios.smn_unidades_servicios_id=smn_salud.smn_relacion_unidad_paso.smn_unidad_servicio_rf  order by smn_base.smn_unidades_servicios.uns_descripcion ) as smn_unidad_servicio_rf_combo,
	(select smn_base.smn_paso.pas_codigo || ' - ' ||  smn_base.smn_paso.pas_descripcion from  smn_base.smn_paso  where smn_base.smn_paso.smn_paso_id is not null  and smn_base.smn_paso.smn_paso_id=smn_salud.smn_relacion_unidad_paso.smn_paso_rf  order by smn_base.smn_paso.pas_descripcion ) as smn_paso_rf_combo,
	(select smn_salud.smn_series.sri_codigo || ' - ' ||  smn_salud.smn_series.sri_nombre from  smn_salud.smn_series  where smn_salud.smn_series.smn_series_id is not null  and smn_salud.smn_series.smn_series_id=smn_salud.smn_relacion_unidad_paso.smn_serie_id  order by smn_salud.smn_series.sri_nombre ) as smn_serie_id_combo,
	case
		when smn_salud.smn_relacion_unidad_paso.rup_estatus='AC' then '${lbl:b_activo}'
		when smn_salud.smn_relacion_unidad_paso.rup_estatus='IN' then '${lbl:b_inactivo}'
	end as rup_estatus_combo,
	smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf,
	smn_salud.smn_relacion_unidad_paso.smn_unidad_servicio_rf,
	smn_salud.smn_relacion_unidad_paso.smn_paso_rf,
	smn_salud.smn_relacion_unidad_paso.smn_serie_id,
	smn_salud.smn_relacion_unidad_paso.rup_secuencia,
	case
		when smn_salud.smn_relacion_unidad_paso.rup_unidad_administrativa='AD' then '${lbl:b_administrative}'
		when smn_salud.smn_relacion_unidad_paso.rup_unidad_administrativa='DS' then '${lbl:b_service}'
	end as rup_unidad_administrativa,
	smn_salud.smn_relacion_unidad_paso.rup_estatus,
	smn_salud.smn_relacion_unidad_paso.rup_vigencia,
	smn_salud.smn_relacion_unidad_paso.rup_fecha_registro,
	(select smn_base.smn_unidades_servicios.uns_codigo || ' - ' ||  smn_base.smn_unidades_servicios.uns_descripcion from  smn_base.smn_unidades_servicios  where smn_base.smn_unidades_servicios.smn_unidades_servicios_id is not null  and smn_base.smn_unidades_servicios.smn_unidades_servicios_id=smn_salud.smn_relacion_unidad_paso.smn_unidad_servicio_caja_rf order by smn_base.smn_unidades_servicios.uns_descripcion ) as smn_unidad_servicio_caja_rf_combo,

from
	smn_salud.smn_relacion_unidad_paso order by smn_salud.smn_relacion_unidad_paso.smn_serie_id asc
