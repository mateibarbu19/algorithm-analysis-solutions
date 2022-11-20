# Exercitiul 1

> Fiind dat un vector de numere, exista o subsecventa de elemente egale
consecutive de lungime mai mare decat **k**?


```
// V = vectorul, n = nr de elemente din V
f(V, n, k) {
    i = choice(0 .. n-k-1)
    for(j = i+1 .. i+k)
        if(V[j] != V[j-1])
            fail
    success
}
```
Incearca toate pozitiile de start si verifica daca incepe o secventa de k elemente egale.
**O(k)**


# Exercitiul 2

> Avand un graf, sa se determine daca exista un drum de la nodul **u** la
nodul **v** care are lungimea mai mica decat o valoare data **dim**.

```
// G = graful
f(G, u, v, dim) {
    if(u == v)
        success
    
    if(dim <= 1) 
        fail

    k = choice(vecinii lui u in G)
    f(G, k, v, dim-1)
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
    for(nod in V)
        culoare[nod] = choice(k)
    
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
    clica = {}
    for(i = 1 .. k)
        clica = clica U choice(V \ clica)
    
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
    acoperire = {}
    for(i = 1 .. k)
        acoperire = acoperire U choice(V \ acoperire)
    
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
    sum = 0
    for(x in M)
        if(choice({adevarat, fals}))
            sum += x
    
    if(sum == Q)
        success
    else
        fail
}
```
Pentru fiecare element din multime alegem daca sa il folosim in suma sau nu, obtinand toate sumele posibile. Daca exista o submultime, acea ramura din arborele nedeterminist va intoarce succes.
**O(N)**
