select
		smn_salud.smn_dispositivos.dis_codigo
from
		smn_salud.smn_dispositivos
where
		upper(smn_salud.smn_dispositivos.dis_codigo) = upper(${fld:dis_codigo})
