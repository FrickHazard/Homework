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