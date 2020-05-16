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

($a$) The words used in this question are extremely distraccting to someone who know what permutation means in a mathematical context. Consider an **Ordered List**.  Now consider how many possible ways there are to swap two elements.  Intuitively this should be close to $n^2$.  For every element we compare it to every other element so we have $n(n-1)$.  However for every element there will be an overlap, since swapping any element $a$ and $b$ is the same as swapping $b$ and $a$.  Since this applies to every possible swapping, we divide the entire result by $2$ giving us $n(n - 1)/2$.  The permutation that would cause $n(n - 1)/2$ inversions, is an array ordered backwards. Consider for any element, every other element would be out of order relative to that element.

($b$) The key is show that for every inversion in $P$ there must be a corresponding correct pair in $P^r$.  Consider an inversion in $P$ of elements $a$ and $b$. Since they form an inversion the order in which they appear must be wrong.  Since the entire order of $P^r$ is the reverse of $P$ this must correspond to a valid order of the two elmenets.  The same argument can be made from $P^r$, so this relationship must be an, if and only if, relationship.

($c$) Start with a randomly ordered permutaion. Now make an arbituary number of element flips, ranging from $0- \infin$.  We know that the total number of inversion after this process ranges from $0 - n(n - 1)/2$.  We now wish to show that  any swapping of two elements on a *random* permutation is equally likely to lower the number of inversions as it is to increase them.  Every inversion of a permutation increases the chance that a flip will correct an inversion. Likewise if a permutation has almost no inversions any swap has a high probability of increasing the number of inversions.  Since in ($b$) we proved there is an exact one to one relationship between the number ordered pairs and unordered pairs(*inversions*) of elmenets, we conclude that the expected average is exaclty half of the total possible inversions, namely $n(n - 1)/4$

**4-20**

Give an efficent algorithm to rearrange an array of $n$ keys so that all the negative keys precede all the nonegative keys. Your algorithm ust be in-place, meaning you cannot allocate another array to temporarily hold the items.  How fast is your algorithm?


Consider a single partition step from quicksort.  This is the same as the color problem except with two colors.  Simply partition the array based on an arbituary pivot element. If the pivot is positive consider all other positive numbers greater than the pivot.  If the pivot is negative consider all other negative numbers less than the pivot.  Clearly this has $O(n)$ running time.


**4-21**

Stable sorting algorithms leave equal-key items in the same relative order as in the original permutation. Explain what must be done to ensure that mergesort is a stable sorting algorithm.

The key of this question is to consider how mergesort's merge process resolves.  We guarantee stability by two conditiions.

First when we are merging two arrays we need to know which sub array was initially on the left side of the array.  Then when any two elements are equal we always write the one from the left array before the right one.

Secondly we require mergesort to merge only pairs of subarrays locally adjacent in memory(This is how the default implementation works anyway).  This is so that every merge has no gaps, which would break stability even with the above.

**4-22**

Show that $n$ positive integers in the range $1$ to $k$ can be sorted in $O(n \ log\  k)$ time. The interesting case is when $k << n$.

There are multiple ways to do this. One way would be to do this would be building a binary tree of size $k$. And adding a counter field to every node to handle equality.  We insert every item from $n$ into this tree in $log k$ time. Afterwards for every node in $k$ we use in order traversal to write out every item per counter.

Alternatively use the use the typical application of radix sort, or counting sort.

**4-23**

We seek to sort a sequence $S$ of $n$ integers with many duplications such that the number of distinct integers in $S$ is $O(log \ n)$. Give an $O(n \log \log n)$ worst-case time algorithm to sort such sequences. Consider the algorithm above that runs in $O( n \log k)$ time.  Since there are $O(log \ n)$ distinct integers we could set $k = \log n$.  This matches what the inteded time of the algorithm would be.  So again we construct a balanced binary tree of size $\log n= k$, and store a counter on every node.  The we pass over every item and we search and update the counter on that node.  At the end we make another n pass to write to the resulting array.

**4-24**

Let $A[1..n]$ be an array such that the first $n- \sqrt{n}$ elements are already sorted(though we know nothing about the remaining elements).  Give an algorithm that sorts $A$ in substantially better than $n \log n$ steps.  First we can use any sorting algorithm to sort the $\sqrt{n}$ section of the array. Next we need to merge the sorted array with first part, since there could be elements in  the unsorted $\sqrt{n}$ part of the array that belong in already sorted block of the array.  Using a merge subroutine from mergesort we sort the array.  That leaves us with a $O(\sqrt{n} \log \sqrt{n} + n)$ worse case running algorithm, where $\sqrt{n} \log \sqrt{n}$ is the sort, and $n$ the merge step. And of course $n$ dominates this expression leaving us with $O(n)$.

**4-25**

Assume that the array $A[1..n]$ only has numbers from $\{1,...,n^2\}$ but that at most $\log \log n$ of these numbers ever appear.  Devise an algorithm that sorts $A$ in substantially less time than $O(n \log n)$.

Again using a balanced binary tree with counters we can achieve $O(n \log \log \log n)$ worst case running time.

**4-26**
Consider the problem of sorting a sequence of $n$ $0$'s and $1$'s using the comparisons. For each comparison of two values $x$ and $y$, the algorithm learns which of $x < y$, $x = y$ or $x > y$ holds.

($a$) Give an algorithm to sort in $n-1$ comparisons in the worst case.  Show that your algorithm is optimal.

($b$) Give an algorithm to sort in $2n/3$ comparisons in the average case (assuming each of the $n$ inputs is $0$ or $1$ with equal probability). Show that your algorithm is optimal.

($a$) Compare every element with the first element then write the elements that are less than it to left, or the elements that greater to it to the right.  Since we are only dealing with binary numbers if one number is greater than the another, we know the greater number is $1$ and the lesser $0$. There is no way achieve less than $n-1$ comparisons in the worst case.  The reason for this is in the worst case every comparison we make is equal, so we know that either $1 = 1$ or $0 = 0$, but not both.  In this worse case scenario we would need to compare a element from the tie to a reference number to identify the number. So if we compare $n/2$ pairs of elements we will need to compare $n/2 - 1$ times to a reference number(The minus one comes from either the odd element out, our a number from an arbiturary pair).

($b$)  Take every two sequential pairs of numbers and compare them.  Since we are assuming that both $1$ and $0$ appear with equal probability, then there should be an equal probabiliy that the result of comparison of a pair is different, or the same.
For evey pair of numbers that are not the same we immediatly know which is which.
So on average after we compared every pair of numbers we have $n/2$ sorted numbers and $n/2$ unsorted numbers.  Since we know the remaining pairs are the same we compare an element from any pair to element in another pair tournament algorithm style.  We repeat this process until every group is compared.  Again applying average case logic, we formulate the total number of comparisons as$n/2 + n/8 + n/32 = n(1/2^1 + 1/2^3 + 1/2^4)$ which is bounded by $2n/3$, by the following geometric series $\sum_{n=0}^\infin 2^{-2 n - 1} = 2/3$ The is the optimal expected average, because we maxmize all possible information from a comparison, given the random distribution.  To do any better would imply that the array did not have a random distribution.


**4.27**

Let $P$ be a simple, but not necessarily convex polygon and $q$ and arbitrary point not necessarily in $P$.  Design an efficient algorithm to find a line segment originating from $q$ that intersects the maximum number of edges of $P$. In other words, if standing at point $q$, in what direction should you aim a gun so the bullet will go through the largest number of walls. A bullet through a vertex $P$ gets credit for only one wall.  An $O(n \log n)$ algorithm is possible.

<!-- First we need a mechanism to determine whether two segments can both be hit by a ray.  To do this we construct a triangle from $q$ and the two points of a line segment.  If any two triangles overlap then there is a ray from $q$ that intersects both segments.  This works with any number of segments, as long as all triangles overlap then there is ray from $q$ that intersects all of them.  Whether triangles overlap can be computed in constant time.

First a $O(n^)2$ algortihm compare  a segment traingle with every other seg-triangle, repeat for $O((n-1) + $(n-2) + (n-3) ...) = O(n)^2$.

Another attempt convert every point into polar coordinates. Build a binary tree based on the angle from $q$.  For every intersection find the nodes between, the angle coordinates of both ends of the segment, ie get a count of how many nodes are betweem the polar coordinates.  Then based on the line segment with the most points between them construct the ray by finding the smallest difference among angles in the. -->


Final answer : take the polar coordinate of every point with regard to $q$.  Sort these points by angle.  Then traversing counter clockwise match up nested pairs of points, by line segments. Think nested parenthesis pair counting.


**4.28**

In one of my research papers [Ski88], I discovered a comparison-based sorting algorithm that runs in $O(n \log(\sqrt{n}))$ Given the existence of an $\Omega(n \log n)$ lower bound for sorting, how can this be possible?

Using properties of logs, $n \log \sqrt{n} = n \log n^{1/2} = n (1/2) \log n$ and since $1/2$ is merely a constant then $O(n \log \sqrt{n}) = O(n \log n)$.

**4.29**

Mr. B. C. Dull claims to have developed a new data structure for priority queues that supports the operations Insert, Maximum, and Extract-Max—all in $O(1)$ worstcase time. Prove that he is mistaken. (Hint: the argument does not involve a lot of gory details—just think about what this would imply about the $\Theta(n \log n)$ lower bound for sorting.)

That would imply sorting in $O(n)$ time which is false since the lower bound of sorting is $O(n \log n)$.  The reason for this is we could call Maximum, and Extract-Max, for every item, sorting linearly.

**4.30**

A company database consists of $10,000$ sorted names, $40\%$ of whom are known as good customers and who together account for $60\%$ of the accesses to the database.  There are two data structure options to consider for representing the database:

* Put all the names in a single array and use binary search.
* Put the good customers in one array and the rest of them in a second array. Only if we do not find the query name on a binary search of the first array do we do a binary search of the second array.

Demonstrate whcih option gives better expected performance. Does this change if linear search on an unsorted array is used instead of binary search for both options?

The first option takes $\log 10,000$ time. The second option takes $\log 4,000$ for the good customers, and $\log 4,000 + \log 6,000$ for other customers.  The expected time for the first option is  $\log 10,000$, where as the expected time for the second option is $0.6(\log 4,000) + 0.4(\log 4,000 + \log 6,000) = \log 4,000 + 0.4(\log 6,000)$

The first option is better. The overhead of searching in two arrays will always be greater with the $60\%$ split.  Another way to think about it, logs grow continually slower, so splitting up inputs is like reseting that slow growth. For linear search we have the following $0.6(4,000) + 0.4(10,000) = 6400$ this has a better expected time that a straight $10000$ search.

**4.31**

Suppose you are given an array of $A$ of $n$ sorted numbers that has been *circularly shited* $k$ positions to the right.  For example, $\{35, 42, 5, 15, 27, 29\}$ is a sorted array that has been circularly shifted $k=2$ positions, while $\{27, 29, 35, 42, 5, 15\}$ has been shifted $k=4$ positions.
* Suppose you know what $k$ is. Give an $O(lg n)$ algorithm to find the largest numbers in $A.
* Suppose you *do not* know that $k$ is.  Give and $O(lg n)$ algorithm to find the largest number in $A$. For partial credit, you may give an $O(n)$ algorithm.


If $k$ is known then $A[mod((n-1)+k, n)]$ is the greates element which can be computed in constant time.

First we define a comparison test.  Compare two elements if the right one is less than the left one, we know that largest element must be between them.  We use this comparison to conduct a  binary search where we compare the first element to the middle element, then repeat as we recursively split the problem in half.

**4.32**

Consider the numerical $20$ Questions game. In this game, Player $1$ thinks of a number in the range $1$ to $n$.  Player $2$ has to figure out this number by asking the fewest number of true/false questions.  Assume that nobody cheats.

* ($a$) What is an optimal strategy if $n$ is known?
* ($b$) What is a good strategy is $n$ is not known?

($a$)  Split $n$ in half with every question.

($b$)  Use a oned sided binary doubling the size of the number, ie "Is the number less than 2", "less than 4", "less than 8".. and so on. Once a number that is less than is do a proper binary search between the last number and the first less than number.

**4.33**

Suppose that you are given a sorted sequence of *distinct* integers $\{a_, a_2, ..., a_n\}$.  Give an $O(\lg n)$ algorithm to determine whether there exists an $i$ index such as $a_i = i$.  For example, in $\{-10, -3, 3, 5, 7\}$, $a_3 = 3$.  In $\{2, 3, 4, 5, 6, 7\}$, there is no such $i$.

We can use a binary search like algorithm. Whenever we check a number at a index $i$ if that number is greater than $i$ we know that every item to the right of it cannot contain an element satisfying $a_i = i$. A consequance of a distinct sorted array is that evey subsequent element must be at least one greater than the previous element.  Likewise if an element $a_i$ we check is less than $i$ we know every element at an index less than $i$ cannot satisfy $a_i = i$.  With both of these facts we can effectively split the array in half, until we find a valid $a_i = i$ or show that none exists.  Where $n$ is unknown a one sided binary search works.

**4.34**

Suppose that you are given a sorted sequence of *distinct* integers $\{a_, a_2, ..., a_n\}$, drawn from $1$ to $m$ where $n < m$. Give an $O(\lg n)$ algorithm to find an integer $\leq m$ that is not present in $a$. For full credit, find the smallest such integer.

Building on **4.33** for an element at $a_i$ we can determine whether or not there is a gap to to the left of $a_i$.  If $a_i > i$ than there must be a number in $m$ not in $a$ less than $a_i$. The element $a_i$ can never be less than $i$ and if it is equal to $i$ then there is no gaps to the left.  We use this comparison to conduct a binary search for the smallest gap of in $m$.

**4.35**

Let $M$ be $n \times m$ integer matrix in which the entries of each row are sorted in increasing order (from left to right) and the entries in each column are in increasing order (from top to bottom).  Give an effcient algorithm to find the position of an integer $x$ in $M$, or to determine that $x$ is not there.  How many comparisons of $x$ with matrix entries does your algorithm use in worst case?

First we notice a key invariant property: every cell $c_{gh}$ is greater than the rectangle formed from all cells $c_{ij}$ where $i < g$ and $j < h$. We can use this to identify a rectangular region to cut the problem in half.

<!-- 
 The first cell we choose is $c_ij$, where $h = \lfloor mn/2 \rfloor$, $i = mod(h, n)$,  $j= \lfloor (h/n) \rfloor$. This cuts our problem in half.  However subsequent divisions are not so easy. In order to further divide the problem in half we need to find a cell that must be greater than half of the remaining squares.  This is the same of the first division but we must account for an uneven squares.  So then $h = \lfloor r/2 \rfloor$, $i = mod(h, n)$,  $j= \lfloor (h/n) \rfloor$

We define a subroutine *next_split_cell($ij, \ kl$)* which takes two pairs of indices for two cells and finds the intermediate splitting cell.

*next_split_cell($ij, \ kl$)* =\
{
    A[]
}


This gives us a worst case running time of $O(\log(nm))$.


$\lfloor a/n \rfloor$  -->

Finding the square that effectively cuts the problem in half is quit difficult. For a matrix where the first element is $c_{00}$.  We can cut the matrix in half by the following.

$$i = min(mod(a-1, n) + \left\lfloor \frac{a-1}{n} \right\rfloor, n-1)$$

and

$$j = \left\lfloor \frac{a-1}{n} \right\rfloor$$

where $a$ is half the number of cells.

After we sample this cell we may  divide this problem into smaller matrices, since for any subset matrix in $A$, the invarient property holds.  Sometimes this will divide the problem into an L shaped space of remaining squares.  We divide this further into two rectangular matrices.

```C++
std::pair<int,int> find_index_sub_matrix(int bottom, int top, int left, int right, int x)
{
    int n = ((top - bottom) + 1);
    int m = ((right - left) + 1);
    if (n == 1 && m == 1)
    {
        if (matrix[bottom][left] == x) return std::make_pair(bottom, left);
        else return std::make_pair(-1, -1);
    }
    if (n <= 0 || m <= 0) return std::make_pair(-1, -1);
    int sub_mat_size = n * m;
    int half = sub_mat_size / 2;
    int i = bottom + std::min<int> ( ((half - 1) % n) + (half - 1) / n, n - 1);
    int j = left + ((half - 1) / n);

    // index_offsets defining this sub matrix 
    if (matrix[i][j] == x) return std::make_pair(i, j);
    if (matrix[i][j] < x)
    {
        std::pair<int, int> pair = find_index_sub_matrix(bottom, top, j + 1,  right, x);
        if (pair.first > -1 && pair.second > -1)
        {
            return pair;
        }
        if (i < top)
        {
            return find_index_sub_matrix(i + 1, top, left, right, x);
        }
        return std::make_pair(-1, -1);
    }
    else
    {
        return find_index_sub_matrix(bottom, i, left, j, x);
    }
}
```

The code for this algorithm is messy but correct.
