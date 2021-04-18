(1.)

Suppose that $f$ is a real function defined on $\R^1$ which satisfies

$$\lim_{h \to 0} [f(x + h) - f (x-h)] = 0$$

for every $x \in \R^1$. Doe this imply that $f$ is continuous.

Notice that the definition of limit points does not require the limit point (in this case 0 for $h\to 0$) to be defined by our function, whereas a continous function does!  Consider the function $g = |x|$ except it is undefined at $0$.  The above limit holds (use $\delta = \epsilon/2$, all x limits are defined as $0 < d(x, 0) < \delta$ implies $x \neq 0$) but $g$ is not continuous when $x = 0$.

<!-- For every $\epsilon > 0$,

There exists a $\delta > 0 \implies |(x + h - x - h) - (x - x)| < \delta \implies |f(x + h) - f(x - h)| < \epsilon$
 -->

<!-- (∀ ε > 0, ∃ δ > 0, ∀ x, |x - x₀| ≤ δ →  |f x - f x₀| ≤ ε) ↔
(∃ ε > 0, ∀ δ > 0, ∃ x, |x - x₀| ≤ δ ∧ |f x - f x₀| > ε ) -->