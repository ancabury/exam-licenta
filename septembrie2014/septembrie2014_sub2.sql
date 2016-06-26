--insert into oferta (id, denumire, descriere, salar) 
--values (1, 'dev', 'developer', 3000),
--		(2, 'tester', 'tester', 2459),
--		(3, 'PM', 'Project Manager', 5000),
--		(4, 'Designer', 'Designer', 2500)

--insert into competenta (id, nume)
--values (66, 'MySQL'),
--		(77, 'Oracle')
--		(11, 'C1'),
--		(22, 'C2'),
--		(33, 'C3'),
--		(44, 'C4'),
--		(55, 'C5')

--insert into oferta_competente (id_oferta, id_competenta)
--values (1, 77),
--		(1, 66),
--		(1, 11),
--		(2, 22),
--		(2, 77),
--		(3, 66),
--		(4, 77),
--		(4, 66),
--		(4, 22),
--		(4, 33)

--insert into firmaIT (id, nume, id_oferta)
--values (111, 'Pitech+Plus', 1),
--		(222, 'Endava', 2),
--		(333, 'Rodeapps', 3),
--		(444, 'Pitech+Plus', 4)

--insert into persoane (cnp, nume)
--values ('1234', 'anca'),
--		('1235', 'dan'),
--		('1236', 'bogdan'),
--		('1237', 'luci'),
--		('1238', 'bibi'),
--		('1239', 'cristi')

--insert into oferta_pers (id_oferta, cnp_pers)
--values (1, '1234'),
--		(1, '1235'),
--		(1, '1236'),
--		(3, '1239'),
--		(4, '1234'),
--		(4, '1238'),
--		(4, '1237')


-- Oferte de munca (denumire, descriere, numele si pagina web a firmei ce ofera locul de munca) unde sunt necesare competente in MySQL si Oracle. 

select O.id, O.denumire, O.descriere, F.nume, F.[pagina web]
from oferta O, oferta_competente C, firmaIT F
where O.id = F.id_oferta and
	  O.id = C.id_oferta and
	  C.id_competenta in (select id from competenta where nume like 'MySQL') and
	  O.id in (select O.id from oferta O, oferta_competente OC 
				where O.id = OC.id_oferta and
					OC.id_competenta in (select id from competenta where nume like 'Oracle'))

-- Pentru locurile de munca la care candideaza cele mai multe persoane se cere denumirea locului de munca, numele firmei, numarul de persoane inscrise.
select distinct O.denumire, F.nume, n.number
from oferta O, firmaIT F,oferta_pers OP,
	(select max(num) as number
		from (select count(*) as num from oferta_pers group by id_oferta) as t) as n
where O.id = F.id_oferta and OP.id_oferta = O.id
group by OP.id_oferta, O.denumire, F.nume, OP.cnp_pers, O.id, n.number having (select count(*) from oferta_pers where id_oferta = O.id) = 		
			(select max(num)
			from (select count(*) as num from oferta_pers group by id_oferta) as t)