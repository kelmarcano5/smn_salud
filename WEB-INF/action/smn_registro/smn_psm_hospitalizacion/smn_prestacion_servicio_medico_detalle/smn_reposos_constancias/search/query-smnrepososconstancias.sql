select
	smn_salud.smn_reposos_constancias.smn_reposos_constancias_id,
	smn_salud.smn_reposos_constancias.smn_ingreso_id,
	smn_base.smn_auxiliar.aux_descripcion as smn_auxiliar_rf,
	smn_salud.smn_diagnostico.dgn_descripcion as smn_diagnostico_rf,
	smn_salud.smn_reposos_constancias.rpc_fecha_desde,
	smn_salud.smn_reposos_constancias.rpc_fecha_hasta,
	smn_salud.smn_reposos_constancias.rpc_fecha_reintegro,
	smn_salud.smn_motivos.mtv_descripcion as rpc_motivo,
	smn_salud.smn_reposos_constancias.rpc_observacion,
	case
		when smn_salud.smn_reposos_constancias.rpc_estatus='RP' then 'En Reposo'
		when smn_salud.smn_reposos_constancias.rpc_estatus='GE' then 'Generado'
	end rpc_estatus,
	case 
		when smn_salud.smn_reposos_constancias.rpc_emision_certificacion ='EM' then '${lbl:b_issue}' 
		when smn_salud.smn_reposos_constancias.rpc_emision_certificacion ='CE' then '${lbl:b_certification}' 
	end as rpc_emision_certificacion,
  medic.aux_codigo ||' - '|| medic.aux_descripcion as smn_medico_auxiliar_rf,
	smn_base.smn_entidades.ent_descripcion_corta as rpc_entidad_emisora,
	smn_salud.smn_reposos_constancias.rpc_numero_reposo_certificado,
	smn_salud.smn_reposos_constancias.rpc_numero_sanidad,
	smn_salud.smn_reposos_constancias.rpc_fecha_registro
	
from
	smn_salud.smn_reposos_constancias
	inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_ingresos_id = smn_salud.smn_reposos_constancias.smn_ingreso_id
	left join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_reposos_constancias.smn_auxiliar_rf
	left join smn_salud.smn_diagnostico on smn_salud.smn_diagnostico.smn_diagnostico_id = smn_salud.smn_reposos_constancias.smn_diagnostico_rf
	left join smn_salud.smn_motivos on smn_salud.smn_motivos.smn_motivos_id = smn_salud.smn_reposos_constancias.rpc_motivo
	left join smn_base.smn_auxiliar medic on medic.smn_auxiliar_id = smn_salud.smn_reposos_constancias.smn_medico_auxiliar_rf
	left join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_salud.smn_reposos_constancias.rpc_entidad_emisora
