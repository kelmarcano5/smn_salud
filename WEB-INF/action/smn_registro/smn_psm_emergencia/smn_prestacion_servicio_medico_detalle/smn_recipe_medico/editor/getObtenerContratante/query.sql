SELECT
	smn_salud.smn_contratante.smn_contratante_id AS ID,
	smn_base.smn_auxiliar.aux_codigo || ' - ' || smn_base.smn_auxiliar.aux_descripcion AS item 
FROM
	smn_salud.smn_contratante
	LEFT OUTER JOIN smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf
	LEFT JOIN smn_base.smn_clase_auxiliar ON smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_contratante.smn_clase_auxiliar_rf
	INNER JOIN smn_salud.smn_afiliado_titular ON smn_salud.smn_afiliado_titular.smn_contratante_id = smn_salud.smn_contratante.smn_contratante_id 
WHERE
	smn_salud.smn_afiliado_titular.afi_auxiliar_rf=${fld:id}