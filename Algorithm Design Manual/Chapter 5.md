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

Present correct and effcient algorithms to convert an undirected graph $G$ between the following graph data structures.  You must give the the time complexity of each algorithm, assuming $n$ vertices and $m$ edges.

($a$) Convert from an adjacency matrix to adjacency lists.

($b$) Convert from an adjacency list to an incidence matrix.  An incidence matrix $M$ has a row for each vertex and a column from each edge, such that $M[i, j] = 1$ if vertex $i$ is part of edge $j$, otherwise $M[i,j]=0$.

($c$) Convert from an incidence matrix to adjacency lists.

($a$) To convert from an adjacency matrix to adjacency list, we will need to scan each vertex row for every connection.  Unfortunately there is no other way to find every edge in an adjacency matrix.  For every cell that constitutes a valid edge, we create and append a item to the linked list corresponding to the row we are on. This algorithm is $O(n^2)$, and we cannot do any better.

($b$) To convert from an adjacency list to an incidence matrix, we first allocate a $2D$ array of $e \times v$, where $e$ is the number of edges and $v$ is the number of vertices. Then we traverse every vertex linked list, using the edge struct to write in every edge column.  We could use a jump table or an index for every vertex, to write the other related vertex in constant time.  This algorithm is $O(e)$, or $O(en)$ if we include the allocation of the $2D$ array.

($c$) To convert from an incidence matrix to an adjacency list we scan a column for every *edge*. Using a jump table we choose the first vert we ran into and append the edge to that vert's linked list, in constant time.  This algorithm is $O(en)$ and optimal in terms of $O$ notation, as there is a necessity to evaluate every cell (- a vert row, still $O(n)$, in the worse case, in order to determine what a connection actually is.

What is interesting is when $e << n$.

**5.9**