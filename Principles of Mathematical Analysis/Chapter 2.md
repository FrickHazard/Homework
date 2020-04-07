**1.**

Prove that the empty set is a subset of every set.

Consider the propositional definition of a subset $B$ of $A$, $\forall b \in B, b \in A$. This implies that $\emptyset \subset A$ entails $\forall b \in \emptyset, b \in A$.  And since there are no elements in $\emptyset$ this condition is always true.

**2.**

A complex number $z$ is *algebraic* if there are integers $a_0, ..., a_n$, not all zero, such that

$$a_0z^n + a_1z^{n -1} + ... + a_{n-1}z + a_n = 0.$$
Prove that the set of all algebraic numbers is countable.  *Hint*: For every positive integer $N$ there are only finite many equations with 

$$n + |a_0| + |a_1| + ... + |a_n| = N.$$

We know that the countable union of countable sets must be countable.  This leaves us to prove that every indiviual polynomial of $n$ is countable, since the polynomials themselves are constructed from a countable set $a$.

We use the hint provided and realize that for any particular set of integer coefficents, there is a finite set of complex numbers that can satisfy the equation($n$ degree roots).  Since there are only finitely numbered complex numbers that satisfy a particular polynomial with certain coefficents, the solutions to any particular polynomial must be countable.  And again since the union of countable sets must be countable, the set of all solutions must be countable.

**3.**