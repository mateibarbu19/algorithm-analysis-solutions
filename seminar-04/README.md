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

\begin{align*}
\sum_{k = 0}^{h - 1} c(n-2k) &= h \cdot c \cdot n - 2c \cdot \sum_{k = 0}^{h - 1} k = h \cdot c \cdot n - c \cdot (h - 1) \cdot h = \\
&= c \cdot h \cdot (n - h +1) = c \cdot \left\lfloor {n \over 2} \right\rfloor \cdot (n - \left\lfloor {n \over 2} \right\rfloor + 1)
\end{align*}
$$\Rightarrow T(n) \in \Theta(n^2)$$


# Exercițiul 3

> $T(n) = T(n - k) + \Theta(n),\ k$ const

Identificăm:

- $a = 1$
- $b = k$
- $h = \left\lfloor {n \over k} \right\rfloor$.
- $f(n) = c \cdot n \in \Theta(n)$, unde c este o constantă, **fixată**.

\begin{align*}
   T(n) &= T(n - k) &+ \textcolor{teal}{c \cdot n} \\
   T(n - k) &= T(n - 2k) &+ \textcolor{teal}{c(n - k)} \\
   T(n - 2k) &= T(n - 3k) &+ \textcolor{teal}{c(n - 2k)} \\
   &\ldots \\
   \textcolor{red}{T(n - l \cdot k)} &= \textcolor{red}{T(n - (l + 1) \cdot k)} &+ \textcolor{teal}{c(n - l \cdot k)} \\
   &\ldots \\
   T(n - (h - 1) \cdot k) &= \textcolor{blue}{\underbrace{T(n - h \cdot k)}_{\Theta(1)}} &+ \textcolor{teal}{c(n-(h-1) \cdot k)} \\
\end{align*}

\begin{align*}
\sum_{l = 0}^{h - 1} c(n-l \cdot k) &= h \cdot c \cdot n - c \cdot k \cdot \sum_{l = 0}^{h - 1} l = h \cdot c \cdot n - c \cdot k \cdot {(h - 1) \cdot h \over 2}\\
&= c \cdot h \cdot (n - {k \over 2} \cdot h + {k \over 2}) = c \cdot \left\lfloor {n \over k} \right\rfloor \cdot (n - {k \over 2} \cdot \left\lfloor {n \over k} \right\rfloor + {k \over 2})
\end{align*}
$$\Rightarrow T(n) \in \Theta(n^2)$$


# Exercițiul 4

> $T(n) = T(n - a) + T(a) + \Theta(cn), a \geq 1$ și $c > 0$ const

Identificăm:

- $T(a) \in \Theta(1)$
- $f(n) \in \Theta(c * n) = \Theta(n)$


\begin{align*}
T(n) &= T(n-a) + T(a) + \Theta(cn) = T(n-a) + \Theta(1) + \Theta(n)\\
&= T(n-a) + \Theta(n)
\end{align*}

Ca la exercițiul 3, pentru $k=a$


# Exercițiul 5

> $T(n) = 2T(n/3) + n \cdot log(n)$

Identificăm:

- $h = \left\lfloor log_3(n) \right\rfloor$


\begin{align*}
   T(n) &= 2T(n/3) &+ \textcolor{teal}{n \cdot log(n)} \\
   2T(n/3) &= 4T(n/9) &+ \textcolor{teal}{2n \cdot log(n/3)} \\
   4T(n/9) &= 8T(n/27) &+ \textcolor{teal}{4n \cdot log(n/9)} \\
   &\ldots \\
   \textcolor{red}{2^kT(n/3^k)} &= \textcolor{red}{2^{k+1}T(n /3^{k+1})} &+ \textcolor{teal}{2^kn \cdot log(n/3^k)} \\
   &\ldots \\
   2^{h-1}T(n/3^{h-1}) &= \textcolor{blue}{2^h\underbrace{T(n /3^h)}_{\Theta(1)}} &+ \textcolor{teal}{2^{h-1}n \cdot log(n/3^{h-1})} \\
\end{align*}

\begin{align*}
T(n) &= 2^h + \sum_{k = 0}^{h - 1} 2^kn \cdot log(n/3^k) = 2^h + n\sum_{k = 0}^{h - 1} 2^k \cdot (log(n)-log(3^k))\\
&=2^h + n \cdot log(n)\sum_{k = 0}^{h - 1} 2^k - \sum_{k = 0}^{h - 1} 2^k \cdot k \cdot log(3)\\
&\sum_{k = 0}^{h - 1} 2^k = 2^h-1 \\
\end{align*}
\begin{align*}
fie\ &S(n)=\sum_{k = 1}^{n} 2^k \cdot k = \sum_{k = 1}^{n} 2^k + 2 \sum_{k = 1}^{n-1} 2^k \cdot k = 2^{n+1}-2 + 2S(n-1)\\
dar\ &S(n) = n2^n+S(n-1)\\
\Rightarrow &2^{n+1}-2 + 2S(n-1) = n2^n+S(n-1)\\
&S(n-1)=n2^n-2^{n+1}+2 = 2^n(n-2)+2
\end{align*}

$$T(n)=2^h+n \cdot log(n) \cdot (2^h-1) - log(3) \cdot (2^h(h-2)+2)$$
dar $h \ll n \cdot log(n)$
$$\Rightarrow T(n) \in \Theta(n \cdot log(n) \cdot 2^h) = \Theta(n \cdot log(n) \cdot 2^{log_3(n)})$$




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

