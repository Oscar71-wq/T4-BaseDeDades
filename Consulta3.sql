use ex6;
select count(a.idAvio), a.Marca as Marca, a.Model as Model, a.Capacitat as Capacitat, v.Numero as Numero, v.Origen as Origen, v.Desti as Desti,
v.HSortida as "Hora de Sortida", v.HArribada as "Hora d'arribada"
from Avio as a
where Avio.Marca like "Airbus%";

