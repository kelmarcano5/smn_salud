delete from smn_salud.smn_rel_coberturas_unidades_servicios WHERE smn_coberturas_id= ${fld:id}
delete from smn_salud.smn_rel_cobertura_horario WHERE smn_coberturas_id= ${fld:id};
delete from smn_salud.smn_rel_cobertura_localidad WHERE smn_coberturas_id= ${fld:id};	
delete from smn_salud.smn_coberturas where smn_coberturas_id = ${fld:id};
