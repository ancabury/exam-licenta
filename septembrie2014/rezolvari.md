# Subiect septembrie 2014

## Subeictul 3
### a)
#### 1. Ce face apelul sistem read când citește dintr-un pipe gol care însă este deschis pentru scriere de către alte procese?
  - asteapta sa se scrie in pipe, dupa care citeste

#### 2.  Ce va tipări pe ecran secvența de cod de mai jos?
  - C: CHILD_PID PIPE_PID + CHILD_PID
    P: PARENT_PID PIPE_PID
    ```
    C: 11933 23865
    C: 11934 35799
    C: 11935 47734
    C: 11936 59670
    C: 11937 71607
    P: 11932 71607
    ```

#### 3. In ce ordine se vor tipări informațiile pe ecran? Justificați răspunsul
  - informatiile vor fi tiparite in ordinea crearii proceselor copii deoarece pipe asteapta la citire in caz ca pipe-ul e gol

#### 4.  Cum este afectată ordinea afișării pe ecran, dacă se interschimbă liniile de cod 10 și 11? Justificați răspunsul.
  - rezultatul sunt in aceiasi ordine (nu e afectata afisarea)
  - de ce ??
  ```
  C: 12844 25687
  C: 12845 38532
  C: 12846 51378
  C: 12847 64225
  C: 12848 77073
  P: 12843 77073
  ```

### b) In director exista fisiere cu continut de forma `2014-07-29 09:37:21 login-id`

#### 1. Explicați funcționarea liniilor 5 și 6.
  - extrage a doua coloana de pe fiecare linie din fisier (ora:minut:secunda) si pastreaza liniile ce au ora precum cea din pas ($H) si numara cate astfel de intrari sunt in fisier
  - linia 6 evalueaza suma dintre $N si $K

#### 2. Ce va afișa scriptul pe ecran?
  - ora pasului curent ($H) si de cate ori s-a logat cineva in acea ora (din toate fisierele) ($N)

 | input                                   | result |
 | 2014-07-29 09:37:21 asarbu | 09 3  |
 | 2014-07-29 09:37:21 asarbu |  10 1 |
 | 2014-07-29 09:37:21 asarbu |  11 2 |
 | 2014-07-29 10:37:21 asarbu |  12 1 |
 | 2014-07-29 11:37:21 asarbu |  13 0 |
 | 2014-07-29 11:37:21 asarbu |  14 0 |
 | 2014-07-29 12:37:21 asarbu |  15 0 |
 |                                           |  16 0 |
 |                                           |  17 0 |
 |                                           |  18 0 |
 |                                           |  19 0 |
 |                                           |  20 0 |
 |                                           |  21 0 |
 |                                           |  22 0 |
