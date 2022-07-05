select
select
select
select
	case
	when smn_salud.smn_contrato_modulo.smn_descuento_rf='SI' then '${lbl:b_yes}'
	when smn_salud.smn_contrato_modulo.smn_descuento_rf='No' then '${lbl:b_not}'
	end as smn_descuento_rf,
	smn_salud.smn_contrato_modulo.*
from
	smn_salud.smn_contrato_modulo
where
	smn_contrato_modulo_id = ${fld:id}
