(1.)

Suppose that $f$ is a real function defined on $\R^1$ which satisfies

$$\lim_{h \to 0} [f(x + h) - f (x-h)] = 0$$

for every $x \in \R^1$. Doe this imply that $f$ is continuous.

Notice that the definition of limit points does not require the limit point (in this case 0 for $h\to 0$) to be defined by our function, whereas a continous function does!  Consider the function $g = |x|$ except it is undefined at $0$.  The above limit holds (use $\delta = \epsilon/2$, all x limits are defined as $0 < d(x, 0) < \delta$ implies $x \neq 0$) but $g$ is not continuous when $x = 0$.

(3.) Let $f$ be a continous real function on a metric space $X$. Let $Z(f)$ (the zero set of $f$) be the set of all $p \in X$ at which $f(p) = 0$. Prove that $Z(f)$ is closed.

The set of \{ $0$ \} is closed, since it has no limit points.  Using the collary from 4.8

"A mapping $f$ of a metric space $X$ into a metric space $Y$ is continous if and only if $f^{-1}(C)$ is closed in X for every closed set C in Y"

Since $f$ is continous we may pass in the closed of { 0 } as $C$ into the second hand statement.

Therefore we have the fact $f^{-1}(\{ 0 \})$ is closed in X.  This is definitionally the same as $Z(f)$ and we are done.

(4.) In order to prove that $f(E)$ is dense in $f(X)$ we must prove that every point in $f(X)$ is either a point in $f(E)$ or a limit point of $f(E)$.  Consder then for all $p_x \in X$, since $E$ is dense in $X$ then $p_x$ is either a limit point of $E$ or a point in $E$.  If $p_x$ is a point in $E$ we are done, since $f(p_x)$ wil be in $f(E)$.  We then focus on the case where $p_x$ is a limit point of $E$ but not in $E$.

We will acomplish this by showing that $f(p_x)$ is a limit point of $f(E)$. Given a radius $r > 0$ for a neighbourhood we obtain $\delta$ from continiuity with $r$, and obtain a point $p_e \in E, d(p_x, p_e) < \delta$ by $p_x$ being a limit point of $E$. By continiuty this implies that $d(f(p_x), f(p_y)) < r$. And we are done.


Part 2


<!-- Facts.


1. The first lemma may be applied to both $g$ and $f$. So $f(E)$ and $g(E)$ are dense in $f(X)$ and $g(X)$ respectively. -->


Given a point $p_x \in X$, we must show that if $p_x \notin E$ that $f(p_x) = g (p_x)$.

Proof by Contradiction, suppose $f(p_x) \neq g (p_x)$, then $l = d(f(p_x), g(p_x)) > 0$.

Extract $\delta_1 > 0$ with $\epsilon = l/4$ for $f$.

Extract $\delta_2 > 0$ with $\epsilon = l/4$ for $g$.

Since $p_x$ is a limit point produce $p_e \in E$ with $\min(\delta_1, \delta_2) > 0$ such that $d(p_e, p_x) < \min(\delta_1, \delta_2).$

Therefore by continuity of $f$ and $g$ we have,

$d(f(p_x), f(p_e)) < l/4$

$d(g(p_x), g(p_e)) < l/4$

Since $p_e \in E$ by the assumption given $f(p_e) = g(p_e)$ and we may apply the cauchy criterion.

$$d(f(p_x), g(p_x)) \leq d(g(p_x), g(p_e)) + d(f(p_x), f(p_e)) < l/2$$

This is a contradiction since no number $l > 0 < l / 2.$

In other words for any positive length between $f(p_x)$ and $g(p_x)$, we may show that length must be smaller.


**14**

Let $I = [0,1]$ be the closed unit interval. Suppose $f$ is a continuous mapping of $I$ into $I$. Prove that $f(x) = x$ for at least on $x \in I$.

<br/>

Proof by contradiction,

Suppose $\forall \ x, f(x) \neq x$ which implies $\forall \ x, d(f(x), x) > 0$.

$I$ is a connected set and therefore $f(I)$ must be connected as well, by theorem 4.22.


We show a contradiction by proving that $f(I)$ must be seperated.


Consider the sets $A = \{ f(x) \ | \ f(x) > x\}$ and $B = \{ f(x) \ | \ f(x) < x\}$.

$A \cup B = f(I)$, since $\forall \ x, f(x) \neq x$.

However consider $\overline{A} \cap B$ and $A \cap \overline{B}$.

Using a Symmetric argument for both, both sets must be $\empty$. Since the closure term cannot include any points $f(x) \ >(or <) \ x$. Since these are not limit points of $A$ and $B$ respectively.

Thus $f(I)$ is both seperated and connected which is a contradiction.

The intuition for this comes from considering the empty diaganol on the graph of $(x, f(x))$, and this proof applies to any connected function that maps into itself.



**8.**

Suppose $X$ is non empty nor a single element.

Take the $\inf i$ and the $\sup s$ of $X$.

Using $\epsilon = \frac{1}{2}$ Get $\delta > 0$ such that  $\forall \ x_1 \ x_2 \in X, \ d(x_1, x_2) \implies d(f(x_1), \ f(x_2)) < \epsilon$


Let $N = \lceil (s - i)/\delta \rceil$

Consider the sequence of sets $S_n = \{ x \in X \ | \ i + \delta (n - 1) \leq x \leq i + \delta n \}$

$X = \cup \ S_N$ (index starting at 1 and going to N).

The image of every $S_n$ under $f$ is bounded by $\epsilon$ because of uniform continuity.

So then $f(S_n)$ is a bounded set for every element of $S_N$.  The fininte union of bounded sets is bounded.


**11.**

Suppose $f$ is a uniformly continous mapping of a metric space $X$ into a metic space $Y$ and prove that $\{f(x_n)\}$ is a cauchy sequence in $Y$ for every Cauchy sequence $\{x_n\}$ in $X$.  Use this result to give an alternative proof for the theorem stated in Exercise 13.


**Lemma**

Given $\epsilon > 0$

Extract $\delta > 0, \forall \ x_1, x_2, \ 0 \leq d(x_1, x_2) \leq \delta \implies d(f(x_1), f(x_2)) < \epsilon$ with $\epsilon$ using uniform continuity


Extract $N$ such that $n \geq N \land m \geq M \implies d(x_n, x_m) < \delta$ with $\delta$ using the def of cauchy sequences.

Now choose $N$, so that use the second statement to meet the condition of the first statement and receive $d(f(x_n), f(x_m)) < \epsilon$.

**Main Proof**

<!-- $E \subset X$

Every point of $X$ is in $E$ or a limit point of $E$

Let $f$ be a uniformly continous *real* function defined on $E$.]

Prove that $f$ has a continous extension from $E$ to $X$ (see Exercise 5 for terminology).

We focus on all the point in $X$ that are limit points of $E$ but not points of $E$.

Given $\epsilon > 0$

Extract $\delta > 0, \forall \ x_1, x_2, \ 0 \leq d(x_1, x_2) \leq \delta \implies d(f(x_1), f(x_2)) < \epsilon$ for $E$. -->


**12.**

Given three metric spaces $X Y Z$ and a set $E \in X$ if $f$ is uniformly continous for $E$ on $X \to Y$ and $g$ is uniformy continous for $f(E)$ on $Y \to Z$, then the composition of $g(f(E))$ is uniformly continous for $E$ on $X \to Z$.

Given $\epsilon > 0$

Extract $\delta_1$ from $g$ with $\epsilon$
Extract $\delta_2$ from $f$ with $\delta_1$

We then choose $\delta_2$,

So if any two points in $E$ are less than $\delta_2$ then the distance between $d(f(x_1), f(x_2))$ must be less than $\delta_1$ which in turn implies the distance between $d(g(f(x_1)), g(f(x_2)))$ is less than $\epsilon$.