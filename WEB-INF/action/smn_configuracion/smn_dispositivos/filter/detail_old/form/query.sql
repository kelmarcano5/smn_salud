select
	case
	when smn_salud.smn_dispositivos.dis_tipo='DI' then '${lbl:b_digitalizador_dis}'
	when smn_salud.smn_dispositivos.dis_tipo='MO' then '${lbl:b_monitor_dis}'
	end as dis_tipo_combo,
select
select
select
select
select
	smn_salud.smn_dispositivos.*
from
	smn_salud.smn_dispositivos
where
	smn_dispositivos_id = ${fld:id}
