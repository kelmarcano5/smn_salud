select
		smn_salud.smn_ingresos.igs_estatus_financiero
from
		smn_salud.smn_ingresos
where
		smn_salud.smn_ingresos.igs_ticket = ${fld:igs_ticket}
