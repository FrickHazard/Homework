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

If $s_1$ = $\sqrt{2}$, and $s_{n +1} = \sqrt{2 + \sqrt{s_n}}$ $(n= 1, 2, 3, ...),$ prove that $\{s_n\}$ converges, and that $s_n < 2$ for $n = 1,2,3...$ .

Fix $\epsilon > 0$

Ideas

* Examine $d(s_n, s_{n - 1})$, $n > 1$ $d = | \sqrt{2 + \sqrt{s_n}} - \sqrt{2 + \sqrt{s_{n-1}}}|$ $= |\sqrt{2 + \sqrt{2 + \sqrt{s_{n-1}}}} - \sqrt{\sqrt{2 + \sqrt{s_{n-1}}}}| = |\sqrt{2 + \sqrt{a}} - a|$
* Since $\mathbb{R}^k$ is complete, proving the sequence is Cauchy will be sufficent.
* Proof by induction that $s_n < 2$ for $(n = 1,2,3...)$, should be easy enough since every term beneath square root bar has to be less than 4 and thus less than 2.

**Proof by induction** on $n$, that every $s_n$ is less than $2$.\
**Base case** : $\sqrt{2}$ is less than $2$.\
**Induction step** : We are given $s_n < 2$. Using the definition of $s$ we know that $s_{n + 1}= \sqrt{2 + \sqrt{s_n}}$ since $s_n < 2 \implies$ $\sqrt{s_n} < 2 \implies$ $2 + \sqrt{s_n} < 4 \implies$ $\sqrt{2 + \sqrt{s_n}} < 2$.  All of this stems from the fact the square roots do not change inequailties and futher more, are determined by a unique root. 

**3.4**

Find the upper and lower limits of the sequence $\{s_n\}$ defined by 

$$s_1 = 0;  s_{2m} = \frac{s_{2m - 1}}{2}; s_{2m+1} = \frac{1}{2} + s_{2m}$$

The upper limit of $s$ is $1$. the lower limit of $s$ is $\frac{1}{2}$.

For any $\epsilon > 0$ we can find a number whose distance to $1$ is less than $\epsilon$. This can be seen by considering by the pattern of $0, \frac{1}{2},$ $\frac{1}{4}$, $\frac{3}{4}$, $\frac{3}{8}$, $\frac{7}{8}$, $\frac{7}{16}$, $\frac{15}{16}$ $....$. Likewise for any $\epsilon > 0$ we can find an arbituarily close element in $S$ less than $\frac{1}{2}$(The odd terms). 

**3.5**

For any two real sequences $\{a_n\}$, $\{b_n\}$, prove that

$$\lim_{n \to \infin} sup (a_n + b_n) \leq \lim_{n \to \infin} \sup a_n + \lim_{n \to \infin} \sup b_n$$,

provided the sum on the right is not of the form $\infin - \infin$.


**Lemma 1**

Every sub sequence $\{s_i\}$ of $\lim_{n \to \infin} sup (a_n + b_n)$ cannot be greater than $\lim_{n \to \infin} \sup a_n +$ $\lim_{n \to \infin} \sup b_n$.

Consider then any subsequence $\{ s_i \} \to s$ of $(a_n + b_n)$.  The limit $s$ of $\{ s_i \}$ cannot be greater than $\lim_{n \to \infin} \sup a_n +$ $\lim_{n \to \infin} \sup b_n$, since $\lim (s_n + t_n) = t + s$ holds, for any two convergent sequences, and since $\sup a_n$ and $\sup b_n$ are the supremum of subsequences, then their sum must be at least that of $s$. (We use the assumption in the problem statement to handle the $\infin - \infin$ scenario.  We also are using the property of $\mathbb{R}$ that a $\sup$ always exists.)

**Proof by negation**

Suppose that 
$$\lim_{n \to \infin} sup (a_n + b_n)> \lim_{n \to \infin} \sup a_n + \lim_{n \to \infin} \sup b_n$$
were true.  However this leads to a contradiction, since we may show that this violates the leastness criteria of sup. Using the lemma above, we have effectively shown that $\lim_{n \to \infin} \sup a_n +$ $\lim_{n \to \infin} \sup b_n$ is a bound for every sequence in $\lim_{n \to \infin} sup (a_n + b_n)$.  And since our negation hypothesis assumes that $\lim_{n \to \infin} sup (a_n + b_n)$ is greater than $\lim_{n \to \infin} \sup a_n + \lim_{n \to \infin} \sup b_n$, the $\sup$ of the convergences of the subsequences of  $\lim_{n\to\infin}(a_n + b_n)$ cannot be a supremum since it is not the smallest upper bound.  The negation of $>$ implies $\leq$, and our proof is done∎

**Examples**

Consider the following two pairs of sequences.

$$0, 1, 0, 1, 0, 1, ...$$
$$1, 0, 1, 0, 1, 0, ...$$

$\lim_{n \to \infin} sup (a_n + b_n) = 1 < 2 = \lim_{n \to \infin} \sup a_n + \lim_{n \to \infin} \sup b_n$

$$0, 1, 0, 1, 0, 1, ...$$
$$0, 1, 0, 1, 0, 1, ...$$

$\lim_{n \to \infin} sup (a_n + b_n) = 2 = 2 = \lim_{n \to \infin} \sup a_n + \lim_{n \to \infin} \sup b_n$

As a interesting note, I conjecture when $a = b$, then equality always holds.

**3.6**

Investigate the behaviour (convergence or divergence) of $\sum a_{n}$ if

($a$) $$a_n = \sqrt{n + 1} - \sqrt{n}$$

($b$) $$a_n = \frac{\sqrt{n+1} - \sqrt{n}}{n}$$

($c$) $$a_n = (\sqrt[n]{n} -1)^n$$

($d$) $$a_n = \frac{1}{1+z^n}$$

For complex values of $z$.


($a$)

$$\frac{\sqrt{n+1} +\sqrt{n}}{\sqrt{n+1} +\sqrt{n}} \cdot \frac{\sqrt{n+1} -\sqrt{n}}{1}$$

$$\frac{1}{\sqrt{n+1} +\sqrt{n}}$$

We know that $\frac{1}{n}$ diverges and $n > \sqrt{n + 1} + \sqrt{n}$ where $n \geq 5$, we may apply the contrapositive of the, comparison test since $|a_n| \leq \frac{1}{n}$, for $N_0 = 5$ thus the series diverges.


($c$)

Consider a geometric series $\sum_{n=0}^{\infin} x^n$, we know that when $x < 1$ the series converges.  We combine this fact with the comparison test to show that

$$a_n = (\sqrt[n]{n} -1)^n$$

does indeed converge.

Consider when $x = 0.99$, and when $n = 2$, $a_n \approx 0.17$.  It can be deduced that every $a_n < a_{n+1}$ from ordering properties of exponents.  Since  $(\sqrt[n]{n} -1) < x$ for every $n$ and both are raisesd to $n$, we conclude the series must converge by the comparison test.

($d$)


**3.7**


Consider the following inequality $0 \leq (a - b)^2 = a^2 - 2ab + b^2 \implies 2ab \leq a^2 +b^2$.  We use this fact to construct a sequence suitable to compare to $\frac{\sqrt{a_n}}{n}$.  Since $a_n$ converges and the harmonic series $\frac{1}{n^2}$ converges, we know that $a_n + \frac{1}{n^2}$ converges.  Now consider when $a = \sqrt{a_n}$ and $b = \frac{1}{n}$, so then $\frac{2\sqrt{a_n}}{n} \leq a_n +\frac{1}{n^2}$.  Going back we modify $b$ by setting it equal to $b = \frac{1}{2n}$.  Since multiplying a convergent series by a constant factor is still convergent we obtain the bound we need.