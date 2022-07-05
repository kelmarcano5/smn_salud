select
	smn_salud.smn_series.smn_series_id,
	smn_salud.smn_series.sri_codigo as sri_codigo_pl0,
	case
	when smn_salud.smn_campos_visualizacion_monitores_dispositivos.cvm_datos_pac='S' then '${lbl:b_si}'
	when smn_salud.smn_campos_visualizacion_monitores_dispositivos.cvm_datos_pac='N' then '${lbl:b_no}'
	end as cvm_datos_pac_combo,
	case
	when smn_salud.smn_campos_visualizacion_monitores_dispositivos.cvm_unidad_llamada='S' then '${lbl:b_si}'
	when smn_salud.smn_campos_visualizacion_monitores_dispositivos.cvm_unidad_llamada='N' then '${lbl:b_no}'
	end as cvm_unidad_llamada_combo,
	case
	when smn_salud.smn_campos_visualizacion_monitores_dispositivos.cvm_pacientes_espera='S' then '${lbl:b_si}'
	when smn_salud.smn_campos_visualizacion_monitores_dispositivos.cvm_pacientes_espera='N' then '${lbl:b_no}'
	end as cvm_pacientes_espera_combo,
	case
	when smn_salud.smn_campos_visualizacion_monitores_dispositivos.cvm_tiempo_aprox_espera='S' then '${lbl:b_si}'
	when smn_salud.smn_campos_visualizacion_monitores_dispositivos.cvm_tiempo_aprox_espera='N' then '${lbl:b_no}'
	end as cvm_tiempo_aprox_espera_combo,
	smn_salud.smn_campos_visualizacion_monitores_dispositivos.smn_series_id,
	smn_salud.smn_campos_visualizacion_monitores_dispositivos.cvm_datos_pac,
	smn_salud.smn_campos_visualizacion_monitores_dispositivos.cvm_unidad_llamada,
	smn_salud.smn_campos_visualizacion_monitores_dispositivos.cvm_pacientes_espera,
	smn_salud.smn_campos_visualizacion_monitores_dispositivos.cvm_tiempo_aprox_espera,
	smn_salud.smn_campos_visualizacion_monitores_dispositivos.cvm_fecha_registro,
	smn_salud.smn_campos_visualizacion_monitores_dispositivos.smn_campos_vis_mon_dis_id as smn_campos_visualizacion_monitores_dispositivos_id
	
from
	smn_salud.smn_series,
	smn_salud.smn_campos_visualizacion_monitores_dispositivos
where
	smn_campos_vis_mon_dis_id is not null
	and 	smn_salud.smn_series.smn_series_id=smn_salud.smn_campos_visualizacion_monitores_dispositivos.smn_series_id
	${filter}
order by
		smn_campos_vis_mon_dis_id
