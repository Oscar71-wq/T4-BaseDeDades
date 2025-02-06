use Ex7;
select t.NumFActura as Factura, t.Dia as Data, t.Hora as Hora, e.Nom as Empleat, SUM(lt.importTotal*p.IVA)
from Ticket as t, Empleat as e, Linia ticket as lt, Producte as p
where e.idEmpleat = t.Empleat_idEmpleat and t.id=lt.idLinia Ticket and p.id=lt.Producte_idProducte
group by t.NumFactura, t.Dia, t.Hora, e.Nom: