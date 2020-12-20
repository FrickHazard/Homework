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
Surrender! Don't know the relationships involving $|z|$ and complex exponents.


**3.7**

Prove that the convergence of $\sum{a_n}$ implies the convergence if $a_n \geq 0$ of

$$\sum{\frac{\sqrt{a_n}}{n}}$$

Consider the following inequality $0 \leq (a - b)^2 = a^2 - 2ab + b^2 \implies 2ab \leq a^2 +b^2$.  We use this fact to construct a sequence suitable to compare to $\frac{\sqrt{a_n}}{n}$.  Since $a_n$ converges and the harmonic series $\frac{1}{n^2}$ converges, we know that $a_n + \frac{1}{n^2}$ converges.  Now consider when $a = \sqrt{a_n}$ and $b = \frac{1}{n}$, so then $\frac{2\sqrt{a_n}}{n} \leq a_n +\frac{1}{n^2}$.  Going back we modify $b$ by setting it equal to $b = \frac{1}{2n}$.  Since multiplying a convergent series by a constant factor is still convergent we obtain a suitable comparison series.  This then allows us to use the comparison test since we know that $a_n$ and the derived series terms are always non negative.

**3.8**

If $\sum{a_n}$ converges, and if $\{b_n\}$ is monotonic and bounded, prove that $\sum{a_nb_n}$ converges.

<!--

<!-- Consider then $l = \sup \ \{ b \}$ (note we could also, $l = \max(|\lim_{n \to \infin} \sup b_n|, |\lim_{n \to \infin} \inf b_n|)$).  Since $\{ b \}$ is bounded $-\infin < l < \infin$.  We wish to construct a series $\sum{a_n|l|}$ and show that this series converges. Since $|l|$ is a constant we know $\sum{a_n|l|}$ converges.  There are two cases, if $\sum{a_n}$ converges absolutely then we know that $a_nb_n \leq |a_n||l|$, for every term and we may then use the comparison test.  If $a_n$ does not converge absolutely things are more difficult.  Consider then if $\{b_n\}$ is montonically increasing. -->

<!-- Suppose $b_n \leq b_{n+1}$ the proof is symmetric in the other case.

Given an $\epsilon > 0$,

Since $\{b_n\}$ is bounded let us consider $s = \sup \ \{b_n\}$.  Consider then

$$\frac{\epsilon}{s}$$

We use $s\epsilon$ with $\sum{a_n}$, to produce $N > N_0$ such that $m \geq n \geq N$ implies

$$\left|s\sum^m_{k=n}{a_k}\right| = \left|\sum^m_{k=n}{sa_k}\right| \leq \epsilon$$

Consider the case where every $b_k$ is positive or if $b_k$ starts negative and crosses the sign flip past some $N_1$ (invert for monotone decreasing), then

$$\left| \sum{a_kb_k} \right| \leq \left| \sum{a_ks} \right|$$

Holds, and we have sucessfully bounded $\sum{a_kb_k}$.  Alternatively consider the case where every term is negative (invert for monotone decreasing) we then consider $s = \inf\{b_n\}$, so that again

$$\left| \sum{a_kb_k} \right| \leq \left| \sum{a_ks} \right|$$.

We know that any series with terms multiplied by a constant must converge, so we have shown any arbiturary partial sum must be bounded by $s$. -->

Consider theorem 3.42 and its sub lemma 3.41.  Essentially we use the monotonic property of $\{b_n\}$ to construct an inequality where by, since $\{b_n\}$ is bounded we have $|b_n| \leq M$.  We may use this $M$ to select the appropiate epsilone giving us that cauchy criterion to prove that $\sum{a_nb_n}$ converges.


**3.9** Find the radius of convergence of each of the following power series:

$$(a) \sum n^3z^n$$

$$(b) \sum \frac{2^n}{n!}z^n$$

$$(c) \sum \frac{2^n}{n^2}z^n$$

$$(d) \sum \frac{n^3}{3^n}z^n$$

$(a)$ Using 3.39 $\alpha = \lim\sup_{n\to\infin} \sqrt[n]{|n^3|}$. The $\lim$ and $\lim\sup$ of $\sqrt[n]{|n^3|}$ approaches $1$. In fact this is true for any $n^k$. So $R = \frac{1}{1} = 1$

$$(b) \ \alpha = \left(\lim \sup_{n\to\infin}  \left(\sqrt[n]{\frac{2^n}{n!}} = \frac{\sqrt[n]{2^n}}{\sqrt[n]{n!}} = \frac{2}{\sqrt[n]{n!}}\right)\right) = 0$$

So then $R = \infin$, which makes sense, since $\frac{1}{n!}$ dominates the other functions.

$$(c) \ \alpha = \lim \sup_{n\to\infin} \left( \sqrt[n]{\frac{2^n}{n^2}} = \frac{\sqrt[n]{2^n}}{\sqrt[n]{n^2}}=\frac{2}{\sqrt[n]{n^2}}\right) = \frac{2}{1}$$

So then $R = \frac{1}{a} = \frac{1}{2}$.

$$(d) \ \alpha = \lim \sup_{n\to\infin}\left( \sqrt[n]{\frac{n^3}{3^n}} = \frac{\sqrt[n]{n^3}}{\sqrt[n]{3^n}} = \frac{\sqrt[n]{n^3}}{3} \right) = \frac{1}{3}$$

So then $R = \frac{1}{\alpha} = 3$.

**3.10**

Suppose that the coefficients of the power series $\sum a_n z^n$ are integers infinitely many of which are distinct from zero.  Prove that the radius of convergence is at most one.

We have $\alpha = \lim \sup_{n\to\infin} \sqrt[n]{|a_n|}$. Consider then a non zero term  $|a_n|$, which must be greater than zero.  Since there are infinitely many distinct integers greater than zero then the $\lim \sup |a_n| \geq 1 \implies \sqrt[n]{|a_n|} \geq 1$. Since the radius is defined as $R = \frac{1}{\alpha}$ and $\alpha \geq 1$, Then $R \leq 1$.

**3.11**

Suppose $a_n > 0, s_n = a_1 + \cdots + a_n,$ and $\sum a_n$ diverges.

$(a)$ Prove that $\sum \frac{a_n}{1 + a_n}$ diverges.

$(b)$ Prove that

$$\frac{a_{N + 1}}{s_{N + 1}} + \cdots + \frac{a_{N + k}}{s_{N + k}} \geq 1 - \frac{s_N}{s_{N + k}}$$

and deduce that $\sum \frac{a_n}{s_n}$ diverges.

$(c)$ Prove that

$$\frac{a_n}{s^2_n} \leq \frac{1}{s_{n - 1}} - \frac{1}{s_n}$$

and deduce that $\sum \dfrac{a_n}{s^2_n}$ converges.

$(d)$ What can be said about $$\sum \dfrac{a_n}{1 + na_n} \quad \text{and} \quad \sum \dfrac{a_n}{1 + n^2a_n} \ ?$$

$(a)$

Assume $\sum \frac{a_n}{ 1+ a_n}$ converges


Since $\sum a_n$ diverges then ${a_n}$ must be a unbounded sequence and the lim of
$$\frac{a_n}{1+a_n} = \frac{1}{1  + \frac{1}{a_n}} = 1$$

This is a contradiction then since for any convergent series $\sum b_n$ the $\lim_{n \to \infin}b_n = 0$

$(b)$

Consider that for any $N$ and any $k \geq 1$

$$\frac{s_{N +k}}{s_{N + k}} = \frac{a_{N + k} }{s_{N + k}} + \frac{s_{N + k - 1}}{s_{N + k}} = 1 \implies \frac{a_{N + k}}{s_{N + k}} = 1 - \frac{s_{N + k -1}}{s_{N + k}} =$$

$$1- \left(\frac{s_N}{s_{N + k}} + \frac{a_{N + 1}}{s_{N + k}} + \cdots + \frac{a_{N + k - 1}}{s_{N + k}}\right)= $$
$$\left(1 - \frac{s_N}{s_{N + k}}\right) -\left( \frac{a_{N + 1}}{s_{N + k}} + \cdots + \frac{a_{N + k - 1}}{s_{N + k}}\right)$$.

Therefore we conclude that

$$\frac{a_{N + k} }{s_{N + k}} = \left(1 - \frac{s_N}{s_{N + k}}\right) -\left( \frac{a_{N + 1}}{s_{N + k}} + \cdots + \frac{a_{N + k - 1}}{s_{N + k}}\right) \implies$$

$$\frac{a_{N + k} }{s_{N + k}} \geq \left(1 - \frac{s_N}{s_{N + k}}\right)$$

Now consider that

$$\lim_{k\to \infin}\left(\frac{a_{N + 1}}{s_{N + 1}} + \cdots + \frac{a_{N + k}}{s_{N + k}}\right) \geq \lim_{k\to \infin}\left(1 - \frac{s_N}{s_{N + k}}\right) = 1 - s_N \lim \frac{1}{s_{N + k}} =1$$

Assume $\sum \dfrac{a_n}{s_n}$ converges.  Then by theorem 3.22 there exists some integer $N$ such that

$$\dfrac{a_{N + 1}}{s_{N + 1}} + \cdots + \dfrac{a_m}{s_n} \leq 0.2$$

if $m \geq N + 1$, but this is impossible since we showed that for any fixed $N$ as $m \to \infin$ as per the inequaltiy.  So then the series diverges.

($c$)

$$\frac{1}{s_{n - 1}} - \frac{1}{s_n} = \frac{s_n}{s_ns_{n-1}} - \frac{s_{n - 1}}{s_ns_{n-1}} = \frac{a_n}{s_ns_{n-1}}$$

And since $s_n > s_{n-1}$ we conclude that

$$\frac{a_n}{s_n^2} \leq \frac{a_n}{s_ns_{n-1}} = \frac{1}{s_{n - 1}} - \frac{1}{s_n}$$

Consider then $\sum \dfrac{1}{s_{n - 1}} - \dfrac{1}{s_n}$. If we can prove that this serires converges then $\frac{a_n}{s_n^2}$ must converge.  The partial sums of $\sum \dfrac{1}{s_{n - 1}} - \dfrac{1}{s_n}$ telescope. $\dfrac{1}{s_{n - 1}} - \dfrac{1}{s_n} + \dfrac{1}{s_n} - \dfrac{1}{s_{n + 1}} + \dfrac{1}{s_{n + 1}} - \dfrac{1}{s_{n + 2}} = \dfrac{1}{s_{n - 1}} - \dfrac{1}{s_{n + 2}}$. Since $s_n$ si unbounded we then know this sum converges.  And again since every term of $\dfrac{a_n}{s_n^2} \leq$ to this sum, we conclude $\dfrac{a_n}{s_n^2}$ converges.

$(d)$

$\sum \dfrac{a_n}{1 + na_n}$ diverges and $\sum \dfrac{a_n}{1+n^2a_n}$ converges.  By comparison with $\sum \dfrac{1}{n}$ and $\sum \dfrac{1}{n^2}$ respectively.

**3.12**

Suppose $a_n > 0$ and $\sum a_n$ converges. Put

$$r_n = \sum^{\infin}_{m=n} a_m.$$

$(a)$ Prove that

$$\frac{a_m}{r_m} + \cdots + \frac{a_n}{a_n} > 1 - \frac{r_n}{r_m}$$

if $m < n$, and deduce that $\sum \dfrac{a_n}{r_n}$ diverges.

$(b)$ Prove that

$$\frac{a_n}{\sqrt{r_n}} < 2(\sqrt{r_n} - \sqrt{r_{n - 1}})$$

and deduce that $\sum\dfrac{a_n}{\sqrt{r_n}}$ converges.

$(a)$

We note that

$$\frac{a_m}{r_m} + \cdots \frac{a_n}{r_n} > \frac{a_m}{r_m} + \cdots + \frac{a_n}{r_m}$$

And so

$$\left(\frac{a_m}{r_m} + \cdots + \frac{a_n}{r_m} \right)+ \frac{r_n}{r_m} = \frac{r_m + a_n}{r_m} > 1$$

In summary

$$\left(\frac{a_m}{r_m} + \cdots \frac{a_n}{r_n}\right)+ \frac{r_n}{r_m}  >\frac{r_m + a_n}{r_m} > 1 \implies \frac{a_m}{r_m} + \cdots + \frac{a_n}{a_n} > 1 - \frac{r_n}{r_m}$$

For some fixed $N$ $\lim_{k \to \infin} 1 - \dfrac{r_{k + N}}{r_k} \to 1$. Since the sequence formed from $\sum \dfrac{a_n}{r_n}$ is greater than every element of this limit, and the limit approaches $\infin$, we know that  $\sum \dfrac{a_n}{r_n}$ diverges, since the limit of terms of a converging sum must approach zero.

($b$)


$$\sqrt{r_n} - \sqrt{r_{n + 1}} = \frac{(\sqrt{r_n} - \sqrt{r_{n+1}})(\sqrt{r_n} + \sqrt{r_{n+1}}) }{(\sqrt{r_n} + \sqrt{r_{n+1}})} = \frac{r_n -r_{ n + 1}}{(\sqrt{r_n} + \sqrt{r_{n+1}})} > \frac{a_n}{2\sqrt{r_n}}$$

The series $\sum \sqrt{r_n}$ converges, and since  for every term of $\sum \dfrac{a_n}{\sqrt{r_n}}$, that term is less than the cauchy convergence for any $N$ of $\sum \sqrt{r_n}$, $\sum \dfrac{a_n}{\sqrt{r_n}}$ must converge. For any epsilon given we may take $\epsilon/2$ to find the $N$ of $\sum \sqrt{r_n}$, for which we may show that $m \geq N \dfrac{a_m}{\sqrt{r_m}}$ has cauchy convergence.

**3.13**

Prove that the Cauchy product of two absolutely convergent series converges absolutely.

Put

$$A_n = \sum^{n}_{k=0} a_k, \ \ B_n = \sum_{k=0}^{n} b_k, \ \ C_n = \sum^{n}_{k=0} a_kb_{n-k},  \ \ \hat{B} = \sum_{k=0}^{n} |b_k|$$

Then

$$C_n = a_0b_0 + (a_0b_1 + a_1b_0) + \cdots + (a_0b_n + a_1b_{n-1} + \cdots a_nb_0) \\ =a_0B_n + a_1B_{n-1} + \cdots + a_nB_0$$

Consider then

<!-- $$|C_n| = |A_nB + a_0\beta_n + a_1\beta_{n - 1} + \cdots + a_n\beta_0| \\
\leq |A_nB| + |a_0\beta_n| + |a_1\beta_{n-1}| + \cdots + |a_n\beta_0|$$ -->

<!-- Because an absolute series is at least equal to or greater than any term -->

$$|a_0B_n + a_1B_{n-1} + \cdots + a_nB_0| \leq |a_0\hat{B}| + |a_1\hat{B}| + \cdots + |a_n\hat{B}|$$

$$ = |\hat{B}|(|a_0| + |a_1| + \cdots + |a_n| )$$

Since $\sum^{n}_{k=0} |a_k|$ converges and $\hat{B}$ is a real number, we conclude that the cauchy produce of $A$ and $B$ converges absolutely, since its partials sums are less than that of a series that we know converges.

**3.14**

If $\{s_n\}$ is a complex squence, define its arithmetic means $\sigma_n$ by

$$\sigma_n = \frac{s_0 + s_1 + \cdots + s_n}{n+1} \ \ \ \ \ \  (n = 0, 1, 2, ...).$$

$(a)$ If lim $s_n = s$, prove that lim $\sigma_n = s$.

$(b)$ Construct a sequence $\{s_n\}$ which does not converge, although  $\lim \sigma_n = 0$.


$(a)$

Given $\epsilon > 0$,

Let $N_0$ be the index of $\{ s_n \}$ with $\epsilon$,

Let $z = \sum^{N_0}_{i=0} s_i$


Choose $N_1 = \left\lceil\left |\dfrac{z}{\epsilon} \right|\right\rceil + N_0$

Consider then $\sigma_{N_1}$

$$\frac{s_0 + s_1 + \cdots + s_{N_1}}{N_1 + 1} =\frac{z}{N_1 + 1} + \dfrac{s_{N_0 + 1} + \cdots s_{N_0 + N_1}}{N_1 + 1}$$

So then

$$ \left |\frac{z}{N_1 + 1} - s \right | < \epsilon$$

And

$$\left |\dfrac{s_{N_0 + 1} + \cdots s_{N_0 + N_1}}{N_1 + 1} - s \right | < \epsilon$$

This means that $\sigma_n  < 2\epsilon$, we may simply choose $\epsilon / 2$ for $N_1$ and $\{s_n\}$.

$(b)$ Consider the sequence $s = \{ 0, 1, 0, 1, 0, 1, \cdots\}$. This sequence does not converge.


Given $\epsilon > 0$

Let $N = \left \lceil \dfrac{1}{\epsilon} \right \rceil$

So then we have

$$\sigma_N = \frac{0 + 1 + 0 + \cdots}{N + 1} =\frac{ \left \lfloor \frac{N }{2} \right \rfloor} {N+1}$$

Lemma

$$\forall \ n, \ \frac{ \left \lfloor \frac{n}{2} \right \rfloor} {n+1} \leq \frac{\frac{n}{2}}{n + 1} = \frac{n}{2(n + 1)} < \frac{1}{2}$$

Then consider for any $N \leq N_0$

$$\left | \frac{ \left \lfloor \frac{N_0}{2} \right \rfloor}{N_0 + 1} - \frac{1}{2}\right | \leq \left | \frac{N_0}{2(N_0 + 1)  } - \frac{1}{2}\right | = \left | \frac{N_0 - (N_0 + 1)}{2(N_0 + 1)  } \right | = \left | \frac{-1}{2(N_0 + 1)  } \right | \leq \left | \frac{-1}{\frac{2}{\epsilon} + 2  } \right | = \left | \frac{-\epsilon}{2(1+\epsilon)} \right | \leq \epsilon$$
