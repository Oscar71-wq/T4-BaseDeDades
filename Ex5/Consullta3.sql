use exercici5;
Select * 
from Cita, Clients, Treballador, Vehicle
where Clients.idClients=Vehicle.Clients_idClients and Vehicle_idVehicle=Cita.Vehicle_idVehicle and Treballador_idTreballador=Cita.Treballador_idTreballador