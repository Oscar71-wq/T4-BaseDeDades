use Ex7;
Select count(lt.idLinia Ticket) as "numero de linies de tiket"
from Linia Ticket as lt, Empleat as e, Ticket as t
where t.Empleat_idEmpleat=e.idEmpleat and t.idLinia Ticket=lt.Ticket_idTicket and e.nom like "J";
