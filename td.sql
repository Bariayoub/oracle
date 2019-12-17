--Exeercice 1
--01
select *
from AIRPLANE
where Capacity>350;
--02
select NumAP,NameAP 
from AIRPLANE
where INITCAP(localisation)='Nice';
--03
select NumP,Dep_T
from FLIGHT;
--04
select *
from PILOT;
--05
select Namep
from PILOT 
where Salary>15000
and INITCAP(Address)='Paris';
--06
select NameAp,NumAP
from AIRPLANE
where INITCAP(localisation)='Nice' or Capacity<350;
--07
select *
from FLIGHT
where INITCAP(Dep_T)='Nice'
and INITCAP(Arr_T)='Paris' and Arr_H-Dep_h=18;
--08
select p.NumP
from PILOT p, FLIGHT f 
where p.NumP <> f.NumP;
--09
select NumF,Dep_T
FROM FLIGHT
where NumP=100 and NumP=204;
--Exercice 2
--01
select Personne 
from Emprunt 
where Livre='Recueil Examens BD';
--02
select p.Personne
from Emprunt p, Retard r
where p.Personne is not r.Personne;
--03
SELECT t.Personne
FROM Emprunt t 
WHERE NOT EXISTS 
( SELECT * FROM Emprunt u WHERE NOT EXISTS 
                        ( SELECT * FROM Emprunt v WHERE v.Personne=t.Personne));
--04
SELECT t.Livre FROM Emprunt t
WHERE NOT EXISTS 
                                ( SELECT * FROM Emprunt u
                                WHERE NOT EXISTS 
                                                               ( SELECT * FROM Emprunt v
                                                               WHERE u.Livre=t.Livre 
                                                               AND v.Personne=u.Personne
                                                                )
                                 )
--05
SELECT t.Personne FROM Emprunt t
WHERE NOT EXISTS 
                               (SELECT * FROM Emprunt u 
                               WHERE u.Personne=t.Personne
                               AND NOT EXISTS 
                                                          (SELECT * FROM Retard v 
                                                          WHERE v.Personne=u.Personne
                                                          AND v.Livre=u.Livre 
                                                           )
                                 )  
