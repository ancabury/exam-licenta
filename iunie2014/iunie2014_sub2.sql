/*use [exam-licenta]

insert into firma (id, nume, pagina_web)
values (111, 'Pitech+Plus', 'www.pitech+plus.com'),
	   (222, 'Endava', 'www.endava.com'),
	   (333, 'Rodeapps', 'www.rodeapps.com'),
	   (444, 'Softvision', 'www.softvision.com')

insert into bursa (id,denumire, firma, locuri, luni, valoare)
values ('BM', 'Bursa M', 111, 10, 5, 150),
	   ('BT', 'Bursa T', 333, 5, 12, 200),
	   ('BA', 'Bursa A', 222, 2, 6, 400),
	   ('BB', 'Bursa B', 111, 10, 12, 250),
	   ('BC', 'Bursa C', 444, 20, 12, 100)

insert into student (cnp, nume, grupa, an, specializare, nota)
values ('2931224055060', 'Anca', 236, 3, 'Info', 9.85),
	   ('1940801045064', 'Dan', 4, 3, 'Automatica', 9.60),
	   ('1940922545688', 'Bodan', 231, 3, 'Info', 9.95),
	   ('1931222556458', 'Cristi', 231, 3, 'Info', 9.50),
	   ('1940825464654', 'Luci', 234, 3, 'Info', 9.30),
	   ('1909065746462', 'Bianca', 255, 2, 'Master', 10),
	   ('1940513654658', 'Iuli', 236, 3, 'Info', 8.50)

insert into bursa_student (id_bursa, id_student)
values ('BM', '2931224055060'), //Anca
	   ('BA', '2931224055060'), //Anca
	   ('BB', '2931224055060'), //Anca
	   ('BC', '2931224055060'), //Anca
	   ('BA', '1931222556458'), //Cristi
	   ('BA', '1940825464654'), //Luci
	   ('BA', '1940801045064'), //Dan
	   ('BM', '1940801045064'), //Dan
	   ('BM', '1940922545688'), //Bogdan
	   ('BM', '1940513654658'), //Iuli
	   ('BT', '1940513654658')  //Iuli */

-- studentii (nume, specializare, nota) care solicita bursa cu id-ul "BM" si nu solicita bursa cu id-ul "BT"

select distinct s.nume, s.specializare, s.nota
from student s
inner join bursa_student bs
on s.cnp = bs.id_student
where s.cnp in (select bs2.id_student 
				from bursa_student bs2
				where bs2.id_bursa = 'BM')
and s.cnp not in (select bs2.id_student 
				from bursa_student bs2
				where bs2.id_bursa = 'BT')


-- pentru bursele la care s-au inscris cei mai multi studenti se cere denumirea bursei, numele firmei, numarul
-- de studenti inscrisi si media notelor de concurs a acestora

select b.denumire, count(bs.id_student) as nr_studenti, avg(s.nota) as medie
from bursa b
inner join bursa_student bs on bs.id_bursa = b.id
inner join student s on bs.id_student = s.cnp
group by b.denumire having count(bs.id_student) = (select max(num) from (select count(*) as num from bursa_student group by id_bursa) as t)