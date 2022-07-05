select
select
	case
	when smn_salud.smn_rol.rol_tipo='SO' then '${lbl:b_solicitante}'
	when smn_salud.smn_rol.rol_tipo='AP' then '${lbl:b_autorizador}'
	when smn_salud.smn_rol.rol_tipo='AM' then '${lbl:b_ambos}'
	end as rol_tipo,
select
select
select
select
select
select
	smn_salud.smn_rol.*
from
	smn_salud.smn_rol
where
	smn_rol_id = ${fld:id}
