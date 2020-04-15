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

