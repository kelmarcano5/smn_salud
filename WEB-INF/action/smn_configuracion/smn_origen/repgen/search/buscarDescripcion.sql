select
		smn_salud.smn_origen.ori_descripcion
from
		smn_salud.smn_origen
where
		upper(smn_salud.smn_origen.ori_descripcion) = upper(${fld:ori_descripcion})
