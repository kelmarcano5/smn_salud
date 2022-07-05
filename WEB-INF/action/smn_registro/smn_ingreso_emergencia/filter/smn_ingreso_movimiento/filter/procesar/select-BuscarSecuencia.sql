select DISTINCT smn_salud.smn_relacion_unidad_paso.rup_secuencia 
from smn_salud.smn_relacion_unidad_paso
   inner JOIN smn_salud.smn_series on smn_salud.smn_series.smn_series_id = smn_salud.smn_relacion_unidad_paso.smn_serie_id
where smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf= ${fld:smn_area_servicio_rf}
   and smn_salud.smn_relacion_unidad_paso.smn_unidad_servicio_rf= ${fld:smn_unidad_servicio_rf}
   and smn_salud.smn_series.sri_codigo= ${fld:smn_serie_id}