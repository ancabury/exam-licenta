use [exam-licenta]
/*
insert into scena (id, denumire)
values (1, 'Cluj Arena'),
	   (2, 'Piata unirii'),
	   (3, 'Parcul central'),
	   (4, 'Iulius Mall'),
	   (5, 'Polus')

insert into gent_muzical (id, denumire)
values (1, 'electro hip hop'),
		(2, 'clasica'),
		(3, 'simfonica'),
		(4, 'dubstep')

insert into artist (id, nume, gen_muzica, scena, ora, zi)
values (1, 'Dimitri Vegas & Like Mike', 1, 1, 22, '1 august 2015'),
	   (2, 'Armin', 4, 1, 23, '1 august 2015'),
	   (3, 'David Guetta', 1, 3, 2, '4 august 2015'),
	   (4, 'Avicii', 1, 4, 1, '3 august 2015')

insert into tip (id, pret, denumire)
values (1, 12, 'early bird'),
	    (2, 30, 'full price'),
		(3, 25, 'pay with blood')

insert into bilet (cod, tip, varsta)
values (999, 3, 22),
		(1010, 3, 23),
		(1111, 3, 22),
	    (111, 1, 30),
		(222, 2, 70),
		(333, 3, 60),
		(444, 3, 74),
		(555, 1, 21),
		(666, 2, 24),
		(777, 2, 18),
		(888, 3, 23)
		
insert into intrare (id_artist, cod_bilet)
values (1, 999),
	   (2, 999),
	   (1, 1010),
	   (3, 1010),
	   (4, 1111),
	   (4, 999),
	   (1, 111),
	   (1, 444),
	   (1, 555),
	   (1, 888),
	   (1, 777),
	   (1, 333),
	   (2, 111),
	   (2, 666),
	   (2, 444),
	   (3, 111),
	   (4, 777)*/

-- Programul festivalului (nume artist, ora incepere concert) din 1 august 2015 pe scena Cluj Arena
select a.nume, a.ora
from artist a
inner join scena s
on a.scena = s.id
where a.zi like '1 august 2015'
and s.denumire like 'Cluj Arena'

-- Scenele (numele) pe care s-a cantat muzica electro hip hop SI care au gazduit concerte la care a venit cel putin 1 participant trecut de 70 de ani
select s.denumire
from scena s
inner join artist a on a.scena = s.id
where a.gen_muzica in (select id from gent_muzical where denumire like 'electro hip hop')
and a.id in (select i.id_artist from intrare i
			 inner join bilet b on b.cod = i.cod_bilet
			 where b.varsta > 70)

-- Artistul (numele) care a avut cei mai multi participanti cu varsta între 18 si 24 de ani cu bilete de tip pay with blood
select a.nume, i.cod_bilet
from artist a
inner join intrare i on i.id_artist = a.id
inner join bilet b on b.cod = i.cod_bilet
where b.varsta >= 18 and b.varsta <= 24
and b.tip in (select id from tip where denumire like 'pay with blood')
group by a.nume, i.cod_bilet having count(*) = (select max(nr) 
												from (select count(*) as nr, a.id from bilet b
												inner join intrare i on i.cod_bilet = b.cod
												inner join artist a on i.id_artist = a.id
												where b.varsta >= 18 and b.varsta <= 24
												and b.tip in (select id from tip where denumire like 'pay with blood')
												group by a.id) t)