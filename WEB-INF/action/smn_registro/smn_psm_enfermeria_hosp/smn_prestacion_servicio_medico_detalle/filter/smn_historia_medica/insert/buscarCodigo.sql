select
		smn_base.smn_condicion_financiera.cfi_codigo
from
		smn_base.smn_condicion_financiera
where
		upper(smn_base.smn_condicion_financiera.cfi_codigo) = upper(${fld:cfi_codigo})
