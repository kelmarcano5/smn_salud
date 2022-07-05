select
	smn_base.smn_entidades_financieras.efi_nombre,
	smn_base.smn_tipo_cuenta_banco.tcb_descripcion,
	smn_base.smn_auxiliar_cuenta_bancaria.smn_auxiliar_cuenta_bancaria_id,
	smn_base.smn_auxiliar.aux_nombres||'-'||smn_base.smn_auxiliar.aux_apellidos as smn_auxiliar_rf,
	smn_base.smn_clase_auxiliar.cla_codigo||'-'||smn_base.smn_clase_auxiliar.cla_nombre as smn_clase_auxiliar_rf,
	smn_base.smn_auxiliar_cuenta_bancaria.acb_num_cuenta,
	smn_base.smn_auxiliar_cuenta_bancaria.acb_tipo_cta_banco,
	smn_base.smn_auxiliar_cuenta_bancaria.acb_banco_pertenece,
	smn_base.smn_auxiliar_cuenta_bancaria.acb_fecha_registro
	
from
	smn_base.smn_auxiliar_cuenta_bancaria
	left outer join smn_base.smn_entidades_financieras on smn_base.smn_entidades_financieras.smn_entidades_financieras_id = smn_base.smn_auxiliar_cuenta_bancaria.acb_banco_pertenece
	left outer join smn_base.smn_tipo_cuenta_banco on smn_base.smn_tipo_cuenta_banco.smn_tipo_cuenta_banco_id = smn_base.smn_auxiliar_cuenta_bancaria.acb_tipo_cta_banco
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id=smn_base.smn_auxiliar_cuenta_bancaria.smn_auxiliar_rf
	left outer join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_base.smn_auxiliar_cuenta_bancaria.smn_clase_auxiliar_rf
where 
	smn_base.smn_auxiliar_cuenta_bancaria.smn_auxiliar_rf=${fld:id}