# O coadă implementată folosind două stive

- Considerăm următoarea structură de date: o coadă ce este implementată utilizând două stive: $A$ și $B$.
- Atunci când dorim să dăm `push` la un element nou în coadă, îl vom adăuga în stiva $A$.
- Atunci când dorim să dăm `pop` unui element din coadă, îl vom extrage din stiva $B$.
- Dacă stiva $B$ este goală, vom muta elementele din stiva A în stiva B, iar apoi vom executa un `pop` pe stiva $B$.
-  Determinați complexitatea amortizată, folosind *metoda creditelor* sau *metoda potențialului*.

Pentru niște poze care explică vizual ideea urmăriți explicațile de la [această adresă](https://stackoverflow.com/questions/69192/how-to-implement-a-queue-using-two-stacks).

## Metoda potențialului

Alegem o funcție de potențial

$$\Phi(D_i) = 2 \cdot size(A_i)$$

- Calculăm valoarea costului amortizat pentru fiecare situație.

- $\hat{\mathrm{c}}_{i} = c_{i} + \Phi(D_i) - \Phi(D_{i-1})$

- $c_0 = 0$
- $\Phi(D_0) = 0$
- $\Phi(D_i) \geq \Phi(D_0), \forall i$


**Atenție**: Indicele $i$ indexează o operație din secvență, nu și tipul ei. De exemplu prima operație, $i=1$, este un `push`, iar următoarea, $i=2$, poate fi un `pop`.

|Tipul operației $i$|Cost real $c_i$|Cost amortizat $\hat{c}_i$|
|-|-|-|
|`push`|1|$c_i + 2 \cdot \underbrace{size(A_{i+1})}_{size(A_i) + 1} - 2 \cdot size(A_i) = 3$|
|`pop` (`!is_empty(B)`)|1|$c_i + 2 \cdot \underbrace{size(A_{i+1})}_{size(A_i)} - 2 \cdot size(A_i) = 1$|
|`pop` (`is_empty(B)`)|$2 \cdot size(A_i)$|$c_i + \underbrace{size(A_{i+1})}_{0} - 2 \cdot size(A_i) = 0$|

$$\Rightarrow \hat{c}_i \in \Theta(1)$$