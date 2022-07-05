UPDATE smn_salud.smn_coberturas_servicios SET
	smn_coberturas_id=${fld:smn_coberturas_id},
	smn_unidades_servicios_id=${fld:smn_unidades_servicios_id}

WHERE
	smn_coberturas_servicios_id=${fld:id}

