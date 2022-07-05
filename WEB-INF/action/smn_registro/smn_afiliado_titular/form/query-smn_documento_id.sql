select
	 smn_base.smn_clase_auxiliar.cla_codigo|| ' - ' || smn_base.smn_clase_auxiliar.cla_nombre as cla_nombre_combo,
	
	 smn_base.smn_auxiliar_terceros.atr_codigo || ' - ' ||  smn_base.smn_auxiliar_terceros.atr_descripcion as atr_descripcion_combo
	 
	from  smn_base.smn_clase_auxiliar , smn_base.smn_auxiliar_terceros,  smn_salud.smn_afiliado_titular
	
where
	smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id = smn_salud.smn_afiliado_titular.afi_auxiliar_rf and
	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_afiliado_titular.afi_clase_auxiliar_rf
