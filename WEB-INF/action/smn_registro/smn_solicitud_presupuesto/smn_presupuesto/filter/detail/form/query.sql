select	
	smn_salud.smn_presupuesto.smn_presupuesto_id,
smn_salud.smn_documento.doc_codigo ||' - '||smn_salud.smn_documento.doc_nombre as smn_documento_id,
	smn_base.smn_baremos.bar_descripcion as smn_baremo_rf,
	smn_salud.smn_presupuesto.pre_numero_control,
	smn_base.smn_entidades.ent_descripcion_corta as smn_entidades_rf,
	 smn_base.smn_sucursales.suc_nombre as smn_sucursales_rf,
	paciente.aux_codigo||' - '|| paciente.aux_descripcion as smn_auxiliar_rf,
	smn_salud.smn_presupuesto.pre_fecha_registro,
	case
		when smn_salud.smn_presupuesto.pre_monto_ml is null then 0 else smn_salud.smn_presupuesto.pre_monto_ml
	end as pre_monto_ml,
	case
		when smn_salud.smn_presupuesto.pre_monto_ma is null then 0 else smn_salud.smn_presupuesto.pre_monto_ma
	end as pre_monto_ma,
	case
		when smn_salud.smn_presupuesto.pre_monto_neto_moneda_local is null then 0 else smn_salud.smn_presupuesto.pre_monto_neto_moneda_local
	end as pre_monto_neto_moneda_local,
	case
		when smn_salud.smn_presupuesto.pre_monto_neto_moneda_alterna is null then 0 else smn_salud.smn_presupuesto.pre_monto_neto_moneda_alterna
	end as pre_monto_neto_moneda_alterna,
	smn_salud.smn_estado_presupuesto.epr_descripcion as status,
	smn_salud.smn_estado_presupuesto.smn_estado_presupuesto_id as estatus,
	smn_salud.smn_ingresos.smn_ingresos_id,
	smn_salud.smn_documento.tca_tipo_tasa as tipotasa,
	smn_salud.smn_documento.doc_maneja_moneda_alt as maneja_mon_alterna,
	paciente.aux_apellidos ||', '|| paciente.aux_nombres as paciente,
	contratante.aux_descripcion as contratante,
	smn_salud.smn_presupuesto.pre_vigencia_hasta,
	smn_salud.smn_presupuesto.smn_ordenes_medicas_id,
	smn_salud.smn_presupuesto.pre_fecha_entrega,
	smn_salud.smn_presupuesto.pre_monto_descuento,
	smn_salud.smn_ordenes_medicas.omd_descripcion,
	smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_base.smn_clase_auxiliar.cla_nombre as smn_clase_auxiliar_rf,
	clase_contra.cla_nombre as smn_clase_ord_rf

from
	smn_salud.smn_presupuesto
	left join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_presupuesto.smn_ingresos_id
	inner join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_presupuesto.smn_documento_id
	left join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_contratante_id = smn_salud.smn_presupuesto.smn_contratante_id
	left join smn_base.smn_auxiliar paciente on paciente.smn_auxiliar_id = smn_salud.smn_presupuesto.smn_auxiliar_rf
	left join smn_base.smn_auxiliar contratante on contratante.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf
	inner join smn_base.smn_baremos on smn_base.smn_baremos.smn_baremos_id = smn_salud.smn_presupuesto.smn_baremo_rf
	inner join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_salud.smn_presupuesto.smn_entidades_rf
	left join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_salud.smn_presupuesto.smn_sucursales_rf
	inner join smn_salud.smn_estado_presupuesto on smn_salud.smn_estado_presupuesto.smn_estado_presupuesto_id = smn_salud.smn_presupuesto.smn_estado_presupuesto_id
	left join smn_salud.smn_ordenes_medicas on smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id = smn_salud.smn_presupuesto.smn_ordenes_medicas_id
	left join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_salud.smn_presupuesto.smn_moneda_rf
	left join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_presupuesto.smn_clase_auxiliar_rf
	left join smn_base.smn_clase_auxiliar clase_contra on clase_contra.smn_clase_auxiliar_id = smn_salud.smn_contratante.smn_clase_auxiliar_rf
where
	smn_presupuesto_id = ${fld:id}
