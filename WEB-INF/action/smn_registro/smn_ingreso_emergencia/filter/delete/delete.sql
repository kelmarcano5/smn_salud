delete from smn_salud.smn_ingresos where smn_ingresos_id = ${fld:id};

delete from smn_salud.smn_ingreso_movimiento where smn_ingreso_id = ${fld:id} and inm_estatus != 'PR'
