# Subiect Iunie 2014

## Subeictul 3
### a)
#### 1.  Ce vor afisa pe ecran cele 2 rulari? Explicati.
  - R1: p = CHILD_PID: pp = PARENT_PID
          Pid parinte PARENT_PID: pid fiu: CHILD_PID
      ```
      p=9493: pp=9492
      Pid parinte 9492: pid fiu 9493
      ```
  - R2: directorul curent
          Pid parinte: PARENT_PID: pid fiu \n
      ```
      /home/anca/Desktop/exam_licenta/iunie2014
      Pid parinte 9551: pid fiu 0
      ```

#### 2. 2 Ce vor afisa pe ecran cele 2 rulari daca elimininam linia L6 (exi(0)). Explicati rezultatele.
  - R1: p = CHILD_PID: pp = PARENT_PID
          Pid parinte CHILD_PID: pid fiu: CHILD_PID
          Pid parinte PARENT_PID: pid fiu: CHILD_PID
      ```
      p=9849: pp=9848
      Pid parinte 9849: pid fiu 9849
      Pid parinte 9848: pid fiu 9849
      ```
  - R2: directorul curent
          Pid parinte PARENT_PID: pid fiu: 0
      ```
      /home/anca/Desktop/exam_licenta/iunie2014
      Pid parinte 9934: pid fiu 0
      ```

Rulari:
R1: /home/scs/exam/p s ls
R2: /home/scVexam/p c pwd

### b)
#### 1. Explicati linia 2
  - printeaza primul argument din lista si selecteaza argumentul ce contine primul caracter nonlitera de 0 sau mai multe ori si se termina in cifra

#### 2. Ce vor afisa pe ecran cele 4 executii. Explicati.
  - R1: 3: 1 2 3
          2: 2 3
          1: 3
          0:
  - R2:
          3: 1 22 3
          2: 22 3
  - R3:
          2: a1 2
          1: 2
          0:
  - R4:
          3: 1 2a 3
          2: 2a 3

Rulari:
```
R1: ./s.sh 1 2 3
R2: ./s.sh 1 22 3
R3: ./s.sh a1 2
R4: ./s.sh 1 2a 3
```
