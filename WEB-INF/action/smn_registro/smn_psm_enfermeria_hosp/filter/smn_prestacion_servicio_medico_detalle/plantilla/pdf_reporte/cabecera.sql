SELECT
	smn_salud.smn_ingresos.igs_num_ingreso,
	smn_base.smn_auxiliar.aux_nombres ||' '|| smn_base.smn_auxiliar.aux_apellidos AS smn_auxiliar_rf_combo,
	smn_base.smn_auxiliar.aux_num_doc_oficial as cedula,
	case
		when smn_base.smn_auxiliar.aux_sexo='MA' then 'Masculino'
		when smn_base.smn_auxiliar.aux_sexo='FE' then 'Femenino'
	end as sexo,
	date_part('year', Age(smn_base.smn_auxiliar.aux_fecha_nac)) as edad,
	smn_salud.smn_ingresos.igs_fecha_ingreso as fecha_ingreso
FROM
	smn_salud.smn_salud_plantilla_cabecera
	INNER JOIN
	smn_salud.smn_ingresos ON smn_salud.smn_ingresos.smn_ingresos_id=smn_salud.smn_salud_plantilla_cabecera.smn_ingreso_id
	INNER JOIN
	smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id=smn_salud.smn_ingresos.smn_auxiliar_rf
WHERE
	smn_salud.smn_salud_plantilla_cabecera.smn_salud_plantilla_cabecera_id=${fld:id}
