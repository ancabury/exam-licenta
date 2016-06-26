use [exam-licenta]
/*
insert into ingredient (id, nume, categorie, unitate_de_masura, nr_calorii)
values (1, 'Faina', 'solid', 'g', 100),
	   (2, 'Vanilie', 'aromatizant', 'ml', 1),
	   (3, 'Rom', 'aromatizant', 'ml', 1),
	   (4, 'Dojdie', 'solid', 'g', 23),
	   (5, 'Lapte', 'lichid', 'ml', 50),
	   (6, 'Zahar', 'indulcitor', 'g', 10)

insert into prajitura (cod, denumire, descriere)
values (111, 'Tiramisu', 'ft buna'),
	   (222, 'Parlament', 'ft buna'),
	   (333, 'Profiterol', 'ft buna'),
	   (444, 'Prajitura cu visine', 'ft buna')

insert into reteta (id, ingredient, prajitura, cantitate)
values (8, 6, 333, 150),
	   (9, 3, 444, 150),
	   (6, 6, 444, 150),
	   (7, 6, 111, 50),
	   (2, 2, 444, 100),
	   (3, 2, 111, 10),
	   (4, 3, 111, 10),
	   (5, 5, 444, 150)*/

-- Lista tuturor ingredientelor (nume, categorie ingredient, unitate de masura, cantitate) pentru «Tiramisu»
--
select i.nume, i.categorie, i.unitate_de_masura, r.cantitate
from ingredient i
inner join reteta r on r.ingredient = i.id
where r.prajitura = (select cod from prajitura where denumire like 'Tiramisu')

--  Codul si numele prajiturilor care contin orice tip de indulcitor dar nu contin aromatizantul vanilie
select distinct p.cod, p.denumire
from prajitura p
inner join reteta r on r.prajitura = p.cod
where r.ingredient in (select id from ingredient where categorie like 'indulcitor')
and p.cod not in (select distinct prajitura from reteta
			  where ingredient in (select id from ingredient where categorie like 'aromatizant' and nume like 'Vanilie'))

--  Codul si numele prajiturilor care au mai putin de 500 calorii.
select distinct p.cod, p.denumire
from prajitura p
inner join reteta r on r.prajitura = p.cod
group by p.cod, p.denumire having (select sum(i.nr_calorii)
								   from ingredient i inner join reteta r on r.ingredient = i.id
								   where r.prajitura = p.cod
								   group by r.prajitura) < 100
