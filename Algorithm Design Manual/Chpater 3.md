3-10

In the *bin-packing problem*, we are given $n$ metal objects, each weighing between zero and one kilogram. Our goal is to find the smallest number of bins that will
hold the $n$ objects, with each bin holding one kilogram at most.

* The *best-fit heuristic* for bin packing is as follows.  Consider the objects in the order in which they are given.  For each object, place it into the partially filled bin with the smallest amount of extra room *after* the object is inserted. If no such bin exists, start a new bin.  Design an algorithm that implements the best-fit hueristic (taking as input the $n$ weights $w_1, w_2, ..., w_n$ and outputting the number of bins used) in $O(n \ log \ n)$ time.

* Repeat the above using the *worst-fit heuristic,* where we put the next object in the partially fileld bin with the largest amount of extra room *after* the object is inserted.

We use a balanced binary tree supporting *insert*, *search* and *delete* of $O(log \ n)$.
Each node on the tree will represent a bin.  We count each new insertion on the tree and return that value at the end of the function. The values stored on each node will represent the room left in that particular bin in kilograms.  This allows us search the tree by a particular weight and find the fullest node with room left to fit the item.  Once we have found this node, we then update the remaining value in the bin and 
reinsert so that the order of the tree is maintained.  From a high level view we can think of these operations as a *search*, *delete* and then *insert*.  This has a worst case time complexity of $O(3log \ n) = O(log \ n)$.  In the guts of implementation this is closer $O(2log \ n) = O(log \ n)$ since the search and delete operations are essentially being combined.  If no bin exists we insert a new node into tree and update the weight value, which adds another $O(log \ n)$ pass. 

The *worst-fit heuristic* is the same as the *best-fit heuristic* in implementaion execpt in initial traversal.  We instead traverse leftwards to find the emptiest bin.


\
3-11
Suppose that we are given a squence of $n$ values $x_1, x_2, .., x_n$ and seek to quickly answer repeated queries of the from: given $i$ and $j$, find the smallest value in $x_i,...,x_j$.

* ($a$) Design a data structure that uses $O(n^2)$ space and answers queries in $O(1)$ time.
* ($b$) Design a data structure that uses $O(n)$ space and answers queries in $O(log \ n)$ time. For partial credit, your data structure can use $O(n \ log \ n)$ space and have $O(log \ n)$ query time.

($a$)  Create a grid where the coordiantes are the input of $i$ and $j$ and the value of the cell is the smallest number between $i$ and $j$. In other we words we create a two dimensional array and access the values directly.  This requires a preporcessing phase to create the grid, but since $n$ is static relative to the queries on $i$ and $j$ this is not an issue.

($a$)
