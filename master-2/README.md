# Teorema lui Master pentru "subtract-and-conquer"

## Enunț

> $T(n) = a \cdot T(n-b) + f(n), a, b \in \mathbb{N}^*$
>
> $T(i) \in \Theta(1), \forall i \in \mathbb{N}^*, i \leq b$
>
> $f(n) \in O(n^p)$
>
> $f$ este o funcție totală.

## Demonstrație

### Formă generală

Notăm $h = \left\lfloor {n - 1 \over b} \right\rfloor$.

$$\begin{aligned}
   T(n) &= a \cdot T(n - b) &+ \textcolor{teal}{f(n)} \\
   a \cdot T(n - b) &= a^2 \cdot T(n - 2 \cdot b) &+ \textcolor{teal}{a \cdot f(n - b)} \\
   a^2 \cdot T(n - 2 \cdot b) &= a^3 \cdot T(n - 3 \cdot b) &+ \textcolor{teal}{a^2 \cdot f(n - 2b)} \\
   &\ldots \\
   \textcolor{red}{a^k \cdot T(n - k \cdot b)} &= \textcolor{red}{a^{k+1} \cdot T(n - (k + 1) \cdot b)} &+ \textcolor{teal}{a^k \cdot f(n - k \cdot b)} \\
   &\ldots \\
   a^{h - 1} \cdot T(n - (h - 1) \cdot b) &= \textcolor{blue}{a^h \cdot \underbrace{T\left(n - h \cdot b\right)}_{\Theta(1)}} &+ \textcolor{teal}{a^{h-1} \cdot f(n - (h - 1)b)}
\end{aligned}$$

$$\boxed{\Rightarrow T(n) = \textcolor{blue}{\underbrace{a^h \cdot \Theta(1)}_{P(n)}} + \textcolor{teal}{\underbrace{\sum_{k = 0}^{h - 1} a^k \cdot f(n -k \cdot b)}_{Q(n)}}}$$

### Analiza costurilor de "substract"

$$P(n) =
\begin{cases}
   \Theta(1) & a \leq 1 \\
   \Theta(a^{\lfloor {n \over b} \rfloor}) & a > 1
\end{cases}
$$

### Analiza costurilor de "conquer"

Vrem să arătăm că:
$$Q(n) \in O\left(\sum_{k = 0}^{h - 1} a^k n^p\right)$$

Pentru asta trebuie să arătăm că $\exists c_1 \in \mathbb{R}_+, n_1 \in \mathbb{N}, \forall n \geq n_1$:

$$\sum_{k = 0}^{h - 1} a^k \cdot f(n -k \cdot b) \leq c_1 \sum_{k = 0}^{h - 1} a^k n^p$$

Știm că $f(n) \in O(n^p)$, deci $\exists c_0 \in \mathbb{R}_+, n_0 \in \mathbb{N}, \forall n \geq n_0$
$$f(n) \leq c_0 \cdot n^p$$

Vom impune condiția $n - k \cdot b \geq n_0 \Rightarrow k \leq \lfloor {n - n_0 \over b} \rfloor = i$, ca să mărginim superior așa:

$$f(n - k \cdot b) \leq c_0 (n - k \cdot b)^p, \forall k \leq i$$

Spargem suma în două pentru putea mărgini superior:

$$\begin{aligned}
Q(n)
   & \leq \sum_{k = 0}^{i} a^k f(n - k \cdot b) &+ \sum_{k = i}^{h-1} a^k f(n - k \cdot b) \\
   & \leq \sum_{k = 0}^{i} a^k \cdot c_0 \cdot (n - k \cdot b)^p &+ \sum_{k = i}^{h-1} a^k f(n - k \cdot b) \\
   & \leq \sum_{k = 0}^{i} a^k \cdot c_0 \cdot n^p &+ \sum_{k = i}^{h-1} a^k f(n - k \cdot b)
\end{aligned}$$

Ne folosim de faptul că pentru $\forall k > i, n - k \cdot b < n_0$.
Deoarece $f$ este o funcție totală, știm că $\exists m = \max \{f(n): n = \overline{1, n_0-1} \}$

$$\begin{aligned}
Q(n)
   & \leq \sum_{k = 0}^{i} a^k \cdot c_0 \cdot n^p + \sum_{k = i}^{h-1} a^k \cdot m \\
   & \leq c_1 \sum_{k = 0}^{h - 1} a^k n^p
\end{aligned}$$

Este adevărat pentru $c_1$ fixat, unde $c_1 = \max(c_0, m)$. Deci:

$$\boxed{Q(n) \in O\left(n^p \sum_{k = 0}^{h - 1} a^k\right)}$$

Avem în vedere că:

$$\sum_{k = 0}^{h - 1} a^k = 
\begin{cases}
   \Theta(1) & a < 1 \text{ deoarece } \lim_{h \to \infty}{a^h} = 0  \\
   \Theta(n) & a = 1 \\
   \Theta(a^h) & a > 1
\end{cases}
$$

$$Q(n) =
\begin{cases}
   O(n^p) & a < 1 \\
   O(n^{p+1}) & a = 1 \\
   O(a^{\lfloor {n - 1 \over b} \rfloor} \cdot n^p) & a > 1
\end{cases}
$$

## Combinarea lor

Observăm că indiferent de $a$, costul lui pentru "conquer" este mai mare decât cel pentru "divide".

$$\boxed{T(n) =
\begin{cases}
   O(n^p) & a < 1 \\
   O(n^{p+1}) & a = 1 \\
   O(a^{n \over b} \cdot n^p) & a > 1
\end{cases}
}$$
