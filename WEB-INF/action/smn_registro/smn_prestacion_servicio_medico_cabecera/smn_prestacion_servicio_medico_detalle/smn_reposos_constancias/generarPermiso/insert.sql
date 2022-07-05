INSERT INTO smn_control_acceso.smn_solicitud_permisos
(
	smn_solicitud_permisos_id,
	smn_personal_id,
	spe_documento_rf,
	spe_categoria_justif_rf,
	spe_fecha_desde,
	spe_fecha_hasta,
	spe_cantidad_horas,
	spe_estatus_rf,
	spe_jefe_inmediato_rf,
	spe_detalles,
	spe_causa,
	spe_idioma,
	spe_usuario,
	spe_fecha_registro,
	spe_hora,
	spe_cantidad_dias
)
select
nextval('smn_control_acceso.seq_smn_solicitud_permisos'),
smn_control_acceso.smn_personal.smn_personal_id,
(select smn_documentos_id from smn_gip.smn_documentos where dcm_tipo='PE'),
smn_salud.smn_documento.smn_categoria_justificacion_rf,
smn_salud.smn_reposos_constancias.rpc_fecha_desde,
smn_salud.smn_reposos_constancias.rpc_fecha_hasta,
(smn_salud.smn_reposos_constancias.rpc_fecha_hasta-smn_salud.smn_reposos_constancias.rpc_fecha_desde)*8,
'PEN',
smn_base.smn_estructura_organizacional.eor_aprobador,
smn_salud.smn_reposos_constancias.rpc_observacion,
'',
'${def:locale}',
'${def:user}',
{d '${def:date}'},
'${def:time}',
(smn_salud.smn_reposos_constancias.rpc_fecha_hasta-smn_salud.smn_reposos_constancias.rpc_fecha_desde)
from 
smn_salud.smn_reposos_constancias
inner join smn_control_acceso.smn_personal on smn_control_acceso.smn_personal.psl_auxiliar_rf=smn_salud.smn_reposos_constancias.smn_auxiliar_rf
inner join smn_base.smn_estructura_organizacional on smn_base.smn_estructura_organizacional.smn_estructura_organizacional_id=smn_control_acceso.smn_personal.psl_estructura_organizacional_rf
inner join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_ingresos_id=smn_salud.smn_reposos_constancias.smn_ingreso_id
inner join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id=smn_salud.smn_ingresos.smn_documento_id
where
smn_salud.smn_reposos_constancias.smn_reposos_constancias_id=${fld:id};

update smn_salud.smn_reposos_constancias set rpc_estatus='GE'
	where smn_reposos_constancias_id=${fld:id};