# Teorema lui Master pentru "subtract-and-conquer"

> $T(n) = a \cdot T(n-b) + f(n), a, b \in \mathbb{N}^*$
>
> $T(i) \in \Theta(1), \forall i \in \mathbb{N}^*, i < b$^[Pentru simplitatea formulelor am folosit și cazul de bază pentru $n=0$.]
>
> $f(n) \in O(n^p)$

Notăm $h = \left\lfloor {n \over b} \right\rfloor$.

\begin{align*}
   T(n) &= a \cdot T(n - b) &+ \textcolor{teal}{f(n)} \\
   a \cdot T(n - b) &= a^2 \cdot T(n - 2 \cdot b) &+ \textcolor{teal}{a \cdot f(n - b)} \\
   a^2 \cdot T(n - 2 \cdot b) &= a^3 \cdot T(n - 3 \cdot b) &+ \textcolor{teal}{a^2 \cdot f(n - 2b)} \\
   &\ldots \\
   \textcolor{red}{a^k \cdot T(n - k \cdot b)} &= \textcolor{red}{a^{k+1} \cdot T(n - (k + 1) \cdot b)} &+ \textcolor{teal}{a^k \cdot f(n - k \cdot b)} \\
   &\ldots \\
   a^{h - 1} \cdot T(n - (h - 1) \cdot b) &= \textcolor{blue}{a^h \cdot \underbrace{T\left(n - h \cdot b\right)}_{\Theta(1)}} &+ \textcolor{teal}{a^{h-1} \cdot f(n - (h - 1)b)}
\end{align*}

$$\boxed{\Rightarrow T(n) = \textcolor{blue}{a^{\lfloor {n \over b} \rfloor} \cdot \Theta(1)} + \textcolor{teal}{\sum_{k = 0}^{h - 1} a^k \cdot f(n -k \cdot b)}}$$


$$\textcolor{teal}{
   Q(n) = 
   \sum_{k = 0}^{h - 1} a^k \cdot f(n -k \cdot b) =
   \sum_{k = 0}^{h - 1} a^k O((n - k \cdot b)^p) =
   \sum_{k = 0}^{h - 1} a^k O(n^p)
}$$

$$ \sum_{i = 0}^{j - 1} a^i = {a^j - 1 \over a - 1} $$

$$ \sum_{k = 0}^{h - 1} a^k = 
\begin{cases}
   O(1) & a < 1 \text{ deoarece } \lim_{n \to \infty}{a^{\lfloor {n \over b} \rfloor}} = 0  \\
   O(n) & a = 1 \\
   O(a^h) & a > 1
\end{cases}
$$


$$Q(n) =
\begin{cases}
   O(n^p) & a < 1 \\
   O(n^{p+1}) & a = 1 \\
   O(a^{\lfloor {n \over b} \rfloor} \cdot n^p) & a > 1
\end{cases}
$$

$$\textcolor{blue}{a^{\lfloor {n \over b} \rfloor} \cdot \Theta(1)} =
\begin{cases}
   O(1) & a < 1 \\
   O(n) & a = 1 \\
   O(a^{\lfloor {n \over b} \rfloor}) & a > 1
\end{cases}
$$


$$\boxed{T(n) =
\begin{cases}
   O(n^p) & a < 1 \\
   O(n^{p+1}) & a = 1 \\
   O(a^{\lfloor {n \over b} \rfloor} \cdot n^p) & a > 1
\end{cases}
}$$

<!-- 
$$
\lim_{n \to \infty}{{\textcolor{teal}{
   \sum_{k = 0}^{h - 1} a^k \cdot f(n -k \cdot b)
}} \over
   c \cdot n^p
} = 
\lim_{n \to \infty}{
   \sum_{k = 0}^{h - 1} a^k \cdot {f(n -k \cdot b) \over c \cdot n^p}
} = 
\lim_{n \to \infty}{ {1 \over c}
   \sum_{k = 0}^{h - 1} a^k \cdot (1 - {k \cdot b \over n})^p
}
= L
$$

Fie $x_k = a^k \cdot {f(n -k \cdot b) \over c \cdot n^p}, k = \overline{1, h-1}$.

$$lim_{k \to \infty}{x_n} = O(a^k)$$

$$\Rightarrow
L = {1 \over c} \sum_{k = 0}^{h - 1} O(a^k) = O\left({a^h - 1 \over a - 1}\right)
$$

$$\Rightarrow
{\textcolor{teal}{
   \sum_{k = 0}^{h - 1} a^k \cdot f(n -k \cdot b)
}} =
O\left({a^h - 1 \over a - 1} n^p \right)
$$ -->