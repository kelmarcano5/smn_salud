select smn_salud.smn_documento.smn_documento_id as id, smn_salud.smn_documento.dcf_codigo|| ' - ' || smn_salud.smn_documento.dcf_descripcion as item from smn_salud.smn_documento 
order by smn_salud.smn_documento.smn_documento_id