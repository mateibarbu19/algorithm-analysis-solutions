# Exercițiul 1

> $T(n)=2 \cdot T(n - 1) + 1$

Identificăm:

- $a = 2$
- $b = 1$
- $h = \left\lfloor {n \over 1} \right\rfloor = n$.
- $f(n) = 1 \in \Theta(1)$.

\begin{align*}
   T(n) &= 2 \cdot T(n - 1) &+ \textcolor{teal}{1} \\
   2 \cdot T(n - 1) &= 2^2 \cdot T(n - 2) &+ \textcolor{teal}{2} \\
   2^2 \cdot T(n - 2) &= 2^3 \cdot T(n - 3) &+ \textcolor{teal}{2^2} \\
   &\ldots \\
   \textcolor{red}{2^k \cdot T(n - k)} &= \textcolor{red}{2^{k+1} \cdot T(n - (k + 1))} &+ \textcolor{teal}{2^k} \\
   &\ldots \\
   2^{n - 1} \cdot T(n - (n - 1)) &= \textcolor{blue}{2^n \cdot \underbrace{T(0)}_{\Theta(1)}} &+ \textcolor{teal}{2^{n - 1}} \\
\end{align*}

$$\textcolor{teal}{\sum_{k = 0}^{n - 1} 2^{k} = {2^n - 1 \over 2 - 1} = 2^n - 1}$$

$$\Rightarrow T(n) \in \Theta(\textcolor{blue}{2^n} + \textcolor{teal}{2^n - 1}) = \Theta(2^n)$$


# Exercițiul 2

> $T(n) = T(n - 2) + \Theta(n)$

Identificăm:

- $a = 1$
- $b = 2$
- $h = \left\lfloor {n \over 2} \right\rfloor$.
- $f(n) = c \cdot n \in \Theta(n)$, unde c este o constantă, **fixată**.

\begin{align*}
   T(n) &= T(n - 2) &+ \textcolor{teal}{c \cdot n} \\
   T(n - 2) &= T(n - 4) &+ \textcolor{teal}{c(n - 2)} \\
   T(n - 4) &= T(n - 6) &+ \textcolor{teal}{c(n - 4)} \\
   &\ldots \\
   \textcolor{red}{T(n - 2k)} &= \textcolor{red}{T(n - 2(k + 1))} &+ \textcolor{teal}{c(n - 2k)} \\
   &\ldots \\
   T(n - 2(h - 1)) &= \textcolor{blue}{\underbrace{T(n - 2h)}_{\Theta(1)}} &+ \textcolor{teal}{c(n-2(h-1))} \\
\end{align*}

$$\sum_{k = 0}^{h - 1} c(n-2k) = h \cdot c \cdot n - 2\sum_{k = 0}^{h - 1} k$$


<!-- ## Exemplu pentru $n = 5$

\begin{align*}
   T(5) &= T(3) &+ \textcolor{teal}{5c} \\
   T(3) &= T(1) &+ \textcolor{teal}{3c}
\end{align*}

$$\Rightarrow T(5) = \underbrace{T(1)}_{\Theta(1)} + 8c$$

## Exemplu pentru $n = 6$

\begin{align*}
   T(6) &= T(4) &+ \textcolor{teal}{6c} \\
   T(4) &= T(2) &+ \textcolor{teal}{4c}
\end{align*}

$$\Rightarrow T(6) = \underbrace{T(2)}_{\Theta(1)} + 10c$$

## Observație asupra adâncimii

În ceea ce privește funcția de timp, pentru o intrare impară, recursivitatea ajunge la cazul de bază, $T(1)$. Dar pentru o intrare pară, aceasta ajunge la cazul de bază $T(2)$. -->

