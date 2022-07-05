UPDATE smn_salud.smn_ruta_paciente set rta_estatus='AT'
WHERE rta_estatus='ED' and rta_secuencia='1' and rta_ticket=(select smn_salud.smn_ingresos.igs_ticket from smn_salud.smn_ingresos where smn_salud.smn_ingresos.smn_ingresos_id=${fld:id_ingreso})

