# Subiect septembrie 2015

## Subeictul 3
### a)
#### 1. Ce reprezintă valorile variabilelor x şi f?
    - x reprezinta valoarea pidului procesului parinte
    - f reprezinta valoarea pidului procesului f

#### 2. Explicaţi detaliat fiecare instrucţiune if şi blocul aferent acesteia.
    - 1st if: daca suntem in parinte atunci inchidem pipe-ul de iesire
    - 2nd if: daca suntem in copil si x e egal cu pidul copilului atunci inchide pipeul de citire si scrie in pipe valoarea lui x
    - 3rd if: daca suntem in parinte atunci citim din pipe
    - 4th if: daca suntem in parinte si x este egal cu pidul parinte atunci inchide pipeul de scriere si citeste din pipe, tipareste valoarea citita si termina procesul
    - 5th if: daca pidul parintelui e egal cu x atunci inchide pipe-ul de citire, incrementeaza f si scrie in pipe noua valoare a lui f si termina procesul
    - 6th if: daca pidul parintelui e 0 atunci printeaza valoarea lui f

#### 3. Ce se afişează la ieşirea standard la execuţia acestui program şi de ce?
    - va afisa 1 (f in copil are valoarea 0) pentru ca copilul isi incepe executia imediat dupa fork si mosteneste toate variabilele si valorile lor din parinte. Din aceasta cauza priml, al doilea, al patrulea si al saselea if nu vor avea conditia true niciodata.


### b)
#### 1. Explicaţi care este diferenţa dintre instrucţiunea if de pe linia 5 şi instrucţiunea if de pe linia 11.
    -

#### 2. Explicaţi în detaliu linia 17.
    - numara cate linii sunt in fisierul tmp

#### 3.  Ce reprezintă (şi explicaţi şi de ce) valoarea variabilei x afişată la final?
    - x reprezinta numarul de linii din fisierul tmp, adica numarul de fisiere sterse

#### 4.  Rescrieţi liniile de cod de la 10 la 14 astfel încât efectul execuţiei sa rămână acelaşi, dar folosind o comandă UNIX mai puţin
    ```
     rm $f
     if [ ! -f $f ] && echo $f a fost sters cu succes
    ```
