select	
	(select smn_base.smn_entidades.ent_codigo || ' - ' || smn_base.smn_entidades.ent_descripcion_corta from  smn_base.smn_entidades  where smn_base.smn_entidades.smn_entidades_id is not null  and smn_base.smn_entidades.smn_entidades_id=smn_salud.smn_presupuesto.smn_entidades_rf  order by smn_base.smn_entidades.ent_descripcion_corta ) as smn_entidades_rf,
	(select smn_base.smn_sucursales.suc_codigo || ' - ' || smn_base.smn_sucursales.suc_nombre from  smn_base.smn_sucursales  where smn_base.smn_sucursales.smn_sucursales_id is not null  and smn_base.smn_sucursales.smn_sucursales_id=smn_salud.smn_presupuesto.smn_sucursales_rf  order by smn_base.smn_sucursales.suc_nombre ) as smn_sucursales_rf,	
	smn_salud.smn_documento.doc_nombre as  smn_documento_id,
	smn_salud.smn_presupuesto.smn_baremo_rf,
	smn_salud.smn_presupuesto.pre_numero_control,
	smn_salud.smn_presupuesto.smn_entidades_rf,
	smn_salud.smn_presupuesto.smn_sucursales_rf,
	smn_salud.smn_presupuesto.smn_auxiliar_rf,
	smn_salud.smn_presupuesto.pre_fecha_registro,
	smn_salud.smn_presupuesto.pre_monto_ml,
	smn_salud.smn_presupuesto.pre_monto_ma,
	smn_salud.smn_presupuesto.smn_presupuesto_id,
	case
		when smn_salud.smn_presupuesto.smn_estado_presupuesto_id = 1 then 'Registrado'
		when smn_salud.smn_presupuesto.smn_estado_presupuesto_id = 2 then 'Generado' 
		when smn_salud.smn_presupuesto.smn_estado_presupuesto_id = 3 then 'Enviado/Entregado'
		when smn_salud.smn_presupuesto.smn_estado_presupuesto_id = 4 then 'Aprobado'
		when smn_salud.smn_presupuesto.smn_estado_presupuesto_id = 5 then 'Rechazado'
	end as status,
	smn_salud.smn_presupuesto.smn_estado_presupuesto_id as status,
	paciente.aux_nombres ||' - '|| paciente.aux_apellidos as nombre_paciente,
	paciente.aux_num_doc_oficial as cedula,
	contratante.aux_nombres ||' - '|| contratante.aux_apellidos as nombre_contratante
		
from
	smn_salud.smn_presupuesto
	inner join smn_base.smn_auxiliar paciente on paciente.smn_auxiliar_id = smn_salud.smn_presupuesto.smn_auxiliar_rf
	left join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_contratante_id = smn_salud.smn_presupuesto.smn_contratante_id
	left join smn_base.smn_auxiliar contratante on contratante.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf
	inner join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_presupuesto.smn_documento_id
where
	smn_salud.smn_presupuesto.smn_presupuesto_id is not null and smn_salud.smn_presupuesto.smn_estado_presupuesto_id in (1,2,3,4)
	and smn_salud.smn_presupuesto.smn_presupuesto_id=${fld:id} 
 	 
order by 
	smn_presupuesto_id desc