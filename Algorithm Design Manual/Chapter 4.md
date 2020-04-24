**4-1**

The Grinch is given the job of partitioning $2n$ players into two teams of $n$ players each.  Each player has a numerical rating that measures how good he/she is at the game.  He seeks to divide the players as *unfairly* as possible, so as to create the biggest possible talent imbalance between team $A$ and team $B$. Show how the Grinch can do the job in $O(n \ log \ n)$ time.

In order to satisfy the imbalance requirement we may think in terms of a sorted list split at the $1/2$ mark.  This reduces the problem to sorting the players by their respective ratings.  We may use any $(n \ log \ n)$ class sorting algorithm in order to solve the problem, for example heapsort.

**4-2**

For each of the following problems, give an algorithm that finds the desired numbers within the given amount of time.  To keep your answers brief, feel free to use algorithms from the book as subroutines.  For the example, $S =\{6, 13, 19, 3, 8\}$, $19-3$ maximizes the difference while $8-6$ minimizes the difference.\
$(a)$ Let $S$ be an *unsorted* array of $n$ integers. Give an algorithm that finds the pair $x, y \in S$ that *maximizes* $|x-y|$. Your algorithm must run in $O(n)$ worst-case time.\
$(b)$ Let $S$ be a *sorted* array of $n$ integers. Give an algorithnm that finds the pair $x, y \in S$ that *maximizes* $|x-y|$. Your algorithm must run in $O(1)$ worst-case time.\
$(c)$ Let $S$ be an *unsorted* array of $n$ integers.  Give an algorithm that finds the pair $x, y \in S$ that *minimizes* $|x-y|$, for $x \neq y$. Your algorithm must run in $O(n \ log \ n)$ worst-case time.\
$(d)$ Let $S$ be an *sorted* array of $n$ integers.  Give an algorithm that finds the pair $x, y \in S$ that *minimizes* $|x-y|$, for $x \neq y$. your algorithm must run in $O(n)$ worst-case time.

$(a)$ This is the same as finding the min and max elements, so consider a single pass that compares every element to a constant min or max.

$(b)$ Access the first and last element.

$(c)$ Order the list using a $O(n \ log \ n)$ algorithm, say heapsort, and then do a single $n$ pass over the data comparing the difference between each concurrent elements, returing the pair with the smallest distance.

$(d)$  Same as $(c)$ just cut out the sorting $O(n \ log \ n)$ time.

**4-3**

Take a sequence of $2n$ real numbers as input. Design an $O(n \ log \ n)$ algorithm that partitions the numbers into $n$ pairs, with the property that the partition minimizes the maximum sum of a pair.  For example, say we are given the numbers $(1,3,5,9)$. The possible partitions are $((1,3),(5,9))$, $((1,5),(3,9))$, and $((1,9), (3,5))$. The pair sums for these paritions are $(4,14)$, $(6,12)$, and $(10, 8)$. Thus the third partition has $10$ as its maximum sum, which is the minimum over the three partitions.

Sort the sequence and partition the pairs from either side of the array working in. So pair the min with the max, $(A[2n - 1], A[1])$, $(A[2n - 3], A[2])$, $...$ and so on. The question was in terms of $2n$ so we omit handling a middle entry for an odd numbered list.  The reason that this is the only correct way to construct the tuples is as follows:  Consider a case where we swapped any two pairings in the order defined above, then one of those pairs must be greater!(exlcuding an array with duplicate elements).

**4-4**

Assume that we are given $n$ pairs of items as input, where the first item is a number and the second item is one of three colors (red, blue, or yellow). Further assume that the items are sorted by number. Give an $O(n)$ alogrithm to sort the items by color (all reds before blues before all yellows) such that the numbers for identical colors stay sorted.

If we are allowed a work space, this is as simple as creating three arrays and making a single pass over the data copying each element we iterate over into its respective color array.  After that we make three passes no more than $n$, copying the three arrays in the color order specified.(Think bucket sort)

**4-5**

The mode of a *tuple* of numbers is the number that occurs most frequently in the tuple. The tuple $(4,6,2,4,3,1)$ has a mode of $4$. Give an efficient and correct algorithm to compute the mode of a tuple of $n$ numbers.

Sort the tuple as a list of numbers.  After the list is sorted do a single pass over the data keeping track of which element has the longest run.

**4-6**

Given two sets $S_1$ and $S_2$ (each of size *n*), and a number $x$, describe an $O(n \ log \ n)$ algorithm for finding whether there exists a pair of elements, one from $S_1$ and one from $S_2$, that add up to $x$. (For partial credit, give a $\Theta(n^2)$ algorithm for this problem.)

First sort both lists using a $O(n \ log \ n)$ sorting algorithm.  Then do a pass on one of the arrays.  For each element in the pass do a binary search on the other array for the number that will add together to get $x$. Since binary search is $O(log \ n)$ and we do this for every item this adds another $O(n \ log \ n)$ pass. This method is guranteed to find x to exist, since it searchs for a combination for all of the numbers in oner array.

**4-7**

Outline a reasonable method of solving each of the following problems.  Give the order of the worst-case complexity of your methods.

($a$) You are given a pile of thousands of telephone bills and thousands of checks sent in to pay the bills.  Find out who did not pay.

($b$) You are given a list containing the title, author, call number and publisher of all the books in a school library and another list of 30 publishers.  Find out how many of the books in the library were published by each company.

($c$) You are given all the book checkout cards used in the campus library during the past year, each of which contains the name of the person who took out the book.  Determine how many distinct people checked out at least one book.

($a$) Order the checks by name.  For every bill do a binary search on the checks to find whether that bill has been payed.

($b$)  First sort the books by publisher since the other fields dont matter for our goal.  After the sort do a pass over every record counting each book by publisher.  For each of run of books by a publisher we do a binary search on the publisher array, to see if its one of the input publishers.

($c$) Similiar to ($b$) order the cards by name, then increment a counter for every time the name changes, signaling a new run.

**4-8**
Given a set of $S$ containing $n$ real numbers, and a real number $x$.  We seek an algorithm to determine whether two elements of $S$ exist whose sum is exactly $x$.

($a$) Assume that $S$ in unsorted.  Give an $O(n \ log \ n)$ algorithm for the problem.

($b$) Assume that $S$ is sorted.  Give an $O(n)$ algorithm for the problem.

($a$) Sort the array, then use b.

($b$) We start on either side of the array and walk towards the center. So first we compare the $0$th element and the $n$th element. If the sum of those two numbers is greater than $x$, then we know that the higher number cannot be in **any** sum of $x$.  Alternatively if the sum of the two numbers is less than $x$ we know that the smaller element cannot be in **any**  sum of $x$.  For either case we increment the index in the direction of the center.  Since through the comparison we have eliminated one element from anh possibilty, we may regard the the second highest(or lowest) number as the new max(min).  Since we elimate one number every time this operations is $n$ time.  If the sum of any two numbers equal $x$ we return those two numbers.

**4-9**

Give an efficient algorithm to compute the union of sets $A$ and $B$, where $n = max(|A,|B|)$. The output should be an array of distinct elements that form the union of the sets, such that they appear more than once in the union.

($a$) Assume that $A$ and $B$ are unsorted. Give an $O(n \ log \ n)$ algorithm for the problem.

($b$) Assume that $A$ and $B$ are sorted. Give an $O(n)$ algorithm for the problem.

($a$) Sort one of the sets.  Iterate over each item in the unsorted set, use a binary search on the sorted set to determine whether the item from the unsorted set is in the sorted. If it is only in the unsorted store set it in an $n$ length storage array.  After every item has been tested append all of the items in the workspace array to the
sorted array.

($b$)  Create a workspace of size $2N$. Iterate in ascending order up both arrays.  We use the two finger walking algorithm to compare elments until an element is different. We iterate on the side that is less than the current index on the other array. This way we walk up both arrays sequantially and avoid writing duplicates.

**4-10**

Given a set $S$ of $n$ integers and an integer $T$, give an $O(n^{k-1}log \ n)$ algorithm to test whether $k$ of the integers in $S$ add up to $T$.

Sort $S$ with any $O(n \ log \ n)$ algorithm.  Then for every permutation of $n^{k-1}$ we do a binary search.  To picture this better imagine we choose a number, we then iterate through every other number. We repeat this $k-1$ times.  Then we do a binary search for the number that completes the sum of the numbers chosen.  This way we consider every possible case that could add up to $T$.

**4-11**

Design an $O(n)$ algorithm that, given a list of $n$ elements, finds all the elements that appear more than $n/2$ times in the list.  *Then,* design an $O(n)$ algorithm that,
given a list of $n$ elements, finds all the elements that appear more than $n/4$ times.

The questions states a number that appears **more** than $n/2$ times in a list.  That means there can only be at most one number.  Consider **any** partition of pairs of two numbers.  There must be at least one pair of numbers that meet the criteria if they exist.  The question to ask is there a constant number of partitions that will identify whether a number? Yes Indeed!  Remove any two pairs of numbers that are different. if we do this recursively we will narrow down the answer.

Tetris.   GeeksForGeeks had solution for n/k.

<!--  -->

**4-12**

Devise an algorithm for finding the $k$ smallest elements of an unsorted set of $n$ integers in $O(n + k \ log \ n)$.

Construct an min-heap in $n$ time.  Then look at the root in constant time and remove the root and reorder in $O(log \ n)$ time.

**4-13**

You wish to store a set of $n$ numbers in either a max-heap or sorted array.  For each applications below, state which data structure is better, or if it does not matter.  Exmplain your answers.\
($a$) Want to find maximum element quickly.\
($b$) Want to be able to delete an element quickly.\
($c$) Want to be able to form the structure quickly.\
($d$) Want to find the minimum element quickly.\

($a$) Either, works since each is a constant time operation to look up the max element.\
($b$) Heap, since we can swap the element with the last item in the array and correct the heap in $log \ n$ time, an array require shifting up to $O(n)$ elements.\
($c$) Heap, since the construction is in $n$ time, verses the lowerbound of $n \ log \ n$ sorting.\
($d$) Sorted srray, since the heap we are considering is a *max*-heap, we cannot gurantee a constant time look like we can with a sorted array.

**4-14**

Give an $O(n \ log \ k)$-time algorithm that merges $k$ sorted lists with a total of $n$ elements into one sorted list.  (Hint use a heap to speed up the elementry $O(kn)$-time algorithm).

(Assume ascending order of sorted array)
We know that for a heap insertion is $O(log \ n)$(in this case $k$ dictates the size of our heap).  We take the first item of every array and insert it into a min-heap. We then take the min value of the heap and write it to our result array of $O(n)$ space.  After we take the min out of the heap we insert the next item from the array where the min element was orignally from.  We need some sort of mechanism to know which item came from which of the $k$ arrays.  We can accomplish by wrappping each record in the heap with a struct, with a field indexing into $k$.  This creates an additional $O(k)$ space. Thus we are mantaining a heap with one item from every sorted array.  Since we are returning the min element of the heap which always has the least elements of every sorted array, the correctness of order is guaranteed. We only intialize our heap once, with time complexity of $O(k)$, which will quickly be dominated by $log k$ insertions by $n$.  If any of the sorted arrays runs out of numbers before the others, we simply call min again and proceed as if $k$ was one less.

**4-15**

($a$) Give an efficient algorithm to find the second-largest key among $n$ keys. You can do better than $2n - 3$ comparisons.\
($b$) Then give an efficient algorithm to find the third-largest key amoung $n$ keys. How many key comparisons does your algorithm do in the worst case? Must your algorithm determine which key is largest and second-largest in the process.

<!-- First attempt, and fail -->
<!-- ($a$) Store two constant numbers set the maximum number to the first element.  Iterate through the array and compare every element to the stored maximum.  If a number is greater than the stored maximum, set the second stored number to the maximum, and the maxium to the greater number.\
($b$) Same as above execpt with three constant stored values, shifting down. for a single pass. Yes indeed.\
***NOTE** For both algorithms at the very begining when the second and third items are unset, if an item is less than the max set it to the third or second stored number. -->

<!-- The trivial 'scan and compare' approach is by far the most likely approach that any real piece of software is likely to use. Its average compare count on random data is going to be similar to that of heapify, but without the complex logic and nested loops. Further, it won't have to reorder the data or keep additional storage around. It also has excellent cache locality. -->

($a$) Using the tournament algorithm we compare pairs of two elements and discard the smaller number.  We repeat this process recursively with all the winners.  This is similiar to how we construct a heap.  This gives us $n+log(n)$ time with $n + lg \ n \ – \ 2$ comparisons.\
($b$) We use the same above and choose the third highest loser. Yes, though not explicitly.

**4-16**

Use the partitionin idea of quicksort to give an algorithm that finds the *median* element of an array of $n$ integers in expected $O(n)$ time. (Hint must you look at both sides of the partition?)

Start the partition process around an arbituary element $x$. Once the partion process is complete we partition the side with more elements. We continue this untill we have reached the element we wish to find.  This algorithm has an expected average running time of $O(n)$ time (derived from $O(n) + O(n/2) + O(n/4) = O(2n)$).  Its worst case however is still $n^2$.

**4-17**

The medain of a set of $n$ values is the $\lceil n/2 \rceil$th smallets value.\
($a$) Supose quicksort always pivoted on the median of the current sub-array. How many comparisons would Quicksort make then in the worst case?\
($b$) Suppose quicksort were always to pivot on the $\lceil n/3 \rceil$th smallest value of the current sub-array.  How many comparisons would be made then in the worst case?

($a$) The sequence of $n + \frac{n}{2} + \frac{n}{2} + \frac{n}{4} +\frac{n}{4} + \frac{n}{4} + \frac{n}{4}  + \frac{n}{8} + \frac{n}{8}...$ converges to $(n \ \lceil lg \rceil \ n)$.  This can be seen visually by drawing out a tree for the Divide-and-Conquer Recurrences. with $T(n) = T(n/2) + T(n/2)$. So therefore there are $n \ log \ n$ comparisons.\
($b$) Consider the following recurrence relationship = $T(n) = T(n/3) + T(2n/3)$.  Every level of this tree has work $\leq n$.  The height of the tree is  ($log_3 \ 2n$). This implies that the total comparisons will be less than or equal to $n \ log_3 \ 2n$.  It should be noted that any fraction we choose will result in logarithmic time abliet a different base.

**4-18**
<!-- Not rigorous proved, very sure this work -->
Suppose an array $A$ consists of $n$ elements, each of which is *red*, *white* or *blue*.  We seek to sort the elements so that all the *reds* come before all the *whites*, which come before the *blues*.  The only operations permitted on the keys are
* *Examine($A, i$)* - report the color of the $i$th element of $A$.
* *Swap($A, i, j$)* - swap the $i$th element of $A$ with the $j$th element.

Find a correct and effcient algorithm for red-white-blue sorting. There is a linear-time solution.

Yes this can be done using partitioning as in quicksort. Pick a random element and partition with the rule $red < white < blue$.  That way after every partition we know that there is entire ordered color to one side of the partition. In total we do this twice array will be sorted.

This requires a trick, depending of the color of the pivot element we consider elements of that element less than or greater than that element. For example we always presumse for a red pivot all red items are less than red.  For a blue pivot we treat blue items as if they are always greater than the pivot.  If the pivot is white and we are on the first partition we presume other white elements are less than the pivot.  Other wise if we are the second partition then treat white elements as greater than partition.

Here is an example of how this would work.  We start with a pivot of white. After the partition all the reds are past the pivot.  We then partition the pivot and everything less than it.  Say on the second partition we happen to also choose white. We then split the blues from the whites and we are done.

**4-19**

An *inversion* of a permutation is a pair of elements that are out of order.

* ($a$) Show that a permutation of $n$ items has at most $n(n - 1)/2$ inversions. Which permutation(s) have exactly $n(n-1)/2$ inversions?

* ($b$) Let $P$ be a permutation and $P^r$ be the reversal of this permutation.  Show that $P$ and $P^r$ have a total of exactly $n(n-1)/2$ inversions.

* ($c$) Use the previous result to argue that the expected number inversions in a random permutation is $n(n - 1)/4$

($a$) The words used in this question are extremely distraccting to someone who know what permutation means in a mathematical context. Consider an **Ordered List**.  Now consider how many possible ways there are to swap two elements.  Intuitively this should be close to $n^2$.  For every element we compare it to every other element so we have $n(n-1)$.  However for every element there will be an overlap, since swapping any element $a$ and $b$ is the same permutation as swapping $b$ and $a$.  So we divide the entire result by $2$ giving us $n(n - 1)/2$.

**4-20**

Give an efficent algorithm to rearrange an array of $n$ keys so that all the negative keys precede all the nonegative keys. Your algorithm ust be in-place, meaning you cannot allocate another array to temporarily hold the items.  How fast is your algorithm?

