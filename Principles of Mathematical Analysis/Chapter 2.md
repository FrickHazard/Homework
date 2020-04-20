**1.**

Prove that the empty set is a subset of every set.

Consider the propositional definition of a subset $B$ of $A$, $\forall b \in B, b \in A$. This implies that $\emptyset \subset A$ entails $\forall b \in \emptyset, b \in A$.  And since there are no elements in $\emptyset$ this condition is always true.

**2.**

A complex number $z$ is *algebraic* if there are integers $a_0, ..., a_n$, not all zero, such that

$$a_0z^n + a_1z^{n -1} + ... + a_{n-1}z + a_n = 0.$$
Prove that the set of all algebraic numbers is countable.  *Hint*: For every positive integer $N$ there are only finite many equations with 

$$n + |a_0| + |a_1| + ... + |a_n| = N.$$

We know that the countable union of countable sets must be countable.  This leaves us to prove that every indiviual polynomial of $n$ is countable, since the polynomials themselves are constructed from a countable set $a$.

We use the hint provided and realize that for any particular set of integer coefficents, there
is a finite set of complex numbers that can satisfy the equation($n$ degree roots).  Since there
are only finitely numbered complex numbers that satisfy a particular polynomial with certain
coefficents, the solutions to any particular polynomial must be countable.  And again since the
union of countable sets must be countable, the set of all solutions must be countable.

**3.**

Prove that there exists real numbers which are not algebraic.

We know that the real numbers are uncountable.  And by the previous proof we know that there are countably many algebraic numbers(there are always less real roots to an equation than complex). Therefore since the real numbers are uncountable and the real algebraic numbers are countable, we may use a diagnolization argument to construct a real number that is not algebraic.

**4.**

Is the set of all irrational real numbers countable?

No, Proof (by contradiction)\
Suppose that all the irrational real numbers were countable.  Since every real number is either
rational or irrational, and we know that the rational numbers are countable, it follows by the
union of countable sets theorem, that the real numbers must be countable.  By Cantor's diagonal argument we know that this cannot be true.  So therefore, because every real number is either rational or irrational, and rational numbers are countable, the irrational numbers must be uncountable.

**5.**

Construct a bounded set of real nunbers with exactly three limit points.

First we consider how to construct a bounded set of real numbers with one limit point.  The concept of convergence is relevant here.  We know that the set of $\{ x : 1/n, n : N\}$ contains points arbitrarily close to $0$.  Further more any other point cannot be a limit point. Consider a real number $1/n$ in the set, there is a neighborhood between $1/n$ and $1/n+1$ which contains no points in the set, this is given by $d = \frac{2n+1}{2n(n+1)} - \frac{1}{n}$(This is derived from taking the average of $n$ and $n + 1$). We then duplicate this set with an offset to meet the proper criteria.  Consider the union of three sets $\{ x : 1/n, n : N\}$ $\{ x : (1/n + 2), n : N\}$ and $\{ x : (1/n + 4), n : N\}$.  They only limit points in the set are $\{0, 2, 4\}$.

**6.**

Let $E'$ be the set of all limit points of a set $E$.  Prove that $E'$ is closed. Prove that $E$ and $\overline{E}$ have the same limit points. (Recall that $\overline{E} =E \cup E'$.) Do $E$ and $E'$ always have the same limit points?

* Consider any limit point $e'$ of $E'$. Every neighboorhood of $e'$ has a point in $E'$. Since every point of $E'$ is a limit point of $E$, for any neighborhood of $e'$ we can find a point in $E$(note below).  Therefore $e'$ is a limit point of $E$ and therefore is a point in $E'$ and thus $E'$ is closed.
* Consider any limit point $\overline{e}$ of $\overline{E}$.  Every neighborhood of $\overline{e}$ contains a point either in $E$, $E'$ or both.  If that point is in $E'$ there must also be a point in $E$(see hint again).  So every neighborhood of any limit point $\overline{e}$ must contain a point from $E$, and thus is a limit point of $E$. Proving now the other direction, that every limit point of $E$ is a limit point in $\overline{E}$ is straightforward since the union of any set of points has all the limit points of its children.
* No. Every limit point of $E'$ is a limit point of $E$, but not every limit point of $E$ is a limit point of $E'$!
* Note: This can be shown by considering a neighbor of $e'$ with radius $r_1$. Since $e'$ is a limit point of $E'$ there must be a point $p_1$ with a distance $d$ less than $r_1$ to $e'$.  Since $p_1$ is a point in $E'$, every neighborhood of $p_1$ has a point in $E$.  Any neighboorhood less than $d - r_1$ of $p_1$ in any neighborhood of $e'$ has a point in $E$ and thus is a limit point in $E'$. This shows that $e'$ must be a limit point of $E$.

**7.**

Let $A_1, A_2, A_3, ...$ be subsets of a metric space.\
($a$) If $B_n = \cup_{i=1}^n A_i,$ prove that $\overline{B}_n = \cup^n_{i=1} \overline{A}_i$, for $n = 1, 2, 3, ..$\
($b$) If $B = \cup_{i=1}^{\infty} A_i,$ prove that $\overline{B} \supset \cup^{\infty}_{i=1} \overline{A}_i$.\
Show by an example this inclusion can be proper.

We first show that this property holds for any two susbets of metric space, then we use the resulting proof on induction. Consider two subsets of metric space $A_1$ and $A_2$ respectively. Let $B_2 = A_1 \cup A_2$.
We wish to show that $\overline{B}_2 = \overline{A}_1 \cup \overline{A}_2$. Consider any point $b$ in $\overline{B}_2$. The point $b$ is an element of $(A_1 \cup A_2)$, a limit point of $(A_1 \cup A_2)$ or both. Enumertaing every case, we note the first and third case imply membership in $(\overline{A}_1 \cup \overline{A}_2)$, since $(A_1 \cup A_2)$ is containted in both $\overline{B}_2$  and $(\overline{A}_1 \cup \overline{A}_2)$.  We then need to show that the second case implies inclusion of $b$ in $\overline{A}_1 \cup \overline{A}_2$. We do this by noting that a limit point of $(A_1 \cup A_2)$ must be a limit point of $A_1$, $A_2$ or both.  Each of these sub cases implies that the point must be a member of $A_1'$, $A_2'$ or both.  Now we need to prove the other direction, namely that every point $a$ in $(\overline{A}_1 \cup \overline{A}_2)$ is a point in $\overline{B}_2$. The point $a$ is either an element in $(A_1 \cup A_2)$, a limit point of $A_1$, a limit point of $A_1$ or any combination of these.  Enumerating every case as before we know that every point in $(\overline{A}_1 \cup \overline{A}_2)$ must be a point in $\overline{B}_2$.  Thus for any two arbituary subests of a metric space we have shown $\overline{B}_2 = \overline{A}_1 \cup \overline{A}_2$.  Inducting on $n$ we show ($a$).  When were are dealing with an infinite union of subsets, we must be more careful.  We may use the argument above to show inclusion as a subset of $\cup^{\infty}_{i=1} \overline{A}_i$ to $\overline{B}$ if we consider any particular element of $\cup^{\infty}_{i=1} \overline{A}_i$.  However as mentioned in Thm $2.24$, an infinite union of closed sets may not be closed.  Consider the example of $A = [-\frac{1}{n}, \frac{1}{n}](n = 1, 2, 3, ...)$. The resulting infinte union is $[-1, 0) \cup (0, 1]$ which is not closed. The point $0$ is contained in $\overline{B}$, however for any $A_i$ we exam $0$ is not a limit point as there is a neighborhood where no element of $A$ exists.


**8.**

Is every point of every open set $E \subset R^2$ a limit point of $E$? Answer the same question for closed sets in $R^2$.

Yes, the definition of an open set is that every point is an interior point of $E$.  In $R^2$ this implies that every neighborhood of an interior point contains a point in $E$ and thus is a limit point.  This is not true for all closed sets. Consider this proof by a counter example, an isolated point.  If we restrict closed sets to not contain isolated points we could also make this claim for closed sets.  Note this property is specific to metric space we are in.

**9.**

Let $E^{\circ}$ denote the set of all interior points of a set $E$. [See Definition 2.18(e);  $E^{\circ}$ is called the *interior* of $E$.]\
($a$) Prove that $E^{\circ}$ is always open.\
($b$) Prove that $E$ is open if and only if $E^{\circ} = E$\
($c$) If $G \subset E$ and $G$ is open, prove that $G \subset E^{\circ}$.\
($d$) Prove that the complement of $E^{\circ}$ is the closure of the complement $E$.\
($e$) Do $E$ and $\overline{E}$ always have the same interiors?\
($f$) Do $E$ and $E^{\circ}$ always have the same closures.

($a$) We call a set *open* if every point of the set is an interior point.  Since every point of $E^{\circ}$ is an interior point, $E^{\circ}$ must be open.

($b$) By similiar logic above, if a set $E$ is equal to its interior, it must be open by the defintion of an *open* set.  If $E^{\circ}$ was different in any way from $E$ then $E$ must contain a non interior point, and heance cannot be open.

($c$) If $G$ is open than every point in $G$ must be an interior point.  Since $G$ is a subset of $E$, every point in $G$ must be a point in $E$.  Finally, since $E^{\circ}$ is defined as all the interior points of $E$, $G$ must be a subset of $E^{\circ}$ 

($d$) The complement is defined as intersection of the space $X$ and $E$.  

For any point $e_c$ in $\overline{E^c}$, $e_c$ is a member of $E^c$, $(E^{c})'$ or both. If $e_c$ is a point in $E^c$, then $e_c$ must be a point in $(E^{\circ})^c$, since the compliment of $E^{\circ}$ is a subset of the compliment of $E$.  If $e_c$ is a member of $(E^{c})'$ then it must be either an isolated point of $E$ or an limit point of $E$.  If $e_c$ is an isolated point in $E$, then it is contained in the complement of $E^{\circ}$.  Otherwise if $e_c$ is a limit point $E$, then $e_c$ cannot be an interior point of $E$, since an interior point could not be in $\overline{E^c}$. Because $e_c$ is not an interior point of $E$ then it must be in the compliment of $E^{\circ}$.

Going the other way, consider any point in $e_{\circ}$ in the compliment of $E^{\circ}$. Either $e_{\circ}$ is not in $E$ or it is a non interior point in $E$.  Both cases imply membership in $\overline{E^c}$.

($e$) No. Consider the following counter example.  Imagine a circle $S$ in $R^2$ which has a single point missing from its center.  The closure of $S$ has a single additional interior point than $S$.

($f$) No. Any set $E$ with an isolated point is a counter example. This is because $E^\circ$ will not include isolated points, which would still be in the closure of $E$.

**10.**

Let $X$ be an infinite set. For $p \in X$ and $q \in X$, define

$$d(p,q) = \{ 1 \ (if \ p \neq q) \ or \ 0 \ (if \ p = q) \}$$
Prove that this is a metric. Which subsets of the resulting metric space are open? Which are closed? Which are compact?

The first criteria ($a$) is clear since the distance is always 1, unless $p$ and $q$ are the same. 

The second criteria ($b$) is clear as well since $d(p, q) = d(q, d) = 1$, unless $p = q$, in which case $d(p, q) = d(q, p) = 0$.  

The third case is less obvious than the previous two.
We enumerate the cases of the third requirement $d(p,q) \leq d(p,r) + d(r,q)$.  When $p, q$ and $r$ are different $d(p,r) + d(r,q)$ will be $2$, which is greater than the left hand side. If $p$ is equal to $q$ and or $r =$ $p$ or $q$, the equality holds as well.

Every subset of this metric is closed, since limit points cannot exist!  Every subset of the metric is open as well since for any neighborhood of point $p$ with $r \leq 1$, contains only one point $p$! Compact subsets can only exist for finite points.

**11.**

For $x \in R^1$ and $y \in R^1$, define

$$d_1(x, y) = (x - y)^2$$
$$d_2(x, y) = \sqrt{|x - y|}$$
$$d_3(x, y) = |x^2 - y^2|$$
$$d_4(x, y) = |x - 2y|$$
$$d_5(x, y) = \frac{|x - y|}{1 + |x - y|}$$

Determine, for each of these, whether it is a metric or not.

For each criteria we consider each of the three properties.

$d_1$ No\
($a$) $x = y \implies (0)^2 = 0$\
($b$) $d_1(x, y) = x^2 - 2xy + y^2 = y^2 - 2xy + x^2 = d_1(y, x)$\
($c$) $d_1(p, q) \leq d_1(p, r) + d(r, q)$ for any  $r \in x$. Expanding this definition out we have $p^2 -2pq +q^2$ on the left hand side, and $p^2 - 2pr + r^2 + q^2 -2qr + r^2$ on the right hand side.  We remove common terms and end up with $-2pq$ and $- 2pr -2qr + 2r^2$ respectively. Factoring $2r$ on the right hand side and then dividing both sides by two we have $-pq \leq r(- p - q + r)$.  Clearly there are cases where this fails.  Consider $p = 1, q = -1, r = 0$. Then $d_(p,q) = 4$ and $d_1(p, r) + d(r, q) = 1$.

**//TODO Review Proof** 

$d_2$ Yes\
($a$) $x = y \implies \sqrt{|0|} = 0$\
($b$) By $|x - y| = |y - x|$, then $\sqrt{|x - y|} = \sqrt{|y - x|}$\
($c$) $\sqrt{|x - y|} \leq \sqrt{|x - r|} + \sqrt{|y - r|}$, Square both sides $|x -y| \leq |x - r| + 2\sqrt{|x - r|}\sqrt{|y - r|} +|y - r|$ Now that we have the inequality in this form, we recognize the schwartz inequality, and call it a day.

$d_3$ No\
($a$) $x = y \implies |0^2 - 0^2| = 0$, But when $x = 1, y = -1$ it is also zero which is a violation\


$d_4$ No\
($a$) $x = y \implies |0 - 2\cdot0| = 0$ ( When $x = 1, y = 1/2$ the function violates the positivity requirement)\
($b$) The second property is false.  $∣x−2y∣$ does not always equal $|y - 2x|$, in fact the second property fails anytime $x$ is different than $y$.

$d_5$ Yes\
($a$) $x = y \implies 0/1 = 0$\
($b$) By $|x - y| = |y - x|$, then $|x - y|/(1 + |x - y|) = |y - x|/(1 + |y - x|)$\
($c$)

$$ \frac{|x -y|}{1 + |x - y|} \leq \frac{|x -r|}{1 + |x - r|} + \frac{|y - r|}{1 + |y - r|}$$

-- Expand right side

$$\frac{|x -y|}{1 + |x - y|} \leq \frac{(1 + |y - r|)(|x -r|) + (|y - r|)(1 + |x - r|)}{(1 + |x - r|)(1 + |y - r|)}$$

-- Expand

$$\frac{|x -y|}{1 + |x - y|} \leq \frac{|x -r| + 2|x -r||y - r| + |y - r| }{1 + |x - r| + |x -r||y - r|+ |y - r|}$$

Notice in the fraction that $|x -r| + 2|x -r||y - r| + |y - r|$ will always be greater than or equal to $|x -r| + |x -r||y - r| + |y - r|$ in the denominator. Since both sides have the $+1$ in the denominator, if we can show that $|x -r| + 2|x -r||y - r| + |y - r|$ is greater than $|x -y|$, then we can prove the inequality.    And this is not hard to prove since this is another case of the schwartz inequality of real numbers, because $2|x -r||y - r|$ is never negative.

**12.**

Let $K \subset R^1$ consist of $0$ and the numbers $1/n$, for $n = 1, 2, 3...$.  Prove that $K$ is compact directly from the definition (without using the Heine-Borel theorem).

Consider any open cover $c$ of $K$. The cover $c$ must have an element $c_0$ that covers $0$, further more $c_0$ is either bounded or unbounded.  If $c_0$ is unbounded it covers the entier set, otherwise it is bounded.  Because the sequance $k$ is bounded above, we can show that a finite subcover exists for $K$ by showing the  points uncovered by $c_0$ are finite.  We know that there is some neighborhood $N$ with a radius $r$ around $0$ contaied in $c_0$. We then know that any element in $K$ where $1/n < r$ is covered by $c_0$.  That leaves finitly many elments uncovered by $c_0$.  We then for the finitly many left points choose one open set that contains them.  Thus we have shown any open cover must cover the elment $0$, and this must leaves a finite set of uncovered points which we know is compact.

**13.**

