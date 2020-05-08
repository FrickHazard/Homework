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

Construct a compact set of real numbers whose limit points form a countable set.

Consider the set $\{ 1/n \} \ \cup 0$ for $n : \mathbb{N}$ in $\mathbb{R}^1$.  As shown above we know that $\{ 1/n \} \ \cup 0$ is compact.  It only has a finite set of limit points, specifically $0$.  Since every finite set is countable this meets the criteria.

This defintion is rather boring and we now attempt to construct an example with countablely infinite limit points. Extending the previos example, consider the set $\{ 1/n \} \cup 0 \cup \ V$ for $V = \cup_n^{\infin} V_n = \ (n+m)/2mn$ where $(n, m: \mathbb{N})$ in $\mathbb{R}^1$.  The set $V$ is equal to the union of the average of $1/m$ and $n$ for all $m$ on a particular $n$. A particular $V_n$ is essentialy the simple case above scaled down around a particular $1/n$ point.  Since every point $1/n$ is included in the set every $V_n$ has their respective limit points, making the set closde.  Clearly the entire set is bounded as well.  We may induct the arguments provided previously to show this set is compact. Therefore the set is compact and has countablely infinite many limit points.  I like to imagine a cloud of points getting denser proprtional to how close a point $1/n$ is converging to $0$.

**14.**

Give an example of an open cover of the segment $(0, 1)$ which has no finite sub-cover.


Consider the following collection $\{ V_n \}$ where $n : \mathbb{N}$ and $V_n = (1/n - 1/(2n) \ \ , \ \ 1/n +1/(2n) )$. (This corresponds to a ball around a point $1/n$ with $1/n$ radius). The infinite union of $V_n$ covers every point, since every point can be mapped to an open ball.  However for any finite subset $V_s = \{ V_i ... V_m \}$ we choose, it can be shown that $V_s$ cannot cover every point in $(0, 1)$.  Proof. Consider the open ball $c$ with the least radius $r$ of $V_s$. This open ball must be around the point $(r)$. (This is reason why we defined the radius to be the same as the position of a point).  We know that there is a point at $1/(r+1)$ which is not covered by $c$ or any of the other balls, for any other ball has at least a distance of $1/r$ from the point $1/(r+1)$, by our definition.  Thus there is always a point closer to zero that is not covered by any finite subset of $V$.  Thus there exist an opencover $V$ with no finite subcover on $(0, 1)$.

**15.**

Show that Theorem 2.36 and its Collary become false (in $\mathbb{R}^1$, for example) if the word "compact" is replaced by "closed" or by "bounded".

The proof given for Theorem 3.36 relies on every element of the collection $\{K_\alpha\}$ having a finite subcover.  Neither of these conditions are guarenteed exclusively by closedness or boundedness.  Since the qualifier of the proof applies to **all** collections $\{K_\alpha\}$ such that the intersection of *every finite* subcollection of $\{K_\alpha\}$ is nonempty, we may produce a counter example to disprove both closedness and boundedness.

Consider in the case of boundedness, a collection $\{O_\alpha\}$ in $\mathbb{R}^1$ of open balls with radius $\alpha < 1$ around a point $p$.  Every ball has an offset of ($1-\alpha$) from $p$.  This way any finite subcollection of balls must have a nonempty intersection, since the ball with the min radius of the subcollection must be contained in the ball with the max radius.  However $\cap \ O_\alpha$ is empty.
Thus there exists a set of which the property does not hold.

Consider in the case of closedness, a collection $\{C_\alpha\}$ in $\mathbb{R}^1$ where every element is defined as $[\alpha, \infin)$ where $\alpha : \mathbb{N}$.
Every finite subset must have a point in common since there is a point in every set beyond the min $\alpha$.  However $\cap \ C_\alpha$ is empty. Thus there exists a set of which the property does not hold.

**16.**

Regard $\bold{Q}$, the set of all rational numbers, as a metric space, with $d(p, q) = |p-q|$. Let $E$ be the set of all $p \in \bold{Q}$ such that $2 < p^2 < 3$. Show that $E$ is closed and bounded in $Q$, but that $E$ is not compact. Is $E$ open in $\bold{Q}$?

The set $E$ is clearly bounded since $p$ must be greater than $-3/2$ and less than $2$(These bounds are arbiturarily picked).

In order to prove that $E$ is closed, we must show that every limit point of $E$ must be a point in $E$.  Consider a point $q$ in $E^c$. If $q$ is in $E^c$ then one of the following is true, $q^2 \leq 2$ or $q^2 \geq 3$.  If $q^2$ is not exactly equal to the boundary($2$ or $3$) then the distance between $q^2$ and the boundary implies the exist of rationals whose square is between $q^2$ and the boundary point.  Thus in the case where $q^2 < 2$ or $q^2 > 3$, $q$ cannot be a limit point of $E$. We now consider where $q^2$ is equal to the boundary point of either $2$ or $3$. However we know that no rational $r$ exists such that $r^2 = 2$ or $r^2 =3$!  Thus every point of $E^c$ cannot be a limit point of $E$.  So every limit point of $E$ is a point of $E.$

 In order to show that $E$ is not compact it suffices to produce a counter example.  Consider the open cover $\{U_\alpha\}$, defined by an open ball $(3/2 -\alpha \ , \ 3/2 + \alpha )$ (Think exercise **2.14**), where $2 < (3/2 -\alpha)^2$ and $(3/2 + \alpha)^2 < 3$.  The union of this collection clearly covers all of $E$. However, for any finite subset set of $\{U_\alpha\}$, we may take the minimum radius and show that there is a point between the least covered point and the boundary in $E$.

 Yes since we approach arbituarily close to the boundary point and any point we consider has other points in $E$ in both directions.

 **17.**

 Let $E$ be the set of all $x \in [0, 1]$ whose decimal expansion contains only the digits $4$ and $7$. Is $E$ countable? Is $E$ dense in $[0, 1]$. Is $E$ compact? Is $E$ perfect?

$E$ is not countable.  We may use the diagnolization argument switching $7$ with $4$ for every digit we run across.  The set $E$ cannot be dense in $[0, 1]$. The sup of $E$ is $0.777777777777...$, so if we consider any point greater say $0.81$ then there is at least a distance of $0.1$ between the two points.

<!-- Lemma : only members of $E$ with infinte digits are limit points.
For any point with finite digits there exists a radius where no other points of the set can dwell.  For example if a point $p$ has the decimal representation of $0.747$ the closest point will be $0.7474$.  Then there is neighboorhood around $p$ with radius less than $0.0004$ that only contains  $0.7474$, and thus the point cannot be a limit point. -->

$E$ Is compact, since if a point $p$ was a limit point of $E$ and not in the set then, $p$ must contain another digit besides $7$ or $4$.  And if that is the case we cannot approach arbituarly close to that point.  This implies that $E$ is closed, and since $E$ is bounded and in $R^1$ we know it must be compact.  

$E$ Is perfect because it is closed and because, for any neighboorhood we choose with radius $r$, it is possible to find a number with a change in a digit that is less than 
$r$.  Note if we allowed finitely many digits of $7$ and $4$, such as $0.747747\overline{0}$. we could not make this claim.

**18.**

Is there a nonempty perfect set in $R^1$ which contains no rational number?

Yes, Motivation

Consider the set defined in problem **17**.
This set is perfect, and avoids many rational numbers, however any rational number, which must have a repeating sequence of digits, with $7$ or $4$, is a limit point in this set. (Consider $7/9 = 0.\overline{7}$). So we seek construct a set of real numbers such that their digits do not repeat and every neighboorhood of every point has infinitely many points.

Proof

Let $D$ be the set of all $x \in [0, 1]$ whose decimal expansion contains only the digits $4$ and $7$.  Let $x_0 = 0.01001100011100001111...$.  Now consider a set $E$ defined as $E = D + x_0= \{d + x_0| d \in D \}$.  We may use the above proofs to derive the same conclusions for $E$, since $E$ is only shifted by a fixed amount. We know that $x + d, d \in D$ must be irrational, since $d$ is restricted to only $7$ and $4$ in its decimal places, and cannot cancels $x_0$ irrationality.  Thus $E$ contains no rationals, is closed and perfect.

<!-- No.

Proof by contradiction

Assume there exists some set $E$ with properties described above. Since we are in $R^1$ and $E$ is non empty and perfect, $E$ must contain infintely many points.
Since $E$ is perfect than every point must be a limit point. Now consider a limit $p$ in $E$.   Next consider a point $q$ in a neighboorhood $N_p$ of $p$. Because $E$ is perfect then $q$ must be a limit point as well. Using the triangle inequality we may consider a neighboorhood $N_q$ around $q$ contained in $N_p$.  Since $\mathbb{Q}$ is dense in the rationals there exists a rational between $p$ and $q$.  If we induct on the size $N_t$ -->

<!-- Since $\mathbb{Q}$ is dense in the rationals for any point $q$ in the neighboorhood of $p$ there exists a rational between them.  -->

<!-- Since the rationals are dense in $R^1$ even if we exclude rationals from our set definition  -->

<!-- Consider the set $E$ defined as the set of all real numbers in $[0, 1]$. This implies that $E$ must be compact -->

<!-- Consider the set $E$ defined as the set $0.A_1A_2A_3A_4A_5A_6$ where $\cap A = \empty$ and $(A_i : \mathbb{N})$. For any $A_i$ we write all digits.  For example if $A_5 = 1, A_6 = 45$ then $0.A_5A_6 = 0.145$. The set $E$ cannot contain any rational numbers since the decimal expansion of rational numbers must repeat. The set $E$ must be bounded since every point starts with the digit $0$.

What remains to be shown is that  $E$ is closed and perferct.  Consider a=
 -->
 sdf
**19.**

($a$) If $A$ and $B$ are disjoint closed sets in some metric space $X$, prove that they are seperated.

($b$) Prove the same for disjoint open sets.

($c$) Fix $p \in X, \delta > 0$, define $A$ to be the set of all $q \in X$ for which $d(p, q) < \delta$, define $B$ similiarly, with $>$ in place of $<$.  Prove that $A$ and $B$ are seperated.

($d$) Prove that every connected metric space with at least two points is uncountable.  *Hint:* Use($c$)

($a$)  We know that if any set $E$ is closed then $E = \overline{E}$. Since both $A$ and $B$ are disjoint and closed, then $(\overline{A} = A) \cap (\overline{B} = B) = \empty$. Thus $A \cap \overline{B} = \empty$ and $\overline{A} \cap B = \empty$ are true and the criteria for a seperated set is met.

($b$) Since $A$ and $B$ are disjoint sets, then $A \cap B = \empty$.

Proof by Contradiction

Suppose the set $A \cap \overline{B}$ was non empty.  Then any point $p$ must be in both $A$ and $\overline{B}$.  Since $A \cap B = \empty$, then $p$ must be a limit point of $B$, but not in $B$.  But this means that $p$ cannot be an interior point of $A$, since every neighboorhood contains a point of $B$.  So thus we have a contradiction.  The same argument can be made with  $\overline{A} \cap B$.  So both $A \cap \overline{B}$ and $\overline{A} \cap B$ are empty, and thus $A$ and $B$ are seperated.

($c$)  $A$ and $B$ are disjoint, since a point $q \in A$ implies that $d(p, q) < \delta$ which excludes it from $B$.  Both $A$ and $B$ are open, since they approach $\delta$ but do not include it. We also note that both $\overline{A} = B^c$ and $\overline{B} = A^c$ hold.  Since  $A$ and $B$ are disjoint and open we apply ($b$).

($d$) 

Proof by Contradiction

Suppose a connected metric space $X$ with at least two points is countable. Since there are at least two points, let us call one $p$.  Let us construct two sets $A \cup B = X$, where $A = \{p\}$ and $B \{q \in X \ | \ q \notin A\}$. In order to prove a contradiction we wish to show that $A$ and $B$ are seperated.  Since there are finitly many points in $X$ and thus $B$. We take the min distance from $d(p, q) \ \ q \in B$.  We set delta to this distance and apply ($c$), showing that $X$ must be seperated which is a contradiction.

**20.**

Are closures and interiors of connected sets always connected? (Look at subsets of $\mathbb{R}^2$.)

The Closure of a connected set will always be connected. Every new point added by the closure of $\overline{E}$ is a limit point of $E$, so that for any $A \cap B = \empty$, $A \cup B = E$, then $A \cap \overline{B}$ and $\overline{A} \cap B$ are non empty.  This is because if any point $q$ is a limit point of $E$ then $q$ must  be a limit point in $A$ or $B$. Then it must be a point in $\overline{A}$ or $\overline{B}$. So neither $A \cap \overline{B}$ nor $\overline{A} \cap B$ can be empty.

The interior of connected sets is not necessarily connected.  Consider the counter example of $E = A \cup B$, where $A = \{ \ p \in X \ | \ d(p, 1/2) < 1/2 \ \}$ and $B = \{ \ q \in X \ | \ d(q, 3/2) \leq 1/2 \ \}$.  The motivation for this set is a 2D version of $(0, 1) \cup [1, 2]$ constructed from balls. The interior of this set is equal to $E = A \cup B_i$, where $B_i$ is the interior of $B$ equal to $\{ \ q \in X \ | \ d(q, 3/2) < 1/2 \ \}$ ($\mathbb{R}^1$ collary $(0, 1) \cup (1, 2)$).  Note that the interior of $E$ does not include $1.$, Since in the $y$-axis there is always a point above the point $1$ that is not in $E$, so $1$ cannot be an interior point. This implies that the interior of $E$ is seperated. Since the only limit point shared between $A$ and $B$ is $1$. Writing this explicitly we see that $A \cap \overline{B_i} = \empty$ and $\overline{A} \cap B_i = \empty$, since $1 \notin A, 1 \notin B_i$ and we know that $1$ is othe only limit shared between $B_i$ and $A$.

**21.**

Let $A$ and $B$ be seperated subsets of some $\mathbb{R}^k$, suppose $\bold{a} \in A, \bold{b} \in B,$ and define

$$\bold{p}(t) = (1-t)\bold{a} + t\bold{b}$$

for $t \in \mathbb{R}^1$. Put $A_o = \bold{p}^{-1}(A), B_o = \bold{p}^{-1}(B).$ [Thus $t \in A_o$ if and only if $\bold{p}(t) \in A$]

($a$) Prove that $A_o$ and $B_o$ are separated subsets of $\mathbb{R}^1$.\
($b$) Prove that there exists $t_o \in (0, 1)$ such that $\bold{p}(t_o) \notin A \cup B$.\
($c$) Prove that every convex subset of $\mathbb{R}^k$ is connected.

First note that $\bold{p}^{-1}$ indicates the reverse image of $\bold{p}$. We also note the $\bold{p}$ is a linear interpolation between vectors $\bold{a}$ and $\bold{b}$.

($a$) In order to prove that $A_o$ and $B_o$ are seperated sets, we must show that $\overline{\bold{p}^{-1}(A)} \cap \bold{p}^{-1}(B)$ and $\bold{p}^{-1}(A) \cap \overline{\bold{p}^{-1}(B)}$ are empty. The seat $A_o$ only has elements where $p(t) \in A$ and likewise $B_o$ only has elements where $p(t) \in B$.  Since $A$ and $B$ are seperated, $A \cap B = \empty$, which implies $\bold{p}^{-1}(A) \cap \bold{p}^{-1}(B) = \empty$.  This leaves us only to consider the limit points in the closure of $A_o$ and $B_o$.  Consider a real number $t_l$ which is a limit point of $A_o$ not in $A_o$. If $t_l$ were a point in $B_o$ then $\bold{p}(t_l) \in B$.  But this is a contradiction since any limit point of $\bold{p}(t_l)$ with respect to $B$ cannot be a point in $A$ and thus cannot have an associated limit point in $A_o$.  So then any limit point of $A_o$ cannot be a point in $B_o$. We make the exact same argument from the perspective of $B_o$.  This allows us to make the statement $\overline{A_o} \cap B_o = \empty$ and $A_o \cap \overline{B_o} = \empty$, which is the definition of $A_o$ and $B_o$ being seperated.

($b$) Since we know that $A_o$ and $A_b$ are seperated and in $\mathbb{R}^1$.  We know from inversion of the if and only if of theorem $2.47$ that there exists $x \ y, \in A_o \cup B_o$ such that there exists  $z$, where $x < z <y$ and $z \notin A_o \cup B_o$. This implies that $\bold{p}(z)$ cannot be in $A \cup B$. All that is left is to prove is that $0 < z < 1$ must hold. Consider $p(0)$ which is equal to some $a \in A$. Since $z$ is not in $A_o$ and every other $p(k)$ where $k \in A_o$ and $k < 0$ cannot be in $B$, then $z$ must be greater than $0$.  We make a similiar argument from the perspective of $B$ showing that $z$ must be less than $1$.  So then there must exist some real number $z$ in the interval $(0, 1)$, such that $\bold{p}(z) \notin A \cup B$, since $z$ is not in $A_o$ or $B_o$.

($c$)
A set $E$ in $\mathbb{R}^k$ is convex if $(1- \lambda)\bold{x} + \lambda\bold{y}  \in E$  whenever $\bold{x} \in E, \bold{y} \in E$ and $0 < \lambda < 1$. With what we have shown in ($a$) and ($b$) we can prove the theorem by contradiction.  Suppose a convex set $E$ was seperated.  Then we could construct a $z$ in the interval $(0, 1)$ of which $\bold{p}(z)$ is not a member of $E$ via ($b$), but this is a contradiction, since for any number in the interval $0 < \lambda < 1$, $\bold{p}(\lambda)$ must be a member in $E$. And so every convex set in $\mathbb{R}^k$ must be connected.

**2.22**

A metric space is *separable* if it contains a countable dense subset.  Show that $R^k$ is separable. Hint: Consider the set of points which have only rational coordinates.

Consider the set $E$ in $\mathbb{R}^k$ composed of all points that can be expressed as tuples of rational numbers. In order to show that $E$ is dense in $\mathbb{R}^k$ we need to show that every point in $\mathbb{R}^k$ is a limit point of $E$. Consider a neighboorhood $N_r$ with radius $r$ around an arbituary point $p$ in $\mathbb{R}^k$. The set $N_r$ contains an infinite amount of real numbers, let us call one of them $q$. We know that for any two real numbers we can find a rational number inbetween them.  For each coordinate let us consider a rational number $d_i$ between $p_i$ and $q_i$.  Presuming the Euclidean metric, we can express the distance as the following.

$$\sqrt{\sum_{i=1}^{k} d_i^2}$$

Since $d$ is between $p$ and $q$, using facts about Euclidean distance, we know that $0 < d(d, p) < d(p,q)$, and thus $d$ must be contained in the neighborhood $N_r$.  Since we can find a rational number in every neighboorhood of any point in $\mathbb{R}^k$, every point in $\mathbb{R}^k$ must be a limit point of $\mathbb{Q}^k$, thus $\mathbb{Q}^k$ is dense in $\mathbb{R}^k$.  Since $\mathbb{Q}^k$ is countable, we have reached our conclusion.



**2.23**

A collection $\{V_{\alpha}\}$ of open subsets of $X$ is said to be a *base* for $X$ if the following is true : For every $x \in X$ and every open set $G \subset X$ such that $x \in G$, we have $x \in V_{\alpha \subset G}$ for some $\alpha$. In other words every open set in $X$ is the union of a subcollection $\{V_{\alpha}\}$.

Prove that every seperable metric space has a *countable* base.  *Hint*: Take all the neigborhoods with rational radius and center in some countable dense subset of $X$.



