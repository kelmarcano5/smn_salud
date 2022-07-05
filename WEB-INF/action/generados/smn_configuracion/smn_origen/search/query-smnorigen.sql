select
	case
		when smn_salud.smn_origen.ori_tipo='CT' then 'Cita'
		when smn_salud.smn_origen.ori_tipo='IG' then 'Ingreso'
	end as ori_tipo_combo,
	smn_salud.smn_origen.ori_codigo,
	smn_salud.smn_origen.ori_descripcion,
	smn_salud.smn_origen.ori_tipo,
	smn_salud.smn_origen.ori_fecha_registro

from 
	smn_salud.smn_origen
