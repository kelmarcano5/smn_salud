select
select
select
select
select
select
select
select
select
	smn_base.smn_auxiliar_terceros.atr_descripcion,
	smn_base.smn_clase_auxiliar.cla_nombre,
	case
	when smn_salud.smn_afiliado_titular.afi_estatus='A' then '${lbl:b_afi_activo}'
	when smn_salud.smn_afiliado_titular.afi_estatus='I' then '${lbl:b_afi_inactivo}'
	end as afi_estatus,
	smn_salud.smn_afiliado_titular.*
from
	smn_base.smn_auxiliar_terceros,
	smn_base.smn_clase_auxiliar,
	smn_salud.smn_afiliado_titular
where
	smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id = smn_salud.smn_afiliado_titular.afi_auxiliar_rf and
	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_afiliado_titular.afi_clase_auxiliar_rf and
	smn_afiliados_id = ${fld:id}
