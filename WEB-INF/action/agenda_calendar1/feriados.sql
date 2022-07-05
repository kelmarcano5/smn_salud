select
	smn_base.smn_feriados.fer_pais,
	smn_base.smn_feriados.fer_entidad_federal,
	to_date(smn_base.smn_feriados.fer_feriado || '/' || EXTRACT(YEAR FROM now()), 'dd/MM/yyyy') as fecha
from
	smn_base.smn_feriados