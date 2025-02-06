use Exercici4;
select count(*) as numpolisses
from Polissa, Client
where Client.idClient=Polissa.Client_idClient and Client.Nom like "%Juan%";