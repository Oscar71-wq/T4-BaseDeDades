Use  exercici5;
select c.idCita as num, c.Data as fecha, v.Marca as marca, v.Model as modelo, cl.Noms
from Cita as c, Vehicle as v, Clients as cl
where v.idVehicle=c.Vehicle_idVehicle and cl.idClients=v.Clients_idClients and c.Data>"20/12/2025";