select smn_salud.smn_contratante.smn_contratante_id as id, smn_salud.smn_contratante.smn_documento_id || ' - ' || smn_salud.smn_contratante.cnt_numero_control as item from smn_salud.smn_contratante order by smn_salud.smn_contratante.cnt_numero_control