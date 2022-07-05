select
		smn_salud.smn_contratante.smn_documento_id,
	smn_salud.smn_contratante.cnt_numero_control,
	smn_salud.smn_contratante.smn_clase_auxiliar_rf,
	smn_salud.smn_contratante.smn_auxiliar_rf,
	smn_salud.smn_contratante.smn_plan_id,
	smn_salud.smn_contratante.cnt_fecha_de_inicio,
	smn_salud.smn_contratante.cnt_cantidad_citas,
	smn_salud.smn_contratante.cnt_fecha_registro
from
	smn_salud.smn_contratante 
where
	smn_salud.smn_contratante.smn_contratante_id = ${fld:id}
