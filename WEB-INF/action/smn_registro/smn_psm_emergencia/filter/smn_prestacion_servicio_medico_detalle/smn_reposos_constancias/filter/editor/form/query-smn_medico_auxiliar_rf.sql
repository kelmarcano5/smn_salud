select smn_base.smn_auxiliar.smn_auxiliar_id as id, smn_base.smn_auxiliar.aux_codigo || ' - ' ||  smn_base.smn_auxiliar.aux_descripcion as item from smn_base.smn_auxiliar 
inner join smn_base.smn_auxiliar_clase on smn_base.smn_auxiliar_clase.smn_auxiliar_id = smn_base.smn_auxiliar.smn_auxiliar_id
inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_base.smn_auxiliar_clase.smn_clase_auxiliar_id
where upper(smn_base.smn_clase_auxiliar.cla_codigo)=upper('MD')
order by smn_base.smn_auxiliar.aux_codigo 