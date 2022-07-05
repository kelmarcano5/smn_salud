with saldo as (
	select 
		SUM(smn_salud.smn_ingreso_movimiento.inm_monto_ml) as monto_ml,
		SUM(smn_salud.smn_ingreso_movimiento.inm_monto_ma) as monto_ma
	from 
		smn_salud.smn_ingreso_movimiento where smn_salud.smn_ingreso_movimiento.smn_ingreso_id=${fld:ingresoid}
)
UPDATE smn_salud.smn_ingresos set 
			igs_monto_moneda_local=saldo.monto_ml,
			igs_monto_moneda_alterna=saldo.monto_ma
from saldo
where smn_salud.smn_ingresos.smn_ingresos_id=${fld:ingresoid};