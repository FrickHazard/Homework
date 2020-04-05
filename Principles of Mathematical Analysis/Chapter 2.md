**1.**

Prove that the empty set is a subset of every set.

Consider the propositional definition of a subset $B$ of $A$, $\forall b \in B, b \in A$. This implies that $\emptyset \subset A$ entails $\forall b \in \emptyset, b \in A$.  And since there are no elements in $\emptyset$ this condition is always true.

**2.**

A complex number $z$ is *algebraic* if there are integers $a_0, ..., a_n$, not all zero, such that

$$a_0z^n + a_1z^{n -1} + ... + a_{n-1}z + a_n = 0.$$
Prove that the set of all algebraic numbers is countable.  *Hint*: For every positive integer $N$ there are only finite many equations with 

$$n + |a_0| + |a_1| + ... + |a_n| = N.$$

First lets review what multiplication of an integer and a complex number means  $(n, 0) \cdot(a, b) = (na, nb)$