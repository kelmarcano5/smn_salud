select smn_salud.smn_origen.smn_origen_id as id, smn_salud.smn_origen.ori_codigo || ' - ' || smn_salud.smn_origen.ori_descripcion as item from smn_salud.smn_origen order by smn_salud.smn_origen.ori_descripcion