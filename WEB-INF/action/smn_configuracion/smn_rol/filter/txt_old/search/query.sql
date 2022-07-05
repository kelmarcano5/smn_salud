select
		smn_salud.smn_rol.smn_rol_id,
	case
	when smn_salud.smn_rol.rol_tipo='SO' then '${lbl:b_solicitante}'
	when smn_salud.smn_rol.rol_tipo='AP' then '${lbl:b_autorizador}'
	when smn_salud.smn_rol.rol_tipo='AM' then '${lbl:b_ambos}'
	end as rol_tipo,

	smn_salud.smn_rol.smn_usuario_id,
	smn_salud.smn_rol.rol_tipo,
	smn_salud.smn_rol.smn_corporacion_rf,
	smn_salud.smn_rol.smn_entidad_rf,
	smn_salud.smn_rol.smn_sucursal_rf,
	smn_salud.smn_rol.smn_area_servicio_rf,
	smn_salud.smn_rol.rol_fecha_registro,
	smn_salud.smn_rol.smn_estructura_organizacional_rf,
	smn_salud.smn_rol.smn_unidad_servicio_rf
	
from
	smn_salud.smn_rol
