select
		smn_salud.smn_dispositivos.dis_nombre
from
		smn_salud.smn_dispositivos
where
		upper(smn_salud.smn_dispositivos.dis_nombre) = upper(${fld:dis_nombre})
