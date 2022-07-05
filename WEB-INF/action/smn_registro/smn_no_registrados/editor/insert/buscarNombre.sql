select
		smn_salud.smn_no_registrados.nfi_nombres
from
		smn_salud.smn_no_registrados
where
		upper(smn_salud.smn_no_registrados.nfi_nombres) = upper(${fld:nfi_nombres})
