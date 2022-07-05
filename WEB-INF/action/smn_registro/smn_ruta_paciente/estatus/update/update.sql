UPDATE smn_salud.smn_ruta_paciente SET
	rta_estatus=upper(${fld:estatus}),
	rta_observacion=${fld:observacion}

WHERE
	rta_ticket=${fld:ticket} and rta_secuencia IN (1,2) and smn_auxiliar_rf=${fld:auxiliar};

