select smn_salud.smn_dispositivos.smn_dispositivos_id as id, smn_salud.smn_dispositivos.dis_codigo || ' - ' || smn_salud.smn_dispositivos.dis_nombre as item from smn_salud.smn_dispositivos order by smn_salud.smn_dispositivos.dis_nombre