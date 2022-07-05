select
		smn_salud.smn_origen.ori_codigo
from
		smn_salud.smn_origen
where
		upper(smn_salud.smn_origen.ori_codigo) = upper(${fld:ori_codigo})
