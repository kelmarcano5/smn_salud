delete from smn_salud.smn_ingreso_cola_virtual where smn_ingreso_cola_virtual_id=(select smn_ingreso_cola_virtual_id from smn_salud.smn_ingreso_cola_virtual where icv_numero_ticket=${fld:rta_ticket});

