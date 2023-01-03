# Exercițiul 1

> > **Problema $k$-Colorare** ($k\geq2$): Dându-se un graf neorientat $G = (V, E)$ și
> > $k$ culori, se pot colora nodurile grafului folosind cele $k$ culori astfel
> > încât niciun nod sa nu aibă un vecin de aceeași culoare?
> 
> Demonstrați următoare reducere polinomială:
> $$ 3\text{-Colorare} \leq_p 4\text{-Colorare} $$

Inputul pentru ambele probleme este un graf, deci:

$$ F : G \rightarrow G $$

La trecerea de la 3-Colorare la 4-Colorare, adaugăm un nod nou, unit cu toate
celelalte noduri.

```python
def F(G: tuple):
    V, E = G
    # V conține noduri numerotate de la 0 la len(V) - 1
    # E conține muchiile, de tip (nod1, nod2)

    last = len(V) # adăugăm noul nod
    V.append(last)
    E = E + [(v, last) for v in V] # unim nodul cu toate muchiile

    return (V, E)
```

Complexitatea temporală a lui `F` este liniară.

Pentru a demonstra reducerea:

$$ 3\text{-Colorare} \leq_p 4\text{-Colorare} $$

Trebuie să verificăm echivalența următoare conform ideii din referința
@GraphTheoryHow:

$$ 3\text{-Colorare}(G) = 1 \iff 4\text{-Colorare}(F(G)) = 1 $$

**Analizăm implicația directă:**

$$ \text{3-Colorare}(G) = 1 \Rightarrow \text{4-Colorare}(F(G)) = 1 $$

Pentru orice situație în care graful se poate colora cu $3$ culori, nodul nou va
trebui colorat cu o singură *altă* culoare, deci va respecta $4$-Colorare.

**Analizăm implicația inversă:**

$$ 3\text{-Colorare}(G) = 1 \Leftarrow 4\text{-Colorare}(F(G)) = 1 $$

Avem un nod (cel adaugat de noi, numerotat cu $|V|+1$) care este conectat la
toate celelalte noduri, deci trebuie sa aibă o culoare diferită față de toate.
Pentru ca problema este $4$-Colorabilă, înseamnă că, dacă scoatem acest nod,
graful care rămâne (cel original) este $3$-Colorabil.

# Exercițiul 2

> > **Problema Partiției**: Dându-se un număr n și o mulțime de $n$ întregi $A =
> > \{a_1, ..., a_n\}$, există $S \subset \{1, \dots, n\}$ astfel încât $\sum_{i
> > \in S} a_i = \sum_{i \notin S} a_i$?
>
> > **Problema sumei de submulțime, $q$-Sume (Subset Sum)**: Dându-se numerele
> > $t$, $q$ și o mulțime de $t$ întregi $B = \{b_1, \dots, b_t\}$, există $S'
> > \subseteq \{1, \dots, t\}$ astfel încât $\sum_{i \in S'} b_i = q$?
>
> Demonstrați următoare reducere polinomială:
> $$ \text{Partiție} \leq_p q\text{-Sume} $$

Intrarea pentru problema Partiției este o mulțime, iar pentru $q$-Sume este o
mulțime și un întreg, deci:

$$ F : Set \rightarrow (Set, Int) $$

```python
def F(A: set):
    q = sum(A) / 2
    B = A

    return B, q
```

Complexitatea temporală a lui `F` este liniară.

Pentru a demonstra reducerea trebuie să verificăm echivalența următoare conform
ideii din referința @ComplexityTheoryKarp:

$$ \text{Partiție}(A) = 1 \iff q\text{-Sume}(\underbrace{F(A)}_B) = 1 $$

**Analizăm implicația directă:**

$$ \text{Partiție}(A) = 1 \Rightarrow q\text{-Sume}(\underbrace{F(A)}_B) = 1 $$

Dacă problema partiției are soluție pentru intrarea $A$, înseamnă că există o
submulțime de indici $S$ astfel încat

$$ \sum_{i \in S} a_i = \sum_{i \notin S} a_i = {1 \over 2} \sum A $$

Pentru că l-am fixat pe `q` să fie `sum(A) / 2`, înseamnă că submulțimea de indici $S$ respectă condiția din $q$-Sume.

**Analizăm implicația inversă:**

$$ \text{Partiție}(A) = 1 \Leftarrow q\text{-Sume}(\underbrace{F(A)}_B) = 1 $$

Problema $q$-Sume este satisfacută, deci există o submulțime de indici $S'$ a lui
$B$, astfel încât

$$ \sum_{i \in S'} b_i = q $$

Având în vedere că $B = A$, iar $q = {1 \over 2} \sum A$

$$ \sum_{i \in S'} a_i = {1 \over 2} \sum A $$

Înseamnă că ce rămâne în afara lui $S'$, $\{a_i| i \notin S'\}$, va însuma tot la
`sum(A) / 2`, deci există două submulțimi dijuncte și complementare care să aibă
aceeași sumă, respectând condiția de la Partiție.

# Exercițiul 3

> > **Problema Vertex Cover**: Dându-se un graf neorientat $G' = (V', E')$ și un
> > număr $k'$, există o submulțime $S'$ de cel mult $k'$ noduri astfel încât fiecare muchie
> > are *cel puțin* un capăt în $S'$?
> 
> > **Problema Independent Set**: Dându-se un graf neorientat $G = (V, E)$ și
> > un număr $k$, există o submulțime $S$ de cel puțin $k$ noduri, astfel încât fiecare
> > muchie are *cel mult* un capăt în $S$?
>
> Demonstrați următoare reducere polinomială:
> $$ \text{Independent-Set} \leq_p \text{Vertex-Cover} $$

Inputul pentru ambele este un graf și un întreg, deci:

$$ F : (\underbrace{(Set, List)}_{Graph}, Int) \rightarrow (Graph, Int) $$

```python
def F(G: tuple, k: int):
    V, _ = G
    return G, len(V) - k
```

Complexitatea temporală a lui `F` este liniară.

Pentru a demonstra reducerea trebuie să verificăm echivalența următoare conform
ideii din referința @2817Reduction:

$$ \text{Independent-Set}(G, k) = 1 \iff \text{Vertex-Cover}(\underbrace{F(G,
k)}_{(G', k')}) = 1 $$

**Observație**: $G' = G, V = V', E = E'$.

**Analizăm implicația directă:**

$$ \text{Independent-Set}(G, k) = 1 \Rightarrow
\text{Vertex-Cover}(\underbrace{F(G, k)}_{(G', k')}) = 1 $$

Dacă Independent-Set poate fi satisfacută, înseamnă că oricare latură $e = (u,
v) \in E$ are *cel mult* un capăt într-o submulțime de cel puțin $k$ noduri $S$. Ceea ce
înseamnă că are *cel puțin* un capăt în $V \setminus S = S'$. $|S'| = k' = |V| -
k$, deci graful respectă condiția de la Vertex-Cover pentru $k'$.

**Analizăm implicația inversă:**

$$ \text{Independent-Set}(G, k) = 1 \Leftarrow
\text{Vertex-Cover}(\underbrace{F(G, k)}_{(G', k')}) = 1 $$

Dacă Vertex-Cover poate fi satisfacută, înseamnă că oricare latură $e = (u,
v) \in E$ are *cel puțin* un capăt într-o submulțime de cel mult $k'$ noduri $S'$. Ceea ce
înseamnă că are *cel mult* un capăt în $V \setminus S' = S$. $|S| = k = |V| -
k'$, deci graful respectă condiția de la Independent-Set pentru $k$.

# Exercițiul 4

> > *Problema Set Cover*: Dându-se o mulțime $U$, o colecție $S_1, S_2, \dots,
> > S_m$ de submulțimi ale lui U și un număr $k'$, există o colecție de cel mult $k'$
> > astfel de submulțimi care reunite să dea $U$?
>
> Demonstrați următoare reducere polinomială:
> $$ \text{Vertex-Cover} \leq_p \text{Set-Cover} $$

Inputul pentru Vertex-Cover este un graf și un întreg, iar pentru Set-Cover
este o listă, o listă de liste și un întreg.

$$ F : (\underbrace{(Set, List)}_{Graph}, Int) \rightarrow (Set, List<Set>, int) $$

```python
def F(G, k: int)
    V, E = G

    U = E
    S = []
    for _ in V:
        S.append(set())

    for i in V:
        for u, v in E:
            if u == i or v == i:
                S[i].add((u, v))

    return (E, S, k)
```

Complexitatea temporală a lui `F` este $O(|V|\cdot|E|)$, considerăm inserția
într-o mulțime $O(1)$.

Pentru a demonstra reducerea trebuie să verificăm echivalența următoare conform
ideii din referința @IntroToAlg:

$$ \text{Vertex-Cover}(G, k) = 1 \iff \text{Set-Cover}(\underbrace{F(G, k)}_{(U,
S, k')}) = 1 $$

**Observație**: $k = k'$.

Din definiția originală a lui Vertex-Cover, $k \geq |S'|$, unde $S'$ este
mulțimea nodurilor de acoperire. Cum $S'$ din Vertex-Cover corespunde lui $S$
din Set-Cover, $k' \geq |S|$.

**Analizăm implicația directă:**

$$ \text{Vertex-Cover}(G, k) = 1 \Rightarrow \text{Set-Cover}(\underbrace{F(G,
k)}_{(U, S, k')}) = 1 $$

Dacă Vertex-Cover este satisfacută, fiecare muchie din $G$ are cel puțin un nod
în mulțimea de acoperire $S'$. Din construcția lui `F`, vedem că muchiile
nodurilor din această mulțime sunt suficiente pentru a acoperi tot graful.
Pentru că mulțimea $U$ din problema Set-Cover este mulțimea muchiilor din graf,
$E$, înseamnă că `S[i]` acoperă întreaga listă.

**Analizăm implicația inversă:**

$$ \text{Vertex-Cover}(G, k) = 1 \Leftarrow \text{Set-Cover}(\underbrace{F(G,
k)}_{(U, S, k')}) = 1 $$

Invers, dacă `Set Cover` este rezolvabilă, înseamnă că există o mulțime de
mulțimi `C` care, reunite, acoperă toată mulțimea mare. Din construcția lui `F`,
fiecare muchie din `C` are asociat în graf un nod. Mulțimea acestor noduri `(S)`
conține noduri de pe fiecare muchie (prin definiția lui `Set Cover`), deci
respectă condiția de `Vertex Cover`.

# Bibliografie
