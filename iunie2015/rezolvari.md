# Subiect Iunie 2015

## Subeictul 3
### 1.
#### a)Câte procese fiu se vor crea?
  - 6 procese

#### b) Ce se va afișa? Explicați funcționarea fragmentului de program.
  - va afisa 7
  - initial se scrie in pipe 1, dupa care primul copil citeste din pipe si incrementeaza n (n = 2) si apoi scrie iar in pipe, al doilea copil citeste din pipe si incremeantaza n (n = 3) ...

#### c) ) Explicați funcționarea fragmentului de program dacă valoarea lui K este 2?
 - fragmentul ruleaza la infinit deoarece pipe-urile de ordin impar asteapta sa citeasca din pipe, dar in acele pipe-uri nu se scrie niciodata

### 2.
#### a) Explicați funcționarea scriptului
  - citeste toate fisierele cu extensia log din directorul curent.
  In A numara cate linii contin <ERROR>
  In M calculeaza nr de linii ce contint <ERROR> din toate fisierele cu extensia log
  In B numara cate linii contin <ERROR>.*<segmentation fault>
  In N calculeaza nr de linii ce contint <ERROR>.*<segmentation fault> din toate fisierele cu extensia log
  La final calculeaza procentul de errori segmentation fault din intregul erorilor

#### b)  Ce se va afișa?
  - se afiseaza rezultatul procentului

#### c) Explicați în detaliu linia 8
  - din fisier se extrag cu grep toate linii ce contin: <ERROR> orice alt caracter <segmentation fault>, iar apoi numara aceste linii

#### d) Explicați de ce este nevoie de caracterul „\” pe linia 11?
  - este nevoie de caracterul "\" pentru a interpreta caracterul "*" ca si inmultire si nu ca semn special dintr-o expresie regulara
