select
		smn_salud.smn_dispositivos.dis_codigo
from
		smn_salud.smn_dispositivos
where
		upper(smn_salud.smn_dispositivos.dis_codigo) = upper(${fld:dis_codigo}) and
		smn_entidades_rf = ${fld:smn_entidades_rf} and
	smn_sucursales_rf = ${fld:smn_sucursales_rf} and
	smn_areas_servicios_rf = ${fld:smn_areas_servicios_rf} and 
	smn_unidad_servicio_rf = ${fld:smn_unidad_servicio_rf}
