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