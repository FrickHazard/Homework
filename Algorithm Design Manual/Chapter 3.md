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

($a$)  Create a grid where the coordiantes are the input of $i$ and $j$ and the value of the cell is the smallest number between $x_i$ and $x_j$. In other we words we create a two dimensional array and access the values directly.  This requires a preporcessing phase to create the grid, but since $n$ is static relative to the queries on $i$ and $j$ this is not an issue.

($b$) Skip!

3-12 Suppose you are given an input set $S$ of $n$ numbers and a black box that if given any sequence of real numbers and an integer $k$ instantly and correctly answers whether there is a subset of input sequence whose sum is exactly $k$. Show how to use the black box $O(n)$ times to find a subset of $S$ that adds up to $k$.

Call the black box on the sequence of all items but one.  If it fails keep the removed element, otherwise discard it and repeat.  This allows us after a single pass, via removing one element at a time to find a subset that adds up to $k$. (Note this only finds us a valid subset and not all of them.)


3-13 Let $a[1..n]$ be an array of real numbers. Design an algorithm to perform any sequence of the following operations.

* $Add(i,y)$ - Add the value $y$ to the $i$th number.
* $Partial$-$sum(i)$ - Return the sum of the first $i$ numbers, i.e. $\sum^{i}_{j=1}A[j]$.

There are no insertions or deletions; the only change is to the values of the numbers.  Each operation should take $O(log \ n)$ steps. You may use one additional array of size $n$ as a work space.

Create a balanced binary tree ordered by index.  On each node store the sum of all its left children.  On $Add$, traverse the tree updating the sum on every left traversal.  On $Partial$-$sum$ traverse to the specified node and add up the stored sum on every node that was traversed.

3-14 Extend the data structure of the previous problem to support insertions and
deletions. Each element now has both a key and a value. An element is accessed
by its key. The addition operation is applied to the values, but the elements are
accessed by its key. The Partial sum operation is different.

* $Add(k,y)$ – Add the value $y$ to the item with key $k$.
* $Insert(k,y)$ – Insert a new item with key $k$ and value $y$.
* $Delete(k)$ – Delete the item with key $k$.
* $Partial$-$sum(k)$ – Return the sum of all the elements currently in the set whose
key is less than $y$, i.e. $\sum_{x_j<y} x_i$.

The worst case running time should still be $O(n \ log \ n)$ for any sequence of $O(n)$
operations.

\
Similiar to above with the following differences
* Order binary tree by key instead of index.
* On a Deletion, after traversal we have to update nodes thankfully in constant time.
* On insertion is similiar to add with constant time swapping of sums and pointers after traversal.  I believe the reason "$O(n \ log \ n)$ for any sequence of $O(n)$
operations." is mentioned is due to potential balancing occuring during insertion.
Not sure exactly how that would look. 
 
3-15