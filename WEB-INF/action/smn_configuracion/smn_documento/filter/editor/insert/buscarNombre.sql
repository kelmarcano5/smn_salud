select
		smn_salud.smn_documento.doc_nombre
from
		smn_salud.smn_documento
where
		upper(smn_salud.smn_documento.doc_nombre) = upper(${fld:doc_nombre})
