select smn_salud.smn_ingresos.igs_estatus_financiero from smn_salud.smn_ingresos 
where smn_salud.smn_ingresos.igs_estatus_financiero='PE' 
and smn_salud.smn_ingresos.smn_auxiliar_rf=${fld:smn_auxiliar_rf}
