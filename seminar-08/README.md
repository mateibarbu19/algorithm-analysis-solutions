# Exercitiul 1
$$ \text{3-Colorare} \leq_p \text{4-Colorare} $$

Inputul pentru ambele probleme este un graf, deci:

$$ F : G \rightarrow G $$

La trecerea de la 3-Colorare la 4-Colorare, adaugam un nod nou, unit cu toate celelalte noduri.

F(G<V, E>) {
    V2 = V U {n + 1}
    E2 = E U {(0, n + 1), (1, n + 1), ..., (n, n + 1)}
    return G<V2, E2>
}

F este polinomial (O(n))

$$ \text{3-Colorare} \leq_p \text{4-Colorare} $$
$$ \text{3-Colorare}(G) = 1 \iff \text{4-Colorare}(F(G)) = 1 $$

$$ \text{3-Colorare}(G) = 1 \Rightarrow \text{4-Colorare}(F(G)) = 1 $$

Pentru orice situatie in care graful se poate colora cu 3 culori, nodul nou va trebui maxim colorat cu o singura alta culoare, deci va respecta 4-Colorare.

$$ \text{3-Colorare}(G) = 1 \Leftarrow \text{4-Colorare}(F(G)) = 1 $$

Avem un nod (cel adaugat de noi, n + 1) care este conectat la toate celelalte noduri, deci trebuie sa aiba o culoare diferita fata de toate. Pentru ca problema este 4-Colorabila, inseamna ca, daca scoatem acest nod, graful care ramane (cel original) este 3-Colorabil.

# Exercitiul 2
$$ \text{Partition} \leq_p \text{q-Sum} $$

Inputul pentru Partition este o lista, iar pentru q-Sum este o lista si un intreg, deci:

$$ F : List \rightarrow (List, int) $$

F(List l) {
    let q = sum(l) / 2
    return l, q
}

$$ \text{Partition}(A) = 1 \iff \text{q-Sum}(F(A)) = 1 $$

$$ \text{Partition}(A) = 1 \Rightarrow \text{q-Sum}(F(A)) = 1 $$

Daca partition este rezolvabila, inseamna ca exista sectiuni S1 si S2 astfel incat A = S1 U S2, si sum(S1) = sum(S2), deci sum(A) = 2 * sum(S1).

Pentru ca am setat q sa fie sum(A) / 2 si lista sa fie aceeasi (A), inseamna ca S1 respecta conditia din q-Sum.

$$ \text{Partition}(A) = 1 \Leftarrow \text{q-Sum}(F(A)) = 1 $$

q-Sum este satisfacuta, deci exista o sectiune S din A, care insumata sa fie sum(A) / 2. Inseamna ca ce ramane in afara lui S (A - S) va insuma tot la sum(A) / 2, deci exista doua sectiuni care sa aiba aceeasi suma, respectand conditia de la Partition.

# Exercitiul 3
$$ \text{Independent Set} \leq_p \text{Vertex Cover} $$

Inputul pentru ambele este un graf si un intreg, deci:

$$ F : (graf, int) \rightarrow (graf, int) $$

F(G<V, E>, k) {
    return G, |V| - k
}

$$ \text{Independent Set}(G, k) == 1 \iff \text{Vertex Cover}(F(G, k)) == 1 $$

$$ \text{Independent Set}(G, k) == 1 \Rightarrow \text{Vertex Cover}(F(G, k)) == 1 $$

Daca Independent Set poate fi satisfacuta, inseamna ca oricare latura e = (u, v) apartinand lui E are cel mult un capat in S'. Ceea ce inseamna ca are cel putin un capat in V - S' = S. |S| = |V| - k', deci respecta conditia de la Vertex Cover.

$$ \text{Independent Set}(G, k) == 1 \Leftarrow \text{Vertex Cover}(F(G, k)) == 1 $$

Daca Vertex Cover poate fi satisfacuta, inseamna ca oricare latura e = (u, v) apartinand lui E are cel putin un capat in S. Ceea ce inseamna ca are cel mult un capat in V - S = S'. |S'| = |V| - k, deci respecta conditia de la Independent Set.

# Exercitiul 4
$$ \text{Vertex Cover} \leq_p \text{Set Cover} $$

Inputul pentru Vertex Cover este un graf si un intreg, iar pentru Set Cover este o lista, o lista de liste si un intreg.

$$ F : (graf, int) \rightarrow (list, list<list>, int) $$

F(G<V, E>, k) {
    let S = list(|V|)
    for i in G:
        for e = (u, v) in E:
            if u == i or v == i:
                S[i].add(e)
    return E, S, k
}

$$ \text{Vertex Cover} \iff \text{Set Cover} $$

$$ \text{Vertex Cover} \Rightarrow \text{Set Cover} $$

Daca Vertex Cover este satisfacuta, fiecare muchie are cel putin un nod in multimea de acoperire (S). Din constructia lui F, vedem ca muchiile nodurilor din aceasta lista sunt suficiente pentru a acoperi tot tot graful. Pentru ca multimea din problema de Set Cover este multimea muchiilor din graf (E), inseamna ca S[i] acopera intreaga lista.

$$ \text{Vertex Cover} \Leftarrow \text{Set Cover} $$

Invers, daca Set Cover este rezolvabila, inseamna ca exista o multime de multimi C care, reunite, acopera toata multimea mare. Din constructia lui F, fiecare muchie din C are asociat in graf un nod. Multimea acestor noduri (S) contine noduri de pe fiecare muchie (prin definitia lui Set Cover), deci respecta conditia de Vertex Cover.


# References
[1] https://math.stackexchange.com/questions/3241339/how-to-prove-that-the-4-coloring-problem-is-np-complete

[2] https://stackoverflow.com/questions/42063810/karp-reduction-from-partition-to-subset-sum

[3] https://opendsa-server.cs.vt.edu/ODSA/Books/Everything/html/independentSet_to_vertexCover.html

[4] http://www.cs.cornell.edu/courses/cs482/2007sp/NPComplete.pdf
