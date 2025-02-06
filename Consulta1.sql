use Ex7;
select p.idProducte as Codi, p.Nom as Producte, p.Descripcio as Descripcio, p.Preu as "preu unitari", p.IVA as IVA, p.CodiBarres as "codi barres"
from Producte as p
where p.IVA="21%" and p.CodiBarres like "84%";
