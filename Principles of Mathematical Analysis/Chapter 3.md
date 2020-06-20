**3.1**

Prove that convergence of $\{s_n\}$ implies convergence of $\{|s_n|\}$. Is the converse true?

<!-- Consider a convergent sequence $\{s_n\}$. Since $\{s_n\}$ is convergent we know for any $\epsilon > 0$ there is an integer $N$ such that $n \geq N$ implies that $d(p_n, p ) < \epsilon$, where $p$ is the point of convergence.  Consider then an epsilon $\epsilon_1$ for $\{|s_n|\}$.  Consider any two points of $\{s_n\}$, $s_n$ and $s_{n+1}$ consider then $d = d(s_n, s_{n + 1})$. -->

Fix $\epsilon > 0$.  Since we know that $\{s_n\}$ is convergent we may produce a $N_1$ for $\epsilon$ such that $n \geq N_1$ implies that $d(s_n, p ) < \epsilon$. We also presume the following property of the embbeded metric space $X$ : $d(\bold{y}, \bold{x}) = d(|\bold{y}|, |\bold{x}|), x \in X$(Which is true in any $\mathbb{R}^k$). This allows us to use the same $N_1$ since $d(|s_n|, |p|) = d(s_n, p ) < \epsilon$.

The converse is false, consider the counter example of $\{ 1, -1, 1, -1, 1, -1, ... \}$ 

**3.2**

Calculate $\lim_{n\to\infty} (\sqrt{n^2 + n} - n)$.

$$\sqrt{n^2 + n} - n$$

$$\frac{\sqrt{n^2 + n} + n}{\sqrt{n^2 + n} + n} \cdot \frac{\sqrt{n^2 + n} - n}{1}$$
$$\frac{n}{\sqrt{n^2 + n} + n}$$
$$\frac{1}{\sqrt{1 + \frac{1}{n}} + 1}$$
$$\frac{1}{\sqrt{1} + 1}$$
$$\frac{1}{2}$$

**3.3**
