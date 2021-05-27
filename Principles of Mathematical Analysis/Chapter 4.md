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








<!-- For every $\epsilon > 0$,

∀ ϵ > 0, ∃ ϱ > 0 ⮕∀ x, | x  - x₀  | < ϱ ⮕ | f(x) - f(x₀)| < ϵ

There exists a $\delta > 0 \implies |(x + h - x - h) - (x - x)| < \delta \implies |f(x + h) - f(x - h)| < \epsilon$
 -->

<!-- (∀ ε > 0, ∃ δ > 0, ∀ x, |x - x₀| ≤ δ →  |f x - f x₀| ≤ ε) ↔
(∃ ε > 0, ∀ δ > 0, ∃ x, |x - x₀| ≤ δ ∧ |f x - f x₀| > ε ) -->

