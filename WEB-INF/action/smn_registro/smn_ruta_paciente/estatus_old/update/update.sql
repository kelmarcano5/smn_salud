delete from smn_salud.smn_ingreso_cola_virtual where smn_ingreso_cola_virtual_id=(select smn_ingreso_cola_virtual_id from smn_salud.smn_ingreso_cola_virtual where icv_numero_ticket=${fld:rta_ticket});

-- UPDATE smn_salud.smn_ruta_paciente SET
-- 	rta_estatus=${fld:smn_estatus},
-- 	rta_observacion=${fld:rta_observacion}
-- WHERE
-- 	rta_ticket=${fld:rta_ticket};

