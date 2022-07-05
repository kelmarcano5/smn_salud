select
	smn_salud.smn_ingresos.igs_num_ingreso,
	(select smn_base.smn_auxiliar_persona_natural.ant_num_doc_oficial || ' - ' || smn_base.smn_auxiliar_persona_natural.ant_nombres || ' - ' || smn_base.smn_auxiliar_persona_natural.ant_apellidos from smn_base.smn_auxiliar_persona_natural where smn_base.smn_auxiliar_persona_natural.smn_auxiliar_persona_natural_id = smn_salud.smn_ingresos.smn_auxiliar_rf) as paciente,
	contratante.aux_descripcion as contratante,
	smn_salud.smn_ingresos.smn_unidades_servicios_rf,
	smn_salud.smn_ingresos.smn_areas_servicios_rf,
	smn_salud.smn_ingresos.igs_ticket,
	smn_salud.smn_ingresos.igs_monto_moneda_local as monto_ingreso_ml,
	smn_salud.smn_ingresos.igs_monto_moneda_alterna as monto_ingreso_ma,
	smn_salud.smn_ingresos.igs_monto_cobertura as monto_cobertura_ml,
	smn_salud.smn_ingresos.igs_monto_cobertura_ma as monto_cobertura_ma,
	 smn_salud.smn_ingresos.igs_monto_moneda_local as monto_saldo_ml,
	smn_salud.smn_ingresos.igs_monto_moneda_alterna as monto_saldo_ma,
	to_char(smn_salud.smn_ingresos.igs_fecha_registro, 'YYYY-MM-DD') as igs_fecha_registro,
	smn_salud.smn_ingresos.smn_ingresos_id as smn_ingreso_id,
	case
		when smn_salud.smn_ingresos.igs_estatus_financiero='PE' then '${lbl:b_pend}'
		when smn_salud.smn_ingresos.igs_estatus_financiero='PA' then 'Pagado'
		when smn_salud.smn_ingresos.igs_estatus_financiero='AT' then 'Atendido'
	end as igs_estatus_financiero,
	smn_salud.smn_habitaciones.hab_codigo ||' '|| smn_salud.smn_habitaciones.hab_descripcion as cubiculo,
	contratante.aux_benef_pago as medico,
	smn_salud.smn_ingresos.smn_doc_orig as smn_presupuesto_id,
	smn_salud.smn_ingresos.smn_auxiliar_rf as paciente2,
	smn_salud.smn_ingresos.igs_hora_salida
from 
		smn_salud.smn_ingresos
		inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_ingresos.smn_auxiliar_rf
		inner join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_contratante_id = smn_salud.smn_ingresos.smn_contratante_id
		inner join smn_base.smn_auxiliar contratante on contratante.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf
		inner join smn_salud.smn_habitaciones on  smn_salud.smn_habitaciones.smn_habitaciones_id = smn_salud.smn_ingresos.smn_activo_fijo
		left join smn_salud.smn_presupuesto on smn_salud.smn_presupuesto.smn_presupuesto_id = smn_salud.smn_ingresos.smn_doc_orig
where
	  smn_salud.smn_ingresos.smn_ingresos_id is not null and
	  smn_salud.smn_ingresos.smn_entidades_rf = ${fld:entidad_prestador} and 
	  smn_salud.smn_ingresos.smn_sucursales_rf = ${fld:sucursal_prestador} and
	  smn_salud.smn_ingresos.smn_areas_servicios_rf = ${fld:area_prestador} and
	  smn_salud.smn_ingresos.smn_unidades_servicios_rf = ${fld:unidad_prestador}
	${filter}
order by 
	smn_salud.smn_ingresos.smn_ingresos_id desc
