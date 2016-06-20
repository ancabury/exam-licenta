--insert into document (cota, titlu, tip, an_aparitie) values (1234, 'Morometii', 'carte', 1870);
--insert into document (cota, titlu, tip, an_aparitie) values (1235, 'Articol', 'articol in revista', 1900);
--insert into document (cota, titlu, tip, an_aparitie) values (1236, 'Revista', 'document', 1956);
--insert into document (cota, titlu, tip, an_aparitie) values (1237, 'Articol 2', 'articol in revista', 2000);
--insert into document (cota, titlu, tip, an_aparitie) values (1238, 'Raport', 'raport de cercetare', 2016);
--insert into document (cota, titlu, tip, an_aparitie) values (1239, 'Alta carte', 'carte', 2003);

--insert into autor (cota, nume) values (1234, 'Marin Preda');
--insert into autor (cota, nume) values (1235, 'Anca Sarbu');
--insert into autor (cota, nume) values (1236, 'Director de revista');
--insert into autor (cota, nume) values (1236, 'Bogdan Botocan');
--insert into autor (cota, nume) values (1236, 'Dan Bugnar');
--insert into autor (cota, nume) values (1236, 'Bianca Metzler');
--insert into autor (cota, nume) values (1236, 'Lucian Vasilut');
--insert into autor (cota, nume) values (1237, 'Anca Sarbu');
--insert into autor (cota, nume) values (1238, 'Liviu Rebreanu');

--insert into cititor (cod, nume) values (1, 'Anca');
--insert into cititor (cod, nume) values (2, 'Dan');
--insert into cititor (cod, nume) values (3, 'Bibi');
--insert into cititor (cod, nume) values (4, 'Bogdan');
--insert into cititor (cod, nume) values (5, 'Test');

--insert into doc_cititor (cota, cod) values (1236, 1);
--insert into doc_cititor (cota, cod) values (1238, 2);
--insert into doc_cititor (cota, cod) values (1235, 2);
--insert into doc_cititor (cota, cod) values (1234, 4);
--insert into doc_cititor (cota, cod) values (1236, 3);
--insert into doc_cititor (cota, cod) values (1236, 1);
--insert into doc_cititor (cota, cod) values (1238, 5);
--insert into doc_cititor (cota, cod) values (1239, 5);


--  Codul si numele cititorilor care au consultat cel putin un "raport de cercetare" si nu au consultat nici o "carte"
-- ??

--select *
--from cititor C
--inner join doc_cititor DC
--on C.cod = DC.cod
--where DC.cota not in (select cota from document where tip like 'carte')

--select C.cod
--from cititor C
--inner join doc_cititor DC
--on C.cod = DC.cod
--where DC.cota in (select cota from document where tip like 'raport de cercetare')


--group by C.cod, DC.cota, C.nume having (
--	DC.cota in (select cota from document where tip like 'raport de cercetare')
--	and DC.cota not in (select cota from document where tip like 'carte'))
--where DC.cota in (select cota from document where tip like 'raport de cercetare')
--and DC.cota not in (select cota from document where tip like 'carte')

-- Codul si numele cititorilor care au consultat documente care au cel putin 5 autori. 
select C.cod, C.nume, DC.cota
from cititor C
inner join doc_cititor DC
on C.cod = DC.cod
group by DC.cota, C.cod, C.nume having (select count(*) from autor where cota = DC.cota) = 5