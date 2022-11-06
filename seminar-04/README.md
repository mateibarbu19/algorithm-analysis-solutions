# Exercițiul 1

> $T(n)=2 \cdot T(n - 1) + 1$

$$\begin{aligned}
   T(n) &= 2 \cdot T(n - 1) &+ \textcolor{teal}{1} \\
   2 \cdot T(n - 1) &= 2^2 \cdot T(n - 2) &+ \textcolor{teal}{2} \\
   2^2 \cdot T(n - 2) &= 2^3 \cdot T(n - 3) &+ \textcolor{teal}{2^2} \\
   &\ldots \\
   \textcolor{red}{2^k \cdot T(n - k)} &= \textcolor{red}{2^{k+1} \cdot T(n - (k + 1))} &+ \textcolor{teal}{2^k} \\
   &\ldots \\
   2^{n - 1} \cdot T(n - (n - 1)) &= \textcolor{blue}{2^n \cdot \underbrace{T(0)}_{\Theta(1)}} &+ \textcolor{teal}{2^{n - 1}} \\
\end{aligned}$$

$$\textcolor{teal}{\sum_{k = 0}^{n - 1} 2^{k} = {2^n - 1 \over 2 - 1} = 2^n - 1}$$

$$\Rightarrow T(n) \in \Theta(\textcolor{blue}{2^n} + \textcolor{teal}{2^n - 1}) = \Theta(2^n)$$

# Exercițiul 2

> $T(n) = T(n - 2) + \Theta(n)$

Notăm

- $h = \left\lfloor {n \over 2} \right\rfloor$.
- $f(n) = c \cdot n \in \Theta(n)$, unde c este o constantă, **fixată**.^[Această simplificare este acceptată, vezi @cormen2009introduction, cap. 4.4]

$$\begin{aligned}
   T(n) &= T(n - 2) &+ \textcolor{teal}{c \cdot n} \\
   T(n - 2) &= T(n - 4) &+ \textcolor{teal}{c(n - 2)} \\
   T(n - 4) &= T(n - 6) &+ \textcolor{teal}{c(n - 4)} \\
   &\ldots \\
   \textcolor{red}{T(n - 2k)} &= \textcolor{red}{T(n - 2(k + 1))} &+ \textcolor{teal}{c(n - 2k)} \\
   &\ldots \\
   T(n - 2(h - 1)) &= \textcolor{blue}{\underbrace{T(n - 2h)}_{\Theta(1)}} &+ \textcolor{teal}{c(n-2(h-1))} \\
\end{aligned}$$

$$\begin{aligned}
\sum_{k = 0}^{h - 1} c(n-2k) &= h \cdot c \cdot n - 2c \cdot \sum_{k = 0}^{h - 1} k = h \cdot c \cdot n - c \cdot (h - 1) \cdot h = \\
&= c \cdot h \cdot (n - h +1) = c \cdot \left\lfloor {n \over 2} \right\rfloor \cdot (n - \left\lfloor {n \over 2} \right\rfloor + 1)
\end{aligned}$$
$$\Rightarrow T(n) \in \Theta(n^2)$$


# Exercițiul 3

> $T(n) = T(n - k) + \Theta(n),\ k$ const

Notăm:

- $h = \left\lfloor {n \over k} \right\rfloor$.
- $f(n) = c \cdot n \in \Theta(n)$, unde c este o constantă, **fixată**.

$$\begin{aligned}
   T(n) &= T(n - k) &+ \textcolor{teal}{c \cdot n} \\
   T(n - k) &= T(n - 2k) &+ \textcolor{teal}{c(n - k)} \\
   T(n - 2k) &= T(n - 3k) &+ \textcolor{teal}{c(n - 2k)} \\
   &\ldots \\
   \textcolor{red}{T(n - l \cdot k)} &= \textcolor{red}{T(n - (l + 1) \cdot k)} &+ \textcolor{teal}{c(n - l \cdot k)} \\
   &\ldots \\
   T(n - (h - 1) \cdot k) &= \textcolor{blue}{\underbrace{T(n - h \cdot k)}_{\Theta(1)}} &+ \textcolor{teal}{c(n-(h-1) \cdot k)} \\
\end{aligned}$$

$$\begin{aligned}
\sum_{l = 0}^{h - 1} c(n-l \cdot k) &= h \cdot c \cdot n - c \cdot k \cdot \sum_{l = 0}^{h - 1} l = h \cdot c \cdot n - c \cdot k \cdot {(h - 1) \cdot h \over 2}\\
&= c \cdot h \cdot (n - {k \over 2} \cdot h + {k \over 2}) = c \cdot \left\lfloor {n \over k} \right\rfloor \cdot (n - {k \over 2} \cdot \left\lfloor {n \over k} \right\rfloor + {k \over 2})
\end{aligned}$$
$$\Rightarrow T(n) \in \Theta(n^2)$$


# Exercițiul 4

> $T(n) = T(n - a) + T(a) + \Theta(n), a \geq 1$
>
> $T(a) \in \Theta(1)$

$$\begin{aligned}
T(n) &= T(n-a) + T(a) + \Theta(n) = T(n-a) + \Theta(1) + \Theta(n)\\
&= T(n-a) + \Theta(n)
\end{aligned}$$

Ca la exercițiul 3, pentru $k=a$.

# Exercițiul 5

> $T(n) = 2T({n \over 3}) + n \cdot log(n)$
> 
> $T(1), T(2) \in \Theta(1)$

Identificăm:

- $h = \left\lfloor log_3(n) \right\rfloor$


$$\begin{aligned}
   T(n) &= 2T({n \over 3}) &+ \textcolor{teal}{n \cdot log(n)} \\
   2T({n \over 3}) &= 2^2 T({n \over 3^2}) &+ \textcolor{teal}{{2 \over 3}n \cdot log({n \over 3})} \\
   2^2 T({n \over 3^2}) &= 2^3 T({n \over 3^3}) &+ \textcolor{teal}{({2 \over 3})^2 n \cdot log({n \over 3^2})} \\
   &\ldots \\
   \textcolor{red}{2^kT({n \over 3^k})} &= \textcolor{red}{2^{k+1}T({n \over 3^{k+1}})} &+ \textcolor{teal}{({2 \over 3})^k n \cdot log({n \over 3^k})} \\
   &\ldots \\
   2^{h-1}T({n \over 3^{h-1}}) &= \textcolor{blue}{2^h\underbrace{T({n \over 3^h})}_{\Theta(1)}} &+ \textcolor{teal}{({2 \over 3})^{h-1} n \cdot log({n \over 3^{h-1}})} \\
\end{aligned}$$

$$\begin{aligned}
T(n) &= 2^h + \sum_{k = 0}^{h - 1} ({2 \over 3})^k n \cdot log({n \over 3^k}) = 2^h + n\sum_{k = 0}^{h - 1} ({2 \over 3})^k \cdot (log(n)-log(3^k))\\
&=2^h + n \cdot log(n)\sum_{k = 0}^{h - 1} ({2 \over 3})^k - log(3) \sum_{k = 0}^{h - 1} ({2 \over 3})^k \cdot k
\end{aligned}$$

Folosim:

$$\sum_{k = 0}^{h - 1} ({2 \over 3})^k = {({2 \over 3})^h-1 \over {2 \over 3} - 1} = 2-3({2 \over 3})^h$$

Fie:

$$S(n) =\sum_{k = 1}^{n} ({2 \over 3})^k \cdot k$$

Rescriem această sumă în două feluri:

$$\begin{aligned}
S(n) &= \sum_{k = 1}^{n} ({2 \over 3})^k \cdot (1 + (k - 1)) \\
&= \sum_{k = 1}^{n} ({2 \over 3})^k + {2 \over 3} \sum_{k = 1}^{n-1} ({2 \over 3})^k \cdot (k-1) \\
&= \sum_{k = 1}^{n} ({2 \over 3})^k + {2 \over 3} \sum_{k = 1}^{n-1} ({2 \over 3})^k \cdot k \\
&= {({2 \over 3})^{n+1}-{2 \over 3}\over {2 \over 3}-1} + {2 \over 3}S(n-1) \\
&= 2-3({2 \over 3})^{n+1} + {2 \over 3}S(n-1)
\end{aligned}$$

Și o mai rescriem astfel:

$$\begin{aligned}
S(n) &= \sum_{k = 1}^{n - 1} ({2 \over 3})^k k + n({2 \over 3})^n \\
&= S(n-1) + n({2 \over 3})^n
\end{aligned}$$

Apoi egalăm cele două forme:

$$\begin{aligned}
S(n-1)+n({2 \over 3})^n &= 2-3({2 \over 3})^{n+1} + {2 \over 3}S(n-1) \\
{1 \over 3}S(n-1) &= 2-3({2 \over 3})^{n+1}-n({2 \over 3})^n \\
S(n-1) &= 3(2-3({2 \over 3})^{n+1}-n({2 \over 3})^n) \\
S(n-1)&=6-3({2 \over 3})^n(2+n)
\end{aligned}$$

$$T(n)=\underbrace{2^h}_{\Theta(n)}+\underbrace{n \cdot log(n) \cdot (2-3({2 \over 3})^h)}_{\Theta(n \cdot log(n))} - log(3) \cdot (6-\underbrace{3({2 \over 3})^h(h+2)}_{\Theta(n)})$$

$$\Rightarrow T(n) \in \Theta(n \cdot \log n)$$

# Exercițiul 7

> $T(n) = T(\sqrt n) + \log n$
>
> $T(1) \in \Theta(1)$

Facem o schimbare de variabilă:

$$n = 2^m$$
$$m = \log_2 n$$

$$\begin{aligned}
T(2^m) &= T(\sqrt2^m) + m \\
   &= T(2^{m \over 2}) + m
\end{aligned}$$

Notăm:

$$\begin{aligned}
S(m) &= T(2^m) \\
&= S({m \over 2}) + m
\end{aligned}$$

Știm din recurența cunoscută care modelează algoritmul de sortare prin interclasare că:

$$S(m) \in \Theta(m \log m)$$

Deci:

$$T(n) \in \Theta(\log n \cdot \log \log n)$$

# Exercițiul 12

> $T(n) = T({n \over 2}) + T({n \over 4}) + n^2$
>
> $T(1), T(2), T(3) \in \Theta(1)$

Observăm că funcția este crescătoare, fapt ce se poate demonstra prin inducție.

Deci vom majora și minora termenul general cu niște recurențe mai ușor de calculat.

$$\underbrace{T({n \over 4}) + n^2}_{\Theta(n^2)} \leq T(n) \leq \underbrace{2T({n \over 2}) + n^2}_{\Theta(n^2)}$$

$$\Rightarrow T(n) \in \Theta(n^2)$$

# Exercițiul 13

> $T(n) = T({n \over 2} + \log_2 n) + n$
>
> $T(1) \in \Theta(1)$

Folosim inegalitatea:

$$\log_2 n \leq {n \over 4}, \forall n \geq 16$$

$$\underbrace{T({n \over 2}) + n}_{\Theta(n)}\leq T(n) \leq \underbrace{T({3n \over 4}) + n}_{\Theta(n)}$$

# Exercițiul 14

> $T(n) = 4T({n \over 2}) + T({n \over 4}) + {n^2 \over \log_2 n}$
> 
> $T(1), T(2), T(3) \in \Theta(1)$

![Arborele de recurență pentru $T(n)$](res/ex14_tree.svg)

$$\begin{aligned}
T(n) &= \Theta(n^{\log_2 4}) + c \sum_{k = 0}^{\log_2 (n) - 1} 4^k{({n \over 2^k})^2 \over \log_2({n \over 2^k})} \\
T(n) &= \Theta(n^2) + c \sum_{k = 0}^{\log_2 (n) - 1} 4^k{{n^2 \over 4^k} \over \log_2 n - \log_2 2^k} \\
&= \Theta(n^2) + c \cdot n^2 \sum_{k = 0}^{\log_2 (n) - 1} {1 \over \log_2(n) - k} \\
&= \Theta(n^2) + c \cdot n^2 \underbrace{(1 + {1 \over 2} + \ldots + {1 \over \log_2n}}_{\Theta(\log \log n)})
\end{aligned}$$

Am folosit următorul fapt cunoscut:

$$\sum_{i = 1}^{m} {1 \over i} = \Theta(\log m)$$

$$\Rightarrow T(n) = \Theta(n^2 \log \log n)$$

# Bibliografie
