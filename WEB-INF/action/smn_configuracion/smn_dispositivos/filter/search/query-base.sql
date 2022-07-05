select
	case
	when smn_salud.smn_dispositivos.dis_tipo='DI' then '${lbl:b_digitalizador_dis}'
	when smn_salud.smn_dispositivos.dis_tipo='MO' then '${lbl:b_monitor_dis}'
	end as dis_tipo_combo,
	(select smn_base.smn_entidades.ent_codigo || ' - ' ||  smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades  where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_salud.smn_dispositivos.smn_entidades_rf  order by smn_base.smn_entidades.ent_descripcion_corta ) as smn_entidades_rf_combo,
	(select smn_base.smn_sucursales.suc_codigo || ' - ' ||  smn_base.smn_sucursales.suc_nombre from  smn_base.smn_sucursales  where smn_base.smn_sucursales.smn_sucursales_id is not null  and smn_base.smn_sucursales.smn_sucursales_id=smn_salud.smn_dispositivos.smn_sucursales_rf  order by smn_base.smn_sucursales.suc_nombre ) as smn_sucursales_rf_combo,
	(select smn_base.smn_areas_servicios.ase_codigo || ' - ' ||  smn_base.smn_areas_servicios.ase_descripcion from  smn_base.smn_areas_servicios  where smn_base.smn_areas_servicios.smn_areas_servicios_id is not null  and smn_base.smn_areas_servicios.smn_areas_servicios_id=smn_salud.smn_dispositivos.smn_areas_servicios_rf  order by smn_base.smn_areas_servicios.ase_descripcion ) as smn_areas_servicios_rf_combo,
	smn_salud.smn_dispositivos.smn_entidades_rf,
	smn_salud.smn_dispositivos.dis_tipo,
	smn_salud.smn_dispositivos.dis_nombre,
	smn_salud.smn_dispositivos.dis_codigo,
	smn_salud.smn_dispositivos.dis_fecha_registro,
	smn_salud.smn_dispositivos.smn_areas_servicios_rf,
	smn_salud.smn_dispositivos.smn_sucursales_rf,
	smn_salud.smn_dispositivos.smn_dispositivos_id
	
from
	smn_salud.smn_dispositivos
where
	smn_dispositivos_id is not null
	${filter}
order by
		smn_dispositivos_id
