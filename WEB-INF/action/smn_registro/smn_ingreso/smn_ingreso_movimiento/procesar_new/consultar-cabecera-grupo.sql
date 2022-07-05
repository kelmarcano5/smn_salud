select 
	smn_salud.smn_ingreso_movimiento.smn_ingreso_id as smn_ingresos_id, 
	smn_salud.smn_ingreso_movimiento.smn_grupo_prestador_servicio_rf as smn_grupo_prestador_servicio_rf, 
	smn_salud.smn_ingreso_movimiento.smn_unidades_servicios_rf, 
	case  
		when smn_salud.smn_ingreso_movimiento.smn_prestador_servicio_rf is null then 0 
		else  smn_salud.smn_ingreso_movimiento.smn_prestador_servicio_rf 
	end as smn_prestador_servicio_rf 
from 
	smn_salud.smn_ingreso_movimiento  
where 
	smn_salud.smn_ingreso_movimiento.smn_ingreso_id = ${fld:id_ingreso} 
group by  
	smn_salud.smn_ingreso_movimiento.smn_ingreso_id, 
	smn_salud.smn_ingreso_movimiento.smn_unidades_servicios_rf, 
	smn_salud.smn_ingreso_movimiento.smn_grupo_prestador_servicio_rf, 
	smn_salud.smn_ingreso_movimiento.smn_prestador_servicio_rf 
	