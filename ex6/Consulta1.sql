use ex6;
select p.Nom as Nom, p.Cognoms as cognoms, p.DNI as DNI, v.Telefon as "num vol", v.Origen, v.Desti as Desti, r.import as import 
from Passatgers as p, Vol as v, Reserva r
where p.idPassatgers=r.Passatger_idPassatger and v.idVol=r.Vol_idVol;
