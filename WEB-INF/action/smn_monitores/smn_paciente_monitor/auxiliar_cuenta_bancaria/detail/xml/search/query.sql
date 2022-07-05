select
select
select
select
select
	smn_base.smn_entidades_financieras.efi_nombre,
	smn_base.smn_tipo_cuenta_banco.tcb_descripcion,
	smn_base.smn_auxiliar_cuenta_bancaria.*
from
	smn_base.smn_auxiliar_cuenta_bancaria
	left outer join smn_base.smn_entidades_financieras on smn_base.smn_entidades_financieras.smn_entidades_financieras_id = smn_base.smn_auxiliar_cuenta_bancaria.acb_banco_pertenece
	left outer join smn_base.smn_tipo_cuenta_banco on smn_base.smn_tipo_cuenta_banco.smn_tipo_cuenta_banco_id = smn_base.smn_auxiliar_cuenta_bancaria.acb_tipo_cta_banco
where
	smn_auxiliar_cuenta_bancaria_id = ${fld:id}
