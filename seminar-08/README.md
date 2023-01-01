# Exercițiul 1

$$ 3\text{-Colorare} \leq_p 4\text{-Colorare} $$

Inputul pentru ambele probleme este un graf, deci:

$$ F : G \rightarrow G $$

La trecerea de la 3-Colorare la 4-Colorare, adaugăm un nod nou, unit cu toate
celelalte noduri.

```python
def F(G):
    V, E = G
    # V conține noduri numerotate de la 0 la len(V) - 1
    # E conține muchiile, de tip (nod1, nod2).

    V2 = V.append(len(V)) # adăugăm noul nod
    E2 = E + [(v, len(V)) for v in V] # unim nodul cu toate muchiile

    return (V2, E2)
```

Complexitatea temporală a lui `F` este liniară.

$$ 3\text{-Colorare} \leq_p 4\text{-Colorare} $$
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

# Exercitiul 2
$$ \text{Partition} \leq_p \text{q-Sum} $$

Inputul pentru `Partition` este o listă, iar pentru `q-Sum` este o lista şi un
întreg, deci:

$$ F : List \rightarrow (List, int) $$

```python
def F(L: list):
    q = sum(L) / 2
    return L, q
```

Complexitatea temporală a lui `F` este liniară.

$$ \text{Partition}(A) = 1 \iff \text{q-Sum}(F(A)) = 1 $$

**Analizăm implicația directă:**

$$ \text{Partition}(A) = 1 \Rightarrow \text{q-Sum}(F(A)) = 1 $$

Dacă `Partition` este rezolvabilă, înseamnă că există secţiuni `S1` şi `S2`
astfel încat `A = S1.union(S2)`, si `sum(S1) = sum(S2)`, deci `sum(A) = 2 *
sum(S1)`.

Pentru că am setat `q` să fie `sum(A) / 2` şi lista să fie aceeaşi (`A`),
înseamnă că `S1` respectă condiţia din `q-Sum`.

**Analizăm implicația inversă:**

$$ \text{Partition}(A) = 1 \Leftarrow \text{q-Sum}(F(A)) = 1 $$

`q-Sum` este satisfacută, deci există o secţiune `S` din `A`, care însumată să
fie `sum(A) / 2`. Înseamnă că ce rămâne în afara lui `S` `(A - S)` va însuma tot
la `sum(A) / 2`, deci există două secţiuni care să aibă aceeaşi sumă, respectând
condiţia de la `Partition`.

# Exercitiul 3
$$ \text{Independent Set} \leq_p \text{Vertex Cover} $$

Inputul pentru ambele este un graf şi un întreg, deci:

$$ F : (graf, int) \rightarrow (graf, int) $$

```python
def F(G, k: int):
    V, _ = G
    return G, |V| - k
```

Complexitatea temporală a lui `F` este liniară.

$$ \text{Independent Set}(G, k) == 1 \iff \text{Vertex Cover}(F(G, k)) == 1 $$

**Analizăm implicația directă:**

$$ \text{Independent Set}(G, k) == 1 \Rightarrow \text{Vertex Cover}(F(G, k)) ==
1 $$

Daca `Independent Set` poate fi satisfacută, înseamnă că oricare latură `e = (u,
v)` aparţinând lui `E` are cel mult un capăt în `S'`. Ceea ce înseamnă că are
cel puţin un capăt în `V - S' = S`. `|S| = |V| - k'`, deci respectă condiţia de
la `Vertex Cover`.

**Analizăm implicația inversă:**

$$ \text{Independent Set}(G, k) == 1 \Leftarrow \text{Vertex Cover}(F(G, k)) ==
1 $$

Daca `Vertex Cover` poate fi satisfacută, înseamnă că oricare latura `e = (u,
v)` aparţinand lui `E` are cel puţin un capăt în `S`. Ceea ce înseamnă că are
cel mult un capăt în `V - S = S'`. `|S'| = |V| - k`, deci respectă condiţia de
la `Independent Set`.

# Exercitiul 4
$$ \text{Vertex Cover} \leq_p \text{Set Cover} $$

Inputul pentru `Vertex Cover` este un graf şi un întreg, iar pentru `Set Cover`
este o listă, o listă de liste şi un întreg.

$$ F : (graf, int) \rightarrow (list, list<list>, int) $$

```python
def F(G, k: int)
    V, E = G
    S = list(range(V))
    for i in V:
        for u, v in E:
            if u == i or v == i:
                S[i].add((u, v))
    return E, S, k
```

Complexitatea temporală a lui `F` este liniară.

$$ \text{Vertex Cover} \iff \text{Set Cover} $$

**Analizăm implicația directă:**

$$ \text{Vertex Cover} \Rightarrow \text{Set Cover} $$

Dacă `Vertex Cover` este satisfacută, fiecare muchie are cel puţin un nod în
mulţimea de acoperire `(S)`. Din construcţia lui `F`, vedem că muchiile
nodurilor din această listă sunt suficiente pentru a acoperi tot graful. Pentru
că mulţimea din problema `Set Cover` este mulţimea muchiilor din graf `(E)`,
înseamnă că `S[i]` acoperă întreaga listă.

**Analizăm implicația inversă:**

$$ \text{Vertex Cover} \Leftarrow \text{Set Cover} $$

Invers, dacă `Set Cover` este rezolvabilă, înseamnă că există o mulţime de
mulţimi `C` care, reunite, acoperă toată mulţimea mare. Din construcţia lui `F`,
fiecare muchie din `C` are asociat în graf un nod. Mulţimea acestor noduri `(S)`
conţine noduri de pe fiecare muchie (prin definiţia lui `Set Cover`), deci
respectă condiţia de `Vertex Cover`.
