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

$(c)$ Can it happen that $s_n > 0$ for all $n$ and that $\lim \sup s_n = \infin$, although $\sigma_n = 0$?


$(d)$ Put $a_n = s_n - s_{n - 1}$, for $n \geq  1$. Show that

$$s_n - \sigma_n = \dfrac{1}{n + 1}\sum^{n}_{k = 1} ka_k.$$

Assume that $\lim (na_n = 0)$ and that $\{ \sigma \}$ converges. Prove that $\{s_n\}$ converges. [This gives a converse of $(a)$, but under the weaker assumption that $na_n \to 0.$]

$(e)$ Derive the last conclusion from a weaker hypothesis: Assume $M < \infin.$ $|na_n| \leq M$ for all $n,$ and $\lim \sigma_n = \sigma.$ Prove that $s_n = \sigma,$ by completing the following outline:

If $m < n$ then

$$s_n - \sigma_n = \dfrac{m+1}{n-m}(\sigma_n - \sigma_m) + \dfrac{1}{n-m} \sum^n_{i=m+1} (s_n - s_i).$$

For these $i$,

$$|s_n - s_i| \leq \dfrac{(n-i)M}{i + 1} \leq \dfrac{(n-m-1)M}{m + 2}.$$

Fix $\epsilon > 0$ and associate eith each $n$ the integer $m$ that satisfies

$$m \leq \dfrac{n - \epsilon}{1 + \epsilon} < m + 1.$$

Then $(m+1)/(n-m)\leq 1/\epsilon$ and $|s_n - s_i| < M\epsilon$. Hence

$$\lim_{n \to \infin} \sup |s_n - \sigma| \leq M \epsilon.$$

Since $\epsilon$ was arbitrary, $\lim s_n = \sigma$.


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

<!-- Comment to fix compiling?? -->

($c$) Yes.


Consider the following sequence $\{s_n\}$, composed of the following consecutive blocks of numbers
$$s_n =\{$$

$$\dfrac{1}{10}, 1$$

$$\dfrac{1}{10^2}, \dfrac{1}{10^3}, 2$$

$$\dfrac{1}{10^4}, \dfrac{1}{10^5}, \dfrac{1}{10^6}, \dfrac{1}{10^7}, 3$$

$$\dfrac{1}{10^8}, \dfrac{1}{10^9}, \dfrac{1}{10^{10}},  \dfrac{1}{10^{11}}, \dfrac{1}{10^{12}}, \dfrac{1}{10^{13}}, \dfrac{1}{10^{14}}, \dfrac{1}{10^{15}}, 4,$$

$$\cdots \}$$


and so on.

The motivations for this construction are the following,
* ${s_n}$ is unbounded
* The following lemma

**Lemma**

For every whole number term with index $n$ in a block the partial sum of $\sigma_n$ is less than the partial sum of the previous whole number term(if it exists).

Proof by induction

Base Case compute: $\sigma_5 = \dfrac{\dfrac{1}{10} + 1 +\dfrac{1}{10^2} + \dfrac{1}{10^3} + 2}{6} < \sigma_2 = \dfrac{\dfrac{1}{10} + 1 }{3}$




Given a block with $2^{\alpha - 1} + 1$ terms the next block has $2^{\alpha} + 1$ terms (the +1 being the whole number).

Let $\alpha$ be the whole number for the first block.

Let $i$ be the index of $s_i = \alpha$

Let $t$ the number of terms before the first block.
  We then have

$$ \sigma_i =\dfrac{\alpha}{t +2^{\alpha - 1} + 1} <  \dfrac{(\alpha + 1)}{t + 2^{\alpha - 1} + 2^{\alpha} + 2} = \sigma_{i + 2^a + 1}$$

Since $(\dfrac{1}{\alpha} + 1) \leq 2^\alpha$ for natural numbers always holds.

Since every non whole number term is smaller than every other term that has appeared thus far this suffices to show **blocks** "monotonically decrease".


Now for the proof of convergence to $0$

For $\sigma_n$, fix $\epsilon > 0$,

There exists a number $N$ such that the partial sum of a whole number term of $\sigma_N  < \epsilon$

Since the sequence $$\dfrac{(n + 1)}{2^{n}} \to 0$$

The subsequence of whole numbers of $s_n$ is less than every term $$\dfrac{(n + 1)}{2^{n}}$$

so we may always find this $N$.

$$N_0 \geq N \implies \sigma_{N_0} < \epsilon$$

Holds since since every non-whole number term is smaller than every other term so far in the sequence and the lemma proved above handles the whole number case.

$(d)$


$$s_n - \sigma_n = s_n - \dfrac{s_0 + \sum^n_{k=1} s_k}{n +1} = \dfrac{s_n(n+1)}{n+1} - \dfrac{s_0 + \sum^n_{k=1} s_k}{n+1}$$

$$\dfrac{s_n(n + 1) - s_0 - \sum^n_{k=1} s_k}{n + 1} = \dfrac{1}{n+1} \left (s_n(n + 1)  - s_0 - \sum^n_{k=1} s_k \right )$$


For all $k$
$$ka_n + (k + 1)a_{n + 1} = ks_n - ks_{n - 1} + (k + 1)s_{n + 1} - (k + 1)s_{n}  =  - ks_{n - 1} -s_n + (k + 1)s_{n + 1}$$

When inducted on a sum

$$\sum^n_{k=1}a_k = s_n(n + 1) - s_0 - \sum^n_{k=1}s_k$$

As each succesive term reduces a previous term by $ks_k - (k + 1)s_k = -s_k$, with start and end tails of $-s_0$ and $ns_n$.


So then

$$s_n - \sigma_n = \dfrac{1}{n + 1}\sum^{n}_{k = 1} ka_k.$$


Applying $(a),$ $s_n - \sigma_n$ must converge to $0$

We know that $s_n - \sigma_n$ converges and $\sigma_n$ converges so therefore $s_n$ converges.


<!-- Surrender online solutions had different equalities  -->
$(e)$


If $m < n$ then

<!-- $$s_n - \sigma_n =\dfrac{s_n(n + 1) - s_0 - \sum^n_{k=1} s_k}{n +1} = \dfrac{\dfrac{n-m}{n+1}}{\dfrac{n-m}{n+1}} \dfrac{s_n(n + 1) - s_0 - \sum^n_{k=1} s_k}{n +1}=$$

$$\dfrac{(n-m)s_n - \dfrac{n-m}{n+1}s_0 - \dfrac{n-m}{n+1}\sum^n_{k=1} s_k}{n-m} =\dfrac{(n-m)s_n - \dfrac{n-m}{n+1}s_0 - \dfrac{n-m}{n+1}(\sum^n_{k=m+1} s_k + \sum^{m+1}_{k=1} s_k)}{n-m}=$$

$$\dfrac{(n-m)s_n - \dfrac{n-m}{n+1}\sum^n_{k=m+1} - \dfrac{n-m}{n+1}s_0 - \dfrac{n-m}{n+1}\sum^{m+1}_{k=1} s_k}{n-m}$$ -->


$$\dfrac{m+1}{n-m}(\sigma_n - \sigma_m) + \dfrac{1}{n-m} \sum^n_{i=m+1} (s_n - s_i) = \dfrac{(m+1)(\sigma_n - \sigma_m) + \sum^n_{i=m+1}s_n - s_i}{n-m}=$$

$$\dfrac{(m+1)\left (\dfrac{[s_0 + \cdots + s_n]}{n+1} - \dfrac{[s_0 + \cdots + s_m]}{m + 1}\right ) + \sum^n_{i=m+1}s_n - s_i}{n-m} =$$

$$\dfrac{\dfrac{(m+1)}{n+1}[s_0 + \cdots + s_n] - [s_0 + \cdots + s_m] + (n - m)s_n - [s_{m+1} + \cdots + s_n]}{n-m}=$$

$$\dfrac{\dfrac{(m+1)}{n+1}[s_0 + \cdots + s_n] - [s_0 + \cdots + s_n] + (n - m)s_n}{n-m}=$$

$$\dfrac{\dfrac{(m+1)}{n+1}[s_0 + \cdots + s_n] - \dfrac{(n + 1)[s_0 + \cdots + s_n]}{n + 1} + (n - m)s_n}{n-m}=$$

$$\dfrac{\dfrac{[s_0 + \cdots + s_n](m + 1 - n - 1)}{n+1} + (n - m)s_n}{n-m}=$$

$$\dfrac{\dfrac{[s_0 + \cdots + s_n](m - n)}{n+1} + (n - m)s_n}{n-m}=$$

$$\dfrac{\dfrac{[s_0 + \cdots + s_n](m - n)}{n+1}}{n-m} + s_n=$$

$$s_n - \sigma_n$$

<!-- $$\dfrac{\dfrac{n + 1}{n - m}}{\dfrac{n + 1}{n - m}} \dfrac{\dfrac{(m+1)}{n+1}\dfrac{[s_0 + \cdots + s_n]}{n+1} - [s_0 + \cdots + s_n] + (n - m)s_n}{n-m}=$$

$$\dfrac{\dfrac{(m+1)}{n-m}\dfrac{[s_0 + \cdots + s_n]}{n+1} - \dfrac{n + 1}{n - m}[s_0 + \cdots + s_n] + (n + 1)s_n}{n + 1}=$$ -->


**3.15**

Definition 3.21 can be extended to the case in which the $a_n$ lie in some fixed $R^k$. Absolute convergence is defined as convergence of $\sum|\bold{a}_n|$. Show that Theorems 3.22, 3.23, 3.25(a), 3.33, 3.34, 3.42, 3.45, 3.47 and 3.55 are true in this more general setting. (Only slight modifications are required in any of the proofs.)

(3.22)

Left, Suppose $\sum \bold{a}_n$ converges, this means each individual component $i$ of $\bold{a} = (a_1, \cdots, a_k)$ converges.  Since the sum of every component converges then the cauchy criteron holds.  We may then use $\dfrac{\epsilon}{k}$, since $\sum_n^m|{a_1}| + \cdots + \sum_n^m|{a_k}| \leq \epsilon k$. In other words we use 3.22 for every componet of $\sum \bold{a}_n$ and divide $\epsilon$ by $k$.

Right, we may use the right direction of (3.22) to show that every component of $\sum_n^m\bold{a}_n$ must be a Cauchy sequnce, and since each component sequence of $\bold{a}$ is cauchy in $\R$, then every component sequence converges. Finally since every component sequence converges in $\bold{a}_n$, then $\sum \bold{a}_n$ converges.

(3.23)

If $\sum \bold{a}_n$ converges then $\lim_{n \to \infin} \bold{a} = \bold{0}$.

Apply (3.22) with $m=n$

(3.25)(a)

If $|\bold{a_n}| \leq \bold{c}_n$ for $n \geq N_0$, where $N_0$ is some fixed integer, and if $\sum \bold{c}_n$ converges then the sum of $\sum \bold{a}_n$ converges.

Given an $\epsilon > 0$, get $N_1$ from cauchy of $\sum \bold{c}_n$ with $\epsilon / 2$, use $M \geq N = \max \ N_0 \ N_1$. Then we have $|\bold{a}_N| \leq \bold{c}_N \land |\bold{a}_M| \leq \bold{c}_M$ and $|\bold{c}_N - \bold{c}_M| \leq \epsilon / 2$. We then use algebra to obtain

$$|\bold{a}_N - \bold{a}_M| = |\bold{a}_N - \bold{a}_M + ( \max \ \bold{c}_N \bold{c}_M - \max \ \bold{c}_N \bold{c}_M)| \leq $$

$$|\max \ \bold{c}_N \bold{c}_M - \bold{a}_M| + |\max \bold{c}_N \bold{c}_M - \bold{a}_N| \leq$$

$$|\max \bold{c}_N \bold{c}_M - \bold{c}_N| + |\max \bold{c}_N \bold{c}_M - \bold{c}_M| \leq \epsilon.$$.


In other words $\sum \bold{a}_n$ is cauchy and must converges.

(3.33)

Given $\sum \bold{a}_n$, put $\alpha = \lim \sup_{n \to \infin}$ $\sqrt[n]{|\bold{a}_n|}$.

*Then*

(a)  if $\alpha < 1, \sum \bold{a}_n$  converges

(b)  if $\alpha > 1, \sum \bold{a}_n$  diverges

(c)  if $\alpha = 1, \sum \bold{a}_n$, the test gives no information

If $\alpha < 1$ we choose $\beta$ so that $\alpha < \beta < 1$, and an integer $N$ such that

$$\sqrt[n]{|\bold{a}_n|} < \beta$$

for $n \geq N$ [by Theorem 3.17(b)]. That is, $n \geq N$ implies

$$|\bold{a}_n| < \beta^n.$$


Since $0 < \beta < 1$, $\sum \beta^n$ converges.  Convergence of $\sum \bold{a}_n$ follows since every component $\sum \bold{a}_n^{[k]}$ converges from the comparison test.  If the sum of every component converges, then $\sum \bold{a}$ converges.

If $\alpha > 1$ then again by Theorem 3.17, there is a
(a sub sequence converges to sup)
sequence $\{n_k\}$ such that

$$\sqrt[n_k]{|\bold{a}_{n_k}|} \to \alpha$$

Hence $|\bold{a}_n| > 1$ for infinitely many values of $n$, so that the condition $\bold{a_n} \to 0$

(3.34)

We define vector division as element wise.

Supposing that every vectors in $\bold{a}_n$ is nonzero or an $N$ such that no terms are zero.

The series $\sum \bold{a}_n$,

(a) converges if $\lim \sup_{n \to \infin} \left |\dfrac{\bold{a}_{n+1}}{\bold{a}_n}\right | < 1$

(b) diverges if $\left | \dfrac{\bold{a}_{n+1}}{\bold{a}_n} \right | \geq 1$ for all $n \geq n_0$, where $n_0$ is some fixed integer.

**Proof** If conditioin (a) holds, we can find $\beta < 1$, and an integer $N$, such that


$$\left |\dfrac{\bold{a}_{n+1}}{\bold{a}_n} \right |< \beta$$

for $n \geq N$. In particular,

$$\left |\dfrac{\bold{a}_{N + 1}}{\bold{a}_N}\right| < \beta$$

Since the length of $\bold{a}$ is $\geq$ to the $|a_i|$ and negative compnents do not effect length,

$$|\bold{a}_{N + 1}| < \beta|\bold{a}_N|$$

$$|\bold{a}_{N + 2}| < \beta|\bold{a}_{N + 1}| < \beta^2 |\bold{a}_N|$$

$$\cdots \cdots \cdots \cdots$$
$$|\bold{a}_{N + 1}| < \beta|\bold{a}_N|$$

That is,

$$|\bold{a}_n| < |\bold{a}_N|\beta^{-N} \cdot \beta^n$$

for $n \geq N$, and (a) follows from the comparison test, since $\sum \beta^n$ converges.

If $|\bold{a}_{n+1}| \geq |\bold{a}_n|$ for $n\geq n_0$, it is easily seen that at least one component
$a_i \nrightarrow 0$ of $\bold{a}$, and hence (b) follows.

(3.42)

Suppose


(a) the partial sums $\bold{A}_n$ of $\sum \bold{a}_n$ form a  bounded sequence;

(b) $b_0 \geq b_1 \geq b_2 \geq \cdots$;

(c) $\lim_{n \to \infin} b_n = 0.$

Then $\sum \bold{a}_n b_n$ converges

**Proof** Choose $M$ such that $|\bold{A_n}| \leq M$ for all $n$.  Given $\epsilon > 0$, there is an integer $N$ such that $b_N \leq (\epsilon/2M)$. For $N \leq p \leq q$, we have

$$\left | \sum^q_{n=p} \bold{a}_n b_n \right | =\left | \sum^{q-1}_{n=p}\bold{A}_n(b_n - b_{n + 1}) + \bold{A}_q b_q - \bold{A}_{p-1}b_p\right|$$

$$= \left | \sum^{q-1}_{n=p}\bold{A}_n(b_n - b_{n + 1}) + \bold{A}_q b_q - \bold{A}_{p-1}b_p\right|$$


$$\leq M \left | \sum^{q-1}_{n=p}(b_n - b_{n + 1}) + b_q + b_p\right |$$

$$2Mb_p \leq 2Mb_N \leq \epsilon$$

Convergence now follows from the Caucht criterion. We note that the first inequality in the abover chain depends of course on the fact that $b_n - b_{n + 1} \geq 0$.


20.

Suppose $\{p_n\}$ is a Cauchy sequence in a metric space $X$, and some subsequence $\{p_{n_i}\}$ converges to a point $p \in X.$  Prove that the full sequence $\{p_n\}$ converges to $p$.

Given $\epsilon > 0$ choose $N$ from $\{p_{n_i}\}$ with $\epsilon/2$. So then for $n \geq N$ $|p_N - p| \leq \epsilon/2$ and $|p_N - p_n| \leq \epsilon/2$.  So then we have $|p_N - p_n|  + |p_N - p| \leq |p_N - p_n - p_N + p | = |p - p_n| = |p_n - p| \leq \epsilon$.

23 Suppose $\{p_n\}$ and $\{ q_n\}$ are Cauchy sequences in a metric space $X$. Show that the sequence $\{d(p_n, q_n)\}$ converges.

Given $ε > 0$, use $ε/2$ with $\{ p_n\}$ and $\{ q_n\}$ to produce $N_1$ and $N_2$.  Choosing $N_0 = \max N_1 N_2$ we then have $n ≥ N_0$ $d(q_{N_0}, q_{n}) ≤ ε/2$ and $d(p_{N_0}, p_n) ≤ ε/2$.

Fact

$$d(p_n, q_n) \leq d(p_n, p_{N_0}) + d(q_n, p_{N_0}) ≤ $$

$$d(p_n, p_{N_0}) + d(p_{N_0}, q_{N_0}) + d(q_n, q_{N_0}) →$$

$$d(p_n, q_n) -  d(p_{N_0}, q_{N_0}) ≤ d(p_n, p_{N_0}) + d(q_n, q_{N_0})$$

The same is true, by the same proccess


$$d(p_{N_0}, q_{N_0})  - d(p_n, q_n) ≤ d(p_n, p_{N_0}) + d(q_n, q_{N_0})$$



Final Result

$$|d(p_{N_0}, q_{N_0}) - d(p_n, q_n) | ≤$$
$$ |d(p_n, p_{N_0}) + d(q_n, q_{N_0})| =$$

Since both
$d(p_{N_0}, q_{N_0})  - d(p_n, q_n) ≤ d(p_n, p_{N_0}) + d(q_n, q_{N_0})$ and $d(p_n, q_n) -  d(p_{N_0}, q_{N_0}) ≤ d(p_n, p_{N_0}) + d(q_n, q_{N_0})$ h.old

$$|d(p_n, p_{N_0}) + d(q_n, q_{N_0})| = d(p_n, p_{N_0}) + d(q_n, q_{N_0}) ≤ ε$$


So then $\{d(p_n, q_n)\}$  is Cauchy, and since the distance function is in $\mathbb{R}$ $\{d(p_n, q_n)\}$  converges.