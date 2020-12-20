**5.1**

For the following graphs $G_1$ (left) and $G_2$ (right):

($a$) Report the order of the vertices encountered on a breadth-first search starting from vertex $A$. Break all ties by picking the vertices in alphabetical order (i.e., $A$ before $Z$).

($b$) Report the order of the vertices encountered on a depth-first search starting from vertec $A$.  Break all ties by picking the vertices in alphavetical order (i.e., $A$ before $Z$).

($a$) $G_1$ : A | BDI | CEGJ | FH, $G_2$ : A | BE | CFI | DGJM | HKN | LO | P\
($b$) $G_1$ : A B C E D G H F J I  $G_2$ : A B C D H G F E I J K L P O N M

**5.2**

Do a topological sort of the following graph $G$ :

From errata "Page 185, Exercise 5.2 -- this graph is not acyclic. Reverse the edge (F,H)."

Here is the solution with this correction

A, B, D, E, C, H, G, I, J, F

**5.3**

Prove by induction that there is a unique path between any pair of vertices in a tree.



Inducting On : The *edge* height of a tree.

Hypothesis : For every node in the tree there is a unique path between any two nodes.

Base Case : Consider a tree of height 1 (edge height). This tree has a single root node and $k$ children nodes.  By the definition of a tree there is a unique edge for every child and parent. Consider two cases, either a pair of nodes is between the root node and and a child, or it is between two children.  In the first case the uniqueness of the path comes right from the tree definition.  In the second case a unique path between sibling nodes must go through the root. And since there there is a unique edge between a child and the root, and a path between two children is the combination of these, every pair of sibling nodes must have a uniqe path.

Induction Step : Given a tree $T_n$ were every two nodes have a unique path, we wish to show a tree $T_{n+1}$ has the same property. Since the path between nodes in $T_n$ are already guaranteed to be unique by the induction hypothesis, we are only concerned with paths involving the newly added leaf nodes of $T_{n+1}$.  For a pair of nodes $(n_i, n_j)$, one of which is a new leaf node of $T_{n+1}$, consider the following cases.  Case 1, the pair consists of a node in $T_n$ and a leaf node.  Case 2 both nodes are leaf nodes.  We wish to show that for both cases the invariance holds.  Case 1, suppose $n_i$ is the leaf node and $n_j$ the node in $T_n$. The path for the pair $(parent (n_i), n_j)$ is guaranteed to be unique.  Since this path is unique and adding an child edge to this path which is guarenteed to be unique by the one edge per child property of trees, the path between $(n_i, n_j)$ must then be unique.  Case 2, consider the path between $(parent (n_i), parent(n_j))$.  This path must be unique by the induction hypothesis. Again since every edge between a parent and a child is unique in trees, adding the edge between $(n_i, parent (n_i))$ and $(n_j, parent (n_j))$ must be unique to $n_i$ and $n_j$ respectively.  Thus $T_{n+1}$ has a unique path between any two nodes.

**5.4**

Prove that in breadth first search on a undirected graph $G$ every edge is either a tree or a cross edge, where $x$ is neither an ancestor nor descendant of $y$, in cross edge $(x, y)$.

Consider a breadth first search on a graph $G$ starting at a node $g_r$.


<!-- On an undirected graph, backwards edges (forward edges) with respect to $g_r$ cannot exist in a breadth first search.  This can be seen by considering the fact that in a breadth first search we evalute edges with distance $d_1$ to $g_r$ before edges of greater distance $d_2 > d_1$.  For an undirected graph finding a backward(forward) edge would be contradiction, as the distance between a backward(forward) edge and $g_r$ would be less than the distance between $g_r$ and the edge that discovered the backward(forward) edge, contradicting the distance property of BHS. -->

**Lemma**

In a breadth first search we evalute edges with distance $d_1$ to $g_r$ before edges of greater distance $d_2 > d_1$.  For an undirected graph finding a node $n$ with an edge distance shorter than the its parent search node $n_r$ would be contradiction, as the distance between a $n$ and $g_r$ would be less than the distance between $n_r$ and $g_r$. This contradicts the distance property of BHS.

**Induction**

Inducting On : A step of breadth first search.  Where a step is the evaluation all the nodes of edge distance $d$ away from $g_r$.

Induction Hypothesis : Every edge is a tree edge or a cross edge $(x, y)$ such that $x$ is neither an ancestor nor descendant of $y$, in cross edge $(x, y)$

Base case : The first evalution of connected nodes of $G_r$.  Since we every node were are evaluting is a direct descedant of $G_r$, every node must be a tree node.

Induction Step : Given a previous state of breadth first search $B$, with the induction hypothesis holding. We seek to prove the next step of BFS mantains the hypothesis.  Consider a new node $n$ and edge $e$ being evaluted by BFS from the node $n_r$. By the lemma above, $n$ cannot be a cross edge ancestor nor descendant of $n_r$ as the edge distance between $g_r$ $n$ and $n_r$ $g_r$ would be different, contradicting the evalutation order of BFS.  This leaves with simpler picture.  Either $n_r$ is node that has been evaluted by BHS or not. If $n_r$ has already been evaluted by BHS, then it is a cross node, otherwise it is a tree node.  The lemma above prevents any other case, as backwards(forwards) nodes, on an undirected graph, contradict the edge distance order of BHS.


**5.5**

Give a linear algorithm to compute the chromatic number of graphs where each vertex has degree at most $2$.  Must such graphs be bipartite?

Use BFS traversal. If we come across any cross edges of any already discovered node we color the parent node with a color different than its the parent, and also different from the connected cross node. This situauion may never occure, in which case the graph is bipartite, otherwise this situation nessitates a third color.

A easy example that three colors may be required is a triangle.
<!--
Use a DFS traversal coloring child nodes differently than the parent.  If we run into a back edge we color the currently discovered child with a color different that the parent, and also different from the ancestor discovered through that back edge. -->

**5.6**
In breadth-first and depth-first search, an undiscovered node is marked *discovered* when it is first encountered, and marked *processed* when it has been completely searched.  At any given moment, several nodes might be simultaneously in the *discovered* state.

* ($a$) Describe a graph on $n$ vertices and a particular starting vertex $v$ such $\Theta(n)$ nodes are simultaneously in the *discovered* state during a *breadth-first* search starting from $v$.

* ($b$) Describe a graph on $n$ vertices and a particular starting vertex $v$ such that $\Theta(n)$ are simultaneously in the *discovered* state during a *depth-first search* starting from $v$.

* ($c$) Describe a graph on $n$ vertices and a particular starting vertex $v$ such that at some point $\Theta(n)$ nodes remain *undiscovered*, while $\Theta(n)$ nodes have been *processed* during a *depth-first search* starting from $v$. (Note, there may also be *discovered* nodes.)

($a$) Consider a tree with an edge height of one and $n-1$ children attached to the root node. Let $v$ be the root node. A singe step in BFS will recurse through every child of $v$, leaving $Θ(n)$ nodes discovered.

($b$) Consider a tree where every node has only one child. Let $v$ be the root node.  Once DFS reaches the bottom of this tree every node will be on the stack and discovered.

($c$)  Consider a tree where of node height $n/2$. Let $v$ be the root node. with two nodes attached to it, and every other parent node only having one child.  We could think of this as a bifurcated linked list.  Afte the first iteartion of DFS resovle,s all the nodes on once side will be processed, while half the nodes on the other side will be undiscovered.  Since $\Theta(n/2) = \Theta(n)$, and our tree is $n/2$ node height tall, or discovered and processed nodes are both $\Theta(n)$.


**5.7**

Given pre-order and in-order traversals of a binary tree, is it possible to reconstruct the tree? Is so, sketch an algorithm to do it.  If not give a counterexample. Repeat the problem if you are given the pre-order and post-order traversals.
We are give two lists representing the nodes as they were traversed.  In the first case with pre-order $A_p$ and in-order  $A_i$ traversal lists, a tree reconstruction is possible.  The first element of the pre-order list will be the root node $A_p[0] = n_r$.  We can then iterate the in-order list until we find $n_r$.  Once we find that node we know $A[0, ... \ (\text{index\_of}(n_r) - 1)]$ must be to the left of $n_r$.  Recursively we can look at $A_p[1]$ which will correspond to the left node at node level $1$. (Note * we are presuming every traversal computes left before right!).  This should split $A[0, ... \ (\text{index\_of}(A_p[1]) - 1)]$ into nodes that are leftwards of $A_p[1]$.  At this point we should be confident of this process.  In other words for each item in $A_p$ we split elements in $A_i$ until a split has one node in which case the node is a leaf node.

For the second case we are give pre-order and post-order traversal lists.  We cannot determine some cases.  For example we cannot resolve leftness or rightness of $B$ on the tree $A$, left child $B$, vs $A$ right child, $B$.  The pre-order list looks like $[A,B]$ and post-order $[B, A]$ for both lists.

The key take away is that in-order traversal preserves leftness vs rightness information which is absent in both pre and post traversal.

**5.8**

Present correct and efficient algorithms to convert an undirected graph $G$ between the following graph data structures.  You must give the the time complexity of each algorithm, assuming $n$ vertices and $m$ edges.

($a$) Convert from an adjacency matrix to adjacency lists.

($b$) Convert from an adjacency list to an incidence matrix.  An incidence matrix $M$ has a row for each vertex and a column from each edge, such that $M[i, j] = 1$ if vertex $i$ is part of edge $j$, otherwise $M[i,j]=0$.

($c$) Convert from an incidence matrix to adjacency lists.

($a$) To convert from an adjacency matrix to adjacency list, we will need to scan each vertex row for every connection.  Unfortunately there is no other way to find every edge in an adjacency matrix.  For every cell that constitutes a valid edge, we create and append a item to the linked list corresponding to the row we are on. This algorithm is $O(n^2)$, and we cannot do any better.

($b$) To convert from an adjacency list to an incidence matrix, we first allocate a $2D$ array of $e \times v$, where $e$ is the number of edges and $v$ is the number of vertices. Then we traverse every vertex linked list, using the edge struct to write in every edge column.  We could use a jump table or an index for every vertex, to write the other related vertex in constant time.  This algorithm is $O(e)$, or $O(en)$ if we include the allocation of the $2D$ array.

($c$) To convert from an incidence matrix to an adjacency list we scan a column for every *edge*. Using a jump table we choose the first vert we ran into and append the edge to that vert's linked list, in constant time.  This algorithm is $O(en)$ and optimal in terms of $O$ notation, as there is a necessity to evaluate every cell (- a vert row, still $O(n)$, in the worse case, in order to determine what a connection actually is.

What is interesting is when $e << n$.

**5.9**

Suppose an arithmetic expression is given as a tree.  Each leaf is an integer and each internal node is one of the standard arithmetical operators (+, -, * /). For the expression $2 + 3 *4 + (3 * 4) / 5$ is represented by the tree in Figure 5.17($a$). Give an $O(n)$ algorithm for evaluating such an expression, where there are $n$ nodes in the tree.

Consider a DFS, post process traversal. That way if we are given a valid tree, then every node with children will have each child resolved to a number by the time we process that node.  Since this traversal traverses over every node, this algorithm is $O(n)$.


**5.10**
Suppose an arithmetic expression is give as a DAG (directed acyclic graph) with common subexpressions removed. Each leaf is an integer and each internal node is one of the standard arithmetical operations (+, -, *, /). For example, the expression $2 + 3 ∗ 4 + (3 ∗ 4)/5$ is represented by the DAG in Figure 5.17($b$). Give an $O(n + m)$ algorithm for evaluating such a DAG, where there are $n$ nodes and $m$ edges in the DAG. Hint: modify an algorithm for the tree case to achieve the desired efficiency.

Consider a DFS traversal of DAG graph.  We store the list of already explored nodes, as well as $E$ an array of numbers, with one number per node.  Since each leaf node is an integer, for an arbituary starting node we use a post process DFS traversal to write the evaluated number for every node to $E$.  We then pick another unvisted node, and traverse checking if a node we visted already has a value.  The guarante of this algorithm is that every visted node will have a corresponding computed number, at the end of a traversal step.  This guarante allows us to classify the algorithm as $O(n + m)$(just like a DFS graph traversal, with some added baggage).

**5.11**

The war story of Section **5.4** (page **158**) describes an algorithm for constructing the dual graph of the triangulation efficiently, although it does not guarantee linear time.  Give a worst-case linear algorithm for the problem.

Create a adjacency data structure where every item in the array is a triangle edge(a pair of two indices).  Then in each array we store a linked list of the indices of triangles that have a matching edge. The first step is constructing an array from triangle edges.  There are a few ways to do this as we need every pair of indices to map in constant time to a position in an array bounded by the number unique edges of the triangles (max size equal to 3 * count of triangles). The options are using a hashtable, an $O(n^2)$ 2 dimensional array, or by a pre pass with $O(n)$ counters.
Next we pass over the triangles accessing the head of the linked list for each edge in constant time and append the triangle to the end of the linked list.  This is our desired data structure.

So in total we pass over the data twice, the first time constructing an constant time access edge structure, and then using this structure to build the desired adjacency list.  This algorithm has an $O(n)$, because in the worst case where every triangle is isolated, we have at most 3 edges per triangle.

The counter setup looks like this, using a counting sort like rountine where the number of vertices is the upperbound.  Construct an array of linked lists for every vert with a structure that contains the triangle index and other edge index.  Populate the structure in $O(n)$ by a first pass.  Next for every linked list use an in place vetrex size array and a counter and write to a triangle sized array so that every triangle edge has an index to jump to on the final pass.   Essentialy we are performing several count sort type passes. This is more convoluted than any of the either methods, but requires less than $O(n^2)$ space which would take $O(n^2)$ running time to allocate.  The hashing method deals in atomized time, so this method is the only pure $O(n)$ of the three.

In practice I would always use hashing for this problem, unless I hit a point where even that was insufficent.

**5.12**

The *square* of a directed graph $G = (V,E)$ is the graph $G^2=(V, E^2)$ such that $(v, w) \in E^2$ if there exists $v \in V$ such that $(u, v) \in E$ and $(u, w) \in E$ i.e. there is a path of exactly two edges from $u$ to $w$.
Give efficient algorithms for both adjacency lists and matrices.

Adjacency List :

We first create an array $A$ of size $V$.  We store in $A$ every connected vert that appears in a particular vert $v$'s linked list.  For every linked list of $v$ we do a first pass filling $A$ with every node that is at the end of a directed edge from $v$.
Then we do a second pass over $v$'s linked list, and for each item we go to that vertex's linked list and append that node as an edge from a $v$, using $A$ to exclude duplicates.  We append all these nodes to a seperate Adjacency structure $T$.  Once we have done this for every $v \in V$, we Append $T$ to the original adjacency list.  This algorithm taks $O(V)$ space, and $O(E^2 + V)$ running time.  Where $O(E^2)$ is going to be optimal, since a worst case input will require close to $E^2$ new edges.

Adjacency matrix :

We first allocate a new Adjacency matrix $A$ of size $V^2$. For each column of a vert $v$ (column vert being the head of a directed edge) we traverse down the column. For every cell marked as an edge we write that edge in $A$ and jump to that corresponding column of a vert $v_2$.  We traverse down the $v_2$ column and for every edge cell in $v_2$ we write the index into $A[v]$. We do this for every $v_2$ of the column $v$.  The running time of this algorithm is $N(V^3)$.  The matrix $A$ now has all the valid $E^2$ connections.

**5.13**

A *vertex cover* of a graph $G = (V, E)$ is a subset of vertices $V'$ such that each edge in $E$ is incident on at least one vertex of $V'$.

($a$) Give an efficient algorithm to find a minimum-size vertex cover if $G$ is a tree.

($b$) Let $G = (V, E)$ be a tree such that the weight of each vertex is equal to the degree of that vertex.  Give an efficient algorithm to find a minimum-weight vertex cover of $G$.

($c$) Let $G = (V, E)$ be a tree with arbitrary weights associated with the vertices. Give an efficient algorithm to find a minimum-weight vertex cover of $G$.

<!-- Parts of this are wrong. See the inverse of 5.16 -->

($a$) We conduct a traversal(DFS or BFS) starting from the root node. For every node we traverse that has only one child or no children, we mark that  node for deletion. Once a node is marked for deletion we preserve that nodes descendants. The following is the reason why this simple algorithm is the minimum vertex cover.  Consider any node  $n$ with more than $1$ children.  If we delete $n$  than we must keep all children, as edges need to have at least one node. If we delete every child then we always have fewer nodes in $V'$.  Inducting on an arbituary tree this reasoning works all the way down to the leaf depth.

<!-- ($b$) Conduct a BFS search starting from the root node.  For each depth compare the weight of the $p$ node to the sum of its children nodes.  If the weight of $p$ is greater delete the parent, otherwise keep the parent and delete all of $p$'s children.
There also seems to always two ways to reach a minimum weight, strange. -->
($b$)
It actually seems like marking every other height level for deletion always works.  Ok yes, consider the following induction. Consider two scenarios, one we mark the root node for deletion the other we dont. Our invariance is that deleting every other level the weighted sum of remaining nodes will be the same.

Base Case : A tree with root $d_r$ and $n$ children $c_{1-n}$.  Deleting all the children has the same total score as deleting the root.

Inductive Step : Consider adding $n$ nodes to any child.  If the previous level was marked for deletion this will add $n$ points, one for each child to the total.  Otherwise if the previous level was active then all the children will be marked for deletion.  However the degree of the parent node changes by exactly $n$.  Meaning that the score will be the same.

We mark the root node for deletion.

<!-- Consider the following important fact : For every node $d$ with $n$ children, besides the root, the weight of $d = n + 1$, meaning that deleting $d$ is always beneficial. -->


($c$) It all boils down to a single choice of odd or ever. IE should we delete the root node or not? Using A DFS traversal we keep a summed record of the weights as we traverse down the tree. When we have processed the sums of all the children of a node.

When reach a leaf node  $l$ we need the weight of its parent and grandparent.  This allows us to determine the minimum weight at the localized extremities of the tree.
Consider the following either we delete the leaf node or we dont.  If we do delete the leaf node then we must keep the parent otherwise the constraint of the cover will be violated.

Using A DFS traversal we record the impact of every choice of a node. When we choose to remove a node it means that we must keep any other nodes connected to the deletee. This requires us to cascade down essentially a giant exclusive or expression.

We use a post process calculation where every sub tree returns two values.  The first number we call $R\_sum$ which represents the summed weight when that node is deleted. $L\_sum$ is the summed weight when we keep that node.

A Leaf node $l$ returns $[0, weight(l)]$.

Parent nodes are a little more complicated, $[L\_sum, min(weight(q_1) + L\_sum, weight(q_1) + R\_sum)]$.

For example consider a parent  $p$ node with $n$ leaf nodes.  There are two possibilties here. Either we delete the parent node or we delete all its children.  No matter which case we end up choosing, one of these two options will be optimal.  We take the total weight for each option and bubble both up to the parent of $p$.  This process is then repeated for parent nodes nof subtrees.

We store the two choices in an auxillary array of size $O(n)$.  Once we have traversed every node and are in the postprocess part of the root node, we make our final choice and and use that result to resolves all the stored options.  This results in a full traversal and then a resolution of choices for a total of $O(2n) = O(n)$.

**5.14**

A *vertex cover* of a graph $G = (V,E)$ is a subset of vertices $V' \in V$ such that every edge in $E$ contains at least one vertex from $V'$. Delete all the leaves from any depth-first search tree of $G$. Must the remaining vertices from a vertex cover of $G$? Give a proof or counterexample.

Consider the following for an *undirected* graph $G$, in order for a deletion of leaf nodes to form an invalid cover, two leaf nodes must be connected.  This means that if we can prove for any DFS step, no two leaf nodes are connected, then any case will be a valid cover.  Consider then two leaf nodes $l_1$ and $l_2$ from a DFS.  If $l_1$ was connected to $l_2$ by an undirected connection then $l_2$ could not be a leaf node, since if it was already discovered it would not be a leaf node, because it it connected to $l_1$.  We can make the same symmetric argument for $l_2$.

For *directed* graphs we cannot make this argument, and we can in fact show this is not true by a simple counter example.  Consider the graph $G$, composed of three verts $v_1$, $v_2$, $v_3$, and directed edges $(v_1, v_2)$, $(v_1, v_3)$, $(v_3, v_2)$, where the first component of the tuple is the base of the edge.  A DFS step starting at $v_1$ will first go to $v_2$ then stop.  Then it will traverse to $v_3$, realize that $v_2$ is already discovered and terminate.  Both $v_2$ and $v_3$ are leaf nodes, and since there is a directed edge $(v_3, v_2)$, the deletion cannot form a valid cover.

**5.15**

A *vertex cover* of a graph $G = (V, E)$ is a subset of vertices $V' \in V$ such that every edge in $E$ contains at least one vertex from $V'$. An *independent set* of graph $G = (v,E)$ is a subset of vertices $V' \in V$ such that no edge in $E$ contains both vertices from $V'$. An *indepedent vertex cover* is a subset of vertices that is both an independent set and a vertex cover of $G$.  Give an efficient algorithm for testing whether $G$ contains an independent vertex cover.  What classical graph problem does this reduce to?

Use a DFS search starting by setting an arbituary color on a node.  We traverse through the trre labeling every node we traverse with the color opposite of its parent.  When we reach a leaf node, if there are already connected nodes that are already discovered, then we check to see if the colors match up.  If they don't we know that it is impossible for the graph to meet the criteria.  This because by the *indepenent* requirement, we are effectively limited to two colors, which means it does not matter which color we start with.

The problem reduces to determing whether you can color a graph with two colors, also kwown as determing whether a graph is bipartite.

**5.16**

An *independent set* of an undirected graph $G = (V, E)$ is a set of verteices $U$ such that no edge in $E$ is incident on two vertices of $U$.

($a$) Give an efficient algorithm to find a maximum-size independent set if $G$ is a tree.

($b$) Let $G = (V,E)$ be a tree with weights associated with the vertices such that the weight of each vertex is equal to the degree fo that vertex.  Give an efficient algorithm to find a maximum independent set of $G$.

($c$) Let $G = (V, E)$ be a tree with arbitrary weights associated with the vertices.
Give and efficient algorithm to find a maximum independent set of $G$.

($a$) Consider the leaf nodes. We should keep ever leaf node in the set, remove all the parent nodes, then repeat for the now smaller tree.

($b$) Consider $n$ leaf nodes of a parent node.  The parent has a weight of $n + 1$ and each child leaf node has a weight of $1$.  In this case we want to keep the parent and remove all the children.  This also means we musk mark the parent of the parent node for deletion.  However since we are working from the bottom up, this will always be equal to or greater than alternative in terms of weight.

($c$) We know we will be able to keep at most one every other node(we can delete two adjacent nodes, and the node set will still be a valid *independent set*).  Very similiar to *5.13* we use a DFS with a post-process step and use either a storage array or a coloring to compare the sum of keeping children vs throwing them away.  In fact every question thus far was essentialy an inverse of $5.13$.


**5.17**

Consider the problem of determining whether a given undirected graph $G=(V,E)$ contains a *triangle* or cycle of length $3$.

($a$) Give an $O(|V|^3)$ to find a triangle if one exists.

($b$) Improve your algorithm to run in time $O(|V| \cdot |E|)$. You may assume $|V| \leq |E|$.

Observe that these bounds gives you time to convert between the adjacency matrix and adjacency list representations of $G$.

($a$) For every vert $v$ loop through all the connected vertices which are at most $V$.  For each of those vertices $v_2$ loop through all the connections of $v_2$ to find whether any of them are $v_1$.

($b$) For every vert $v_1$ allocate a storage buffer $A$ equal to the size of all immediatly connected vertices.  Then do a DFS from $v_1$ with a depth cap of 2. For each node at depth $2$ check to see if that node is in $A$. If it is then we have found a triangle cycle.  The running time $O(|V| \cdot |E|)$ since the DFS will never exceed $O(|E|)$.  * Note we have to reset this buffer per node. which ends up being potentially another $E$, but still reduces by $O(E) = O(2E)$.

**5.18**

Consider a set of movies $M_1, M_2, ... M_k$.  There is a set of customers, each one of which indicates the two movies they would like to see this weekend. Movies are shown on Saturday evening and Sunday evening. Multiple movies may be screened at the same time.  You must decide which movies should be televised on Saturday and which on Sunday, so that every customer gets to see the two movies they desire.  Is there a schedule where each movie is shown at most once? Design an efficient algorithm to find such a schedule if one exists.

There cannot always be an efficient schedule, consider the following tuples $(A, B)$ $(B, C)$ and $(A, C)$. There is no way to only show a movie once to satisfy this input.  This is an equivalent of a directed triangle.  The two movies each customer wants represent an edge of a graph.  This problem is very similiar to a coloring problem, where each color represents a slot that a movie could be in.  Conisder a DFS, mark a the inital node as starting on Saturday(Notice for any valid result we could swap the movies on saturday and sunday and the solution would still be valid).  We then mark every other node a different "color", this allows to determine whether we need to repeat a node or a valid conifguration exists.  This Traversal is $O(E + V)$ or $O(C + M)$, where $C$ is a customers tuple of preferred movies.

**5.19**

Consider a post order traversal that computes two values $a$ and $b$ per node $v$.  $a$ represents the max length of the subrtree of $v$.  $b$ represents the longest length path from a leaf node to $v$.  We start with leaf nodes where $a = b = 0$. Then for each parent node we compute the following, $a = \max(\max_1(a), \beta), b = max(b_n) + 1$.  Where $\beta$, is equal to the max of any child $b + 1$, or the two greatest pairs of a $b_1 + 1$ + $b_2 + 1$.We simply return $a$ on the root node.  Traversal is $O(V)$ calculating the maxs is never more than the children so does not change the complexity.  The storage is $O(H)$ where $H$ is the height of the tree.


<!-- SKIPPED 5.20 -->


**5.20**



**5.21**

Let $v$ and $w$ be two vertices in a directed graph $G = (V,E)$. Design a linear- time algorithm to find the number of different shortest paths (not necessarily vertex disjoint) between $v$ and $w$. Note: the edges in $G$ are unweighted.

Allocate an array of $n$ for a discovery.  Perform a breadth first traversal from both points in dual step. In each step traverse the next layer of nodes from $v$ then $w$. Whene a node is discoverd that has been already traversed, begin counting that node and all other nodes that have already been discovered in the initial node($v$ or $w$) of that step.  The algorith is linear because a node will at most be visited twice.


