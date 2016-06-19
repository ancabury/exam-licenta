# Subiect Iunie 2013

## Subeictul 3
### a)
#### 1. Care sunt toate variantele posibile de afişare în consola programului P1?
  - varianta 1: porneste doar p1 sau porneste p1 si apoi p2:
    ```
    4098: 3
    4097: 2
    4096: 1
    ```
  - varianta 2: porneste p2, apoi p1:
    ```
    4640: 4
    4639: 3
    4638: 2
    ```

#### 2. Ce se întămplă dacă se inversează ordinea instrucţiunilor open din programul P2?
  - procesul p2 obtine drepturi de citire pe fisierul a2b, iar procesul p1 nu poate obtine drepturi de scriere pe acelasi fisiere doar dupa ce a fost eliberat de p2, => p2 nu va citit nimic, iar valoarea lui n va fi una reziduala din memorie

#### 3. Câte procese creează procesul P1 (excluzând procesul părinte) ?
  - 3 procese

#### 4. Câte procese creează procesul P1 (excluzând procesul părinte) dacă lipseşte instrucţiunea
exit(0)?
  - 7 procese

  ```
  7568: 3 i = 2 parent = 7565
  7567: 2 i = 1 parent = 7565
                              ---> 7569: 4 i = 2 parent = 7567
  7566: 1 i = 0 parent = 7565 ---> 7571: 3 i = 2 parent = 7566
                              ---> 7570: 2 i = 1 parent = 7566
                                                              ---> 7572: 4 i = 2 parent = 7570
  ```


### b)
#### 1. Explicaţi funcţionalitatea liniei 2.
  - se parcurge in variabila A fiecare argument dat programului

#### 2. Explicaţi funcţionalitatea liniei 3.
  - se printeaza valoarea argumentului si se retine doar argumentele ce sunt formate dintr-o singura cifra

#### 3. Ce se afişează la fiecare dintre rulările de mai jos?
  - R1: 10
  - R2: 8 wrong ---> correct 5
  - R3: 321 wrong ---> correct 1
  - R4: 0

Rulari:
```shell
R1: ./a.sh 1 2 3 4
R2: ./a.sh a b1 c d2 5
R3: ./a.sh 1 20 300
R4: ./a.sh
```
