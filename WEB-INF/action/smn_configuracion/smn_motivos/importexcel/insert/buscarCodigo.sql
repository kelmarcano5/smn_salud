select
		smn_salud.smn_motivos.mtv_codigo
from
		smn_salud.smn_motivos
where
		upper(smn_salud.smn_motivos.mtv_codigo) = upper(${fld:mtv_codigo})
