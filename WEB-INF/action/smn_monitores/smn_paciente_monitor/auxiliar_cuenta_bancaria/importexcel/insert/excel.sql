INSERT INTO smn_base.smn_auxiliar_cuenta_bancaria
(
	smn_auxiliar_cuenta_bancaria_id,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	acb_num_cuenta,
	acb_tipo_cta_banco,
	acb_banco_pertenece,
	acb_fecha_registro
)
VALUES
(
	${seq:nextval@smn_base.seq_smn_auxiliar_cuenta_bancaria},
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
