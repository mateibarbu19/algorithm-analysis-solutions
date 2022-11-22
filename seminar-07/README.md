# Exercitiul 1

> Fiind dat un vector de numere, exista o subsecventa de elemente egale
consecutive de lungime mai mare decat **k**?


```
// V = vectorul, n = nr de elemente din V
secv(V, n, k) {
    // generare
    i = choice(0 .. n-k-1)

    // testare
    for(j = i+1 .. i+k)
        if(V[j] != V[j-1])
            fail
    success
}
```
Incearca toate pozitiile de start si verifica daca incepe o secventa de **k** elemente egale.
**O(k)**


# Exercitiul 2

> Avand un graf, sa se determine daca exista un drum de la nodul **u** la
nodul **v** care are lungimea mai mica decat o valoare data **dim**.

```
// G = graful
drum(G, u, v, dim) {
    // testare
    if(u == v)
        success
    if(dim <= 1) 
        fail

    // generare
    k = choice(vecinii lui u in G)
    drum(G, k, v, dim-1)
}
```

Ne alegem un vecin si rezolvam recursiv pana cand ajungem la **v** sau avem un **dim** prea mic. **O(dim)**

# Exercitiul 3

> **Colorarea unui graf**:
> 
> Dandu-se un graf **G(V, E)** si **k** culori, se pot colora nodurile grafului doar cu cele **k** culori astfel incat niciun nod sa nu aiba un vecin de aceeasi culoare?


```
// V = noduri, E = muchii, k = nr culori
colorare(V, E, k) {
    // generare
    for(nod in V)
        culoare[nod] = choice(k)
    
    // testare
    for((u, v) in E)
        if(culoare[u]==culoare[v])
            fail
    success
}
```

Asignam o culoare fiecarui nod si testam daca avem o colorare valida. **O(V+E)**

# Exercitiul 4

> **k-clica**:
> 
> Dandu-se un graf **G(V, E)** si un numar **k**, exista un subgraf complet (o clica) de dimensiune **k**?

```
kclica(V, E, k) {
    // generare
    clica = {}
    for(i = 1 .. k)
        clica = clica U choice(V \ clica)
    
    // testare
    for(i in clica)
        for(j in clica \ {i})
            if((i, j) nu e in E)
                fail
    success
}
```

Alegem **k** noduri, apoi verificam ca formeaza o clica valida.
**O(k^2)**

# Exercitiul 5

> **k-acoperire (vertex cover):**
> 
>  Dandu-se un graf **G(V, E)** si un numar **k**, exista o submultime de **k** noduri astfel incat fiecare muchie **(v1, v2)** sa aiba cel putin unul dintre nodurile care o compun (**v1** sau **v2**) in submultimea aleasa?

```
kacoperire(V, E, k) {
    // generare
    acoperire = {}
    for(i = 1 .. k)
        acoperire = acoperire U choice(V \ acoperire)
    
    // testare
    for((i, j) in E)
        if(i si j nu sunt in acoperire)
            fail
    success
}
```

Alegem **k** noduri, apoi verificam ca formeaza o acoperire valida.
**O(k+E)**

# Exercitiul 6

> **Submultime de suma data (Q-sume):**
>
> Se da o multime de **N** numere si un numar **Q**. Exista o submultime de numere a caror suma sa fie fix **Q**?

```
// M = multimea
qsume(M, N, Q) {
    // generare
    sum = 0
    for(x in M)
        if(choice({adevarat, fals}))
            sum += x
    
    // testare
    if(sum == Q)
        success
    else
        fail
}
```
Pentru fiecare element din multime alegem daca sa il folosim in suma sau nu, obtinand toate sumele posibile. Daca exista o submultime, acea ramura din arborele nedeterminist va intoarce succes.
**O(N)**

# Exercitiul 7

> **Problema comis-voiajorului (TSP):**
> 
> Se da o multime de orase conectate intre ele prin drumuri. Exista vreo modalitate ca un comis voiajor sa viziteze toate orasele o singura data si sa se intoarca de unde a plecat?

```
// V = noduri, E = muchii
voiajor(V, E){
    // generare
    drum = vector(|V|+1)
    for(i = 0 .. |V|-1)
        drum[i] = choice(V \ drum)
    drum[|V|] = drum[0]

    // testare
    for(i = 1 .. |V|)
        if((drum[i-1], drum[i]) nu e in E)
            fail
    success
}
```
Generam o permutare de noduri, apoi verificam ca aceasta formeaza un drum in graf.
**O(V)**

# Exercitiul 8

> Plasati 8 regine pe o tabla de sah fara ca acestea sa se atace.

```
regine() {
    for(i = 0 .. 7) {
        // generare
        X = choice(0..7)
        Y = choice(0..7)

        // testare
        if(verticala[X]|| orizontala[Y]++ || diagP[X-Y] || diagS[X+Y])
            fail
        
        verticala[x] = orizontala[Y] = diagP[X-Y] = diagS[X+Y] = adevarat
    }

    success
}
```
Alegem o pozitie pentru fiecare regina, apoi verificam daca acea linie / coloana / diagonala este deja ocupata.
**O(n)** (numarul de linii / dame)

# Exercitiul 9

> **Problema subgrafurilor izomorfe**:
>
> Doua grafuri **G1(V1, E1)** si **G2(V2, E2)** sunt izomorfe daca exista o functie bijectiva **f : V1 -> V2** astfel incat: muchia **(u, v)** este in **E1** <=> muchia **(f(u), f(v))** este in **E2** (obs: doua grafuri pot fi izomorfe daca au acelasi numar de noduri). Dandu-se doua grafuri, **G1** si **G2**, exista un subgraf in **G1** care sa fie izomorf cu **G2**?

```
subizomorf(V1, E1, V2, E2) {
    f = dictionar<nod,nod>
    alese = {}

    //  generare
    for(nod1 in V1) {
        if(choice({adevarat, fals})) {
            f[nod1] = choice(V2 \ alese)
            alese = alese U f[nod1]
        }
    }

    // testare
    for((u, v) in E1)
        if((u si v in f) si ((f[u], f[v]) nu e in E2))
            fail
    success
}
```
Pentru fiecare nod din **G1** alegem daca este sau nu in subgraf, apoi ii alegem un corespondent in **G2**. Pentru fiecare muchie din subgraf, verificam ca muchia intre corespondenti exista in **G2**.
**O(V+E)**

# Exercitiul 10

> **Independent set:**
> 
> Dandu-se un graf **G(V, E)** si un numar **k** din **Z**, exista o multime **S** de **k** noduri astfel incat orice muchie are cel mult un capat in **S**?

```
independent(V, E, k) {
    // generare
    S={}
    for(i = 1 .. k) {
        S = S U choice(V \ S)
    }

    for((u, v) in E)
        if((u in S) si (v in S))
            fail
    success
}
```
Ne alegem o submultime de **k** noduri si verificam conditia.
**O(k + E)**

# Exercitiul 11

> **Problema partitionarii:**
>
> Dandu-se o multime de **t** numere intregi, exista o impartire a elementelor sale in doua submultimi **S1** si **S2** care sa aiba sume egale?

```
// M = multimea
partitionare(M) {
    s = 0 // suma totala
    s1 = 0 // suma pentru S1

    // generare
    for(x in M) {
        s += x
        if(choice({adevarat, fals}))
            s1+=x
    }

    // testare
    if(s == 2*s1)
        success
    else
        fail
}
```
Imi aleg submultimea **S1**. Din moment ce suma pentru **S1** = suma pentru **S2**, verificam ca **2\*s1 = s1 + s2 = s**.
**O(|M|)**

# Exercitiul 12

> SAT(Boolean Satisfiability Problem):
>
> Se da o expresie booleana in forma normala conjunctiva - o conjunctie de clauze, unde clauzele sunt disjunctii. Exemplu **(x1 v ~x2) ^ (~x1 v x2 v x3) ^ ~x1**. Sa se determine daca exista o posibilitate de atribuire a variabilelor astfel incat expresia sa fie adevarata.

```
// V = variabile, C = clauze
sat(V, C) {
    A = dictionar<variabila, bool> // atribuire

    // generare
    for(x in V)
        A[x] = choice({adevarat, fals})

    // testare
    for(clauza in C)
        if(A nu satisface clauza)
            fail
    success
}
```
Atribui fiecarei variabile o valoare de adevar si verific daca satisfac toate clauzele.
**O(|V| * |C|)**