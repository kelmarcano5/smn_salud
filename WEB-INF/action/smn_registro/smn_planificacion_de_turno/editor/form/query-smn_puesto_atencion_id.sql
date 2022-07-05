select 
	smn_salud.smn_puesto_atencion.smn_puesto_atencion_id as id, 
	smn_salud.smn_puesto_atencion.put_codigo ||' - '|| smn_salud.smn_puesto_atencion.put_descripcion as item 
from smn_salud.smn_puesto_atencion 