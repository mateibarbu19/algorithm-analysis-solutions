**Observație**: În redactarea soluțiilor am avut nevoie de structuri de date
dincolo de ce oferă limbajul C, dar lipsite de complexitatea celor din C++ sau
Java. Cel mai intuitiv ar fi fost să folosim [C*](http://cx-lang.org/), dar din
cauza relevanței scăzute în practică a lui, am ales să folosim un limbaj
asemănător cu Python 3. În implementare am utilizat [Mutable Sequence Types] și
[List Comprehensions]. **NU** sunteți obligați să folosiți Python la examen.

# Exercițiul 1 - K Adjacent Equal

> Fiind dat un vector de numere, există o subsecvență de elemente egale
consecutive de lungime mai mare decât `k`?

```python
# V = vectorul, n = nr de elemente din V
def secv(V, n, k):
    # generare
    i = choice(range(n - k))

    # testare
    for j in range(i, i + k):
        if V[j] != V[j + 1]:
            fail()
    success()
```

Încearcă toate pozițiile de start și verifică dacă începe o secvență de `k`
elemente egale. Complexitatea temporală a algoritmului nedeterminist este:

$$\boxed{O(k)}$$

# Exercițiul 2 - K Path

> Având un graf, $G(V, E)$, să se determine dacă există un drum de la nodul `u` la nodul
> `v` care are lungimea mai mică decât o valoare dată, `dim`.

```python
# V = noduri, E = muchii
def path(V, E, u, v, dim):
    # testare
    if u == v:
        success()
    if dim <= 1: 
        fail()

    # generare: alegem un vecin al lui u
    k = choice([v for (u, v) in E]) # see list comprehension
    path(G, k, v, dim - 1)
```

Deoarece am ales să stocăm E ca o listă de muchii, complexitatea pentru găsirea vecinilor lui `v` este O(|E|).

Ne alegem un vecin și rezolvăm recursiv până când ajungem la `v` sau avem un
`dim` prea mic. Complexitatea temporală a algoritmului nedeterminist este:

$$\boxed{O(dim \cdot |E|)}$$

# Exercițiul 3 - Graph Coloring

> Dându-se un graf $G(V, E)$ și `k` culori, se pot colora nodurile
> grafului doar cu cele `k` culori astfel încât niciun nod sa nu aibă un vecin
> de aceeași culoare?


```python
# V = noduri, E = muchii, k = nr culori
def coloring(V, E, k):
    # generare
    for (node in V)
        color[node] = choice(range(k))
    
    # testare
    for (u, v) in E:
        if color[u] == color[v]:
            fail()
    success()
```

Atribuim o culoare fiecărui nod și testăm dacă avem o colorare validă.
Complexitatea temporală a algoritmului nedeterminist este:

$$\boxed{O(|V|+|E|)}$$

# Exercițiul 4 - K-Clique

> Dându-se un graf $G(V, E)$ și un număr `k`, există un subgraf complet
> (o clică) de dimensiune `k`?

```python
def kclique(V, E, k):
    # generare
    clique = []
    for _ in range(k)
        diff = [v for v in V if v not in clique]
        clique.append(choice(diff))

    # testare
    for i in clique:
        for j in [v for v in clique if v != i]
            if (i, j) not in E:
                fail()
    success
```

Alegem `k` noduri, apoi verificăm că formează o clică validă. Complexitatea
temporală a algoritmului nedeterminist este:

$$\boxed{O(k^2(|V|+|E|))}$$

# Exercițiul 5 - Vertex Cover

>  Dându-se un graf $G(V, E)$ și un număr `k`, există o submulțime de `k`
> noduri astfel încât fiecare muchie $(v_1, v_2)$ să aibă cel puțin unul dintre
> nodurile care o compun ($v_1$ sau $v_2$) în submulțimea aleasă?

```python
def vertex_cover(V, E, k):
    # generare
    cover = []
    for _ in range(k):
        diff = [v for v in V if v not in cover]
        cover.append(choice(diff))

    # testare
    for (i, j) in E:
        if i not in cover or j not in cover:
            fail()
    success()
```

Alegem `k` noduri, apoi verificăm că formează o acoperire validă. Complexitatea
temporală a algoritmului nedeterminist este:

$$\boxed{O(k^2|V|+k|E|)}$$

# Exercițiul 6 - Subset sum problem

> Se dă o mulțime de N numere și un număr `Q`. Există o submulțime de numere a
> căror sumă să fie fix `Q`?

```python
# M = multimea
def subset_sum(M, Q):
    # generare
    sum = 0
    for x in M:
        if choice([True, False]):
            sum = sum + x
    
    # testare
    if sum == Q:
        success()
    else:
        fail
```

Pentru fiecare element din mulțime alegem dacă să îl folosim în sumă sau nu,
obținând toate sumele posibile. Dacă există o submulțime care satisface cerința,
ramura corespunzătoare ei din arborele nedeterminist va întoarce succes.
Complexitatea temporală a algoritmului nedeterminist este:

$$\boxed{O(|M|) = O(N)}$$

# Exercițiul 7 - Traveling salesman problem

> Se dă o mulțime de orașe conectate între ele prin drumuri. Există vreo
> modalitate ca un comis voiajor să viziteze toate orașele o singură dată și să
> se întoarcă de unde a plecat?

```python
# V = noduri, E = muchii
def TSP(V, E):
    # generare
    tour = []
    for _ in V:
        diff = [v for v in V if v not in tour]
        tour.append(choice(diff))
    tour.append(tour[0])

    # testare
    for i in range(len(V)):
        if (tour[i], tour[i + 1]) not in E:
            fail()
    success()
```

Generăm o permutare de noduri, apoi verificăm că aceasta formează un drum în
graf. Complexitatea temporală a algoritmului nedeterminist este:

$$\boxed{O(|V|^2 + |E|)}$$

# Exercițiul 8 - Eight queens puzzle

> Plasați $8$ regine pe o tablă de șah fără ca acestea să se atace.

```python
def queens():
    row = 8 * [False]
    diagP = 15 * [False]
    diagS = 15 * [False]

    for x in range(8):
        # generare
        y = choice(range(8))

        # testare
        if row[y] or diagP[x - y + 7] or diagS[x + y]:
            fail()

        row[y] = diagP[x - y + 7] = diagS[x + y] = True

    success()
```

Alegem o poziție pentru fiecare regină, apoi verificăm dacă acea linie sau
coloană sau diagonală este deja ocupată. Complexitatea temporală a algoritmului
nedeterminist este, unde am notat cu $n$ dimensiunea tablei de șah:

$$\boxed{O(N)}$$

O altă soluție, recursivă, ar fi:

```python
def queensRec(currentQueens):
    if len(currentQueens) == 8:
        success()

    x, y = choice(range(8)), choice(range(8))

    for (qx, qy) in currentQueens:
        if x == qx or y == qy or x - y == qx - qy or x + y == qx + qy:
            fail()
            
    queensRec(currentQueens + [(x, y)])

def queens():
    queensRec([])
```

Această soluție seamănă cu cea clasică, de backtracking. Deoarece verificăm reginele între ele, complexitatea este:

$$\boxed{O(N^2)}$$

# Exercițiul 9 - Subgraph isomorphism problem

> > Două grafuri $G_1(V_1, E_1)$ și $G_2(V_2, E_2)$ sunt izomorfe dacă există o
> > funcție bijectivă $f : V_1 \rightarrow V_2$, astfel încat muchia $(u, v) \in
> > E_1 \iff$ muchia $(f(u), f(v)) \in E_2$. (Observație: doua grafuri pot fi
> > izomorfe doar dacă au același număr de noduri.) 
>
> Dându-se două grafuri, $G_1$ și $G_2$, există un subgraf în $G_1$ care să fie
> izomorf cu $G_2$?

```python
def subgraph_isomorphism(V1, E1, V2, E2):
    f = {} # dictionar pentru functia f
    ff = {} # f^-1

    #  generare
    available = V1
    for v2 in V2:
        v1 = choice(available)
        f[v1] = v2
        ff[v2] = v1
        available.remove(v1)

    # testare
    for (u, v) in E2:
        if (ff[u], ff[v]) not in E1:
            fail()
    
    # V1' = f.keys()
    # E1' = [(ff[u], ff[v]) for (u, v) in E2]

    success()
```

Pentru subgraful lui $G_1$, trebuie să alegem atât nodurile, cât și muchiile. Funcția este bijectiva, așa că putem privi dinspre $G_2$: alegem un $v_1 \in V_1$ pentru fiecare $v_2 \in V_2$, apoi verificăm că toate muchiile din $E_2$ au corespondent în $E_1$. Toate muchiile în plus din $E_1$ sunt ignorate.

Pentru generare avem complexitatea $O(|V_1| \cdot |V_2|)$, din cauza faptului că acel remove are $O(|V_1|)$. Pentru testare avem $O(|E_1| \cdot |E_2|)$. În total, complexitatea temporală a algoritmului nedeterminist este:

$$\boxed{O(|V_1| \cdot |V_2| + |E_1| \cdot |E_2|)}$$

# Exercițiul 10 - Independent set

> Dându-se un graf $G(V, E)$ și un număr `k`, există o mulțime $S$ de `k` noduri
> astfel încât orice muchie are cel mult un capăt în $S$?

```python
def independent(V, E, k):
    # generare
    S = []
    for _ in range(k):
        diff = [v for v in V if v not in S]
        S.append(choice(diff))

    # testare
    for (u, v) in E:
        if u in S and v in S:
            fail()
    success()
```

Ne alegem o submulțime de `k` noduri și verificăm condiția. Complexitatea temporală a algoritmului
nedeterminist est:

$$\boxed{O(k^2|V| + k|E|)}$$

# Exercițiul 11 - Equal Subset Sum Partition

> Dându-se o mulțime de $n$ numere întregi, există o împărțire a elementelor sale
> în două submulțimi $S_1$ și $S_2$ care sa aibă sume egale?

```python
# M = multimea
def partition(M):
    s = 0 # suma totala
    s1 = 0 # suma pentru S1

    # generare
    for x in M:
        s = s + x
        if choice([True, False]):
            s1 = s1 + x

    # testare
    if s == 2 * s1:
        success()
    else
        fail()
```

Îmi aleg submulțimea $S_1$. Din moment ce $\sum S_1 = \sum S_2$, verificăm că 

$$2 \cdot s_1 = s_1 + s_2 = s$$

Complexitatea temporală a algoritmului nedeterminist este:

$$\boxed{O(n)}$$

# Exercițiul 12 - SAT (Boolean Satisfiability Problem)

> Se dă o expresie booleană în forma normală conjunctivă - o conjuncție de
> clauze, unde clauzele sunt disjuncții. Exemplu:
>
> > $$(x_1 \lor \neg x_2) \land (\neg x_1 \lor x_2 \lor x_3) \land \neg x_1$$
> 
> Să se determine daca exista o posibilitate de atribuire a variabilelor astfel incat expresia sa fie adevarata.

```python

# V = variabile, C = clauze
def sat(V, C):
    A = {} # dicționar de atribuiri pentru fiecare variabilă

    # generare
    for v in V:
        A[v] = choice([True, False])
        A[-v] = not A[v]

    # testare
    for clause in C:
        if not any(A[v] for v in clause):
            fail()
    success()
```

Atribui fiecărei variabile o valoare de adevăr și verific dacă satisfac toate
clauzele. Complexitatea temporală a algoritmului nedeterminist este:

$$\boxed{O(|V| \cdot |C|)}$$

[Mutable Sequence Types]: https://docs.python.org/3/library/stdtypes.html#mutable-sequence-types
[List Comprehensions]: https://docs.python.org/3/tutorial/datastructures.html#list-comprehensions