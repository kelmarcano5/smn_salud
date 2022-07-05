select smn_base.smn_auxiliar.smn_auxiliar_id as id, smn_base.smn_auxiliar.aux_nombres || '  ' ||  smn_base.smn_auxiliar.aux_apellidos as item from smn_base.smn_auxiliar 
where smn_base.smn_auxiliar.smn_clase_auxiliar_rf = 47
order by smn_base.smn_auxiliar.smn_auxiliar_id desc
