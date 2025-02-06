use ex6;
select r.idReserves as "Numero de reserva", p.Nom as Nom, p.Cognoms as Cognoms, v.Numero as "Numero de Vol"
from Reserves as r, Passatgers as p, Vols as v
where r.Passatgers_idPassatgers=p.idPassatgers and r.Vols_idVols=idVols
