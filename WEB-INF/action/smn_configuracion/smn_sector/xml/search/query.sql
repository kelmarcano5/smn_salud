
select
		smn_salud.smn_sector.smn_sector_id,
	smn_salud.smn_sector.sec_codigo,
	smn_salud.smn_sector.sec_descripcion,
	smn_salud.smn_sector.smn_pais_rf as smn_pais_rf,
	smn_salud.smn_sector.smn_entidades_federales_rf as smn_entidades_federales_rf,
	smn_salud.smn_sector.smn_ciudades_rf as smn_ciudades_rf,
	smn_salud.smn_sector.smn_municipios_rf as smn_municipios_rf,
	smn_parroquias_rf as smn_parroquias_rf,
	smn_zonas_postales_rf as smn_zonas_postales_rf,
	smn_salud.smn_sector.sec_fecha_registro
	
from
	smn_salud.smn_sector
