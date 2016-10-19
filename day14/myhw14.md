# FOCS Fall 2016 Homework 14
Nora Mohamed
[x] internet helped

## I. Math

  A. 367n+1098     and     2n
    [n0 = 40; k=200]
  B. n^2 + 2n + 6    and     6n^2 - 25
    [n0 = 3; k = 200]
  C. n^3 + n^2 - 2n     and     6n^2 - 25
    [n0 = 3; k = 200]
  D. 869,438    and    923
    [n0 = -infinity; k = 941]
  E. 2^n    and    3^n
    [n0 = 0; k = 1]
  F. 3^n    and    2^n
    [n0 = 0; k = 4]
  G. log_2 n     and    log_10 n    [NB:  these are intended to be log-base-2 of n and log-base-10 of n]
    [n0 = 1; k = 4]
  H. log_10 n^2    and     log_2 n
    [n0 = 1; k = 4]

## II. Linear data structures

For the following problem, assume that it costs 1 unit to access a structure -- an item in an array, a field in a record you are holding, the first element in a linked list -- whether reading or writing that element.  [Accessing the second element in a linked list costs 2 units if you have a pointer to the list:  1 unit to access the first element/read its “next” pointer, and another unit to access the second element.]

Assume that you have n elements stored in an array and the same n elements stored in a linked list; you have no other references to these data structures.  You may assume that n > 10.  How much does it cost to perform each of the following actions?

  A. Read the value of the first element in the array?  In the list?
    1, 1
  B. Read the value of the seventh element in the array?  In the list?
    1, 7
  C. Add an element to the array?  [Where is the cheapest place to add it?]  To the list?  [Where is the cheapest place to add it?]
    1 (add to any index), 1 (add to current node)
  D. Delete the fifth element from the array?  From the list?
    1, 4 to get there and 1 to delete
  E. Confirm that a particular element -- say x -- is present in the array?  In the list?
    n, n --> need to iterate through entire list/array
  F. Confirm that a particular element -- say y -- is NOT present in the array?  In the list?
    n, n --> need to iterate through entire list/array
  Now assume that you can maintain one extra piece of storage for the data structure.  In the case of the array, you may want to maintain a length reference.
  In the case of the linked list, what would be similarly helpful?
    * I suppose a length reference? You aren't limited in length for a linked list like you are for an array. You could add the new node at any point in the list as well if you keep the data for nodes you've already iterated through.

  G. How much would it cost now to add an element to the end of the array?  To add an element to the end of the list?
    You'd need to make a new array if it didn't have any space, so n. Otherwise, 1. For a linked list, n since you'd need to iterate through it but when you're at the end, 1
  H. How much would it cost now to delete an element from the array?  From the list?  What if it were the final element?  The penultimate element?
    1, 1 if it's the first (since you can just return the rest of the list), 

Finally, assume that both the array and the linked list are sorted, i.e., that their elements are in some predictable order (say, comparable by < or <=).

  J. How much would it cost to confirm that a particular element -- say x -- is present in the array?  In the list?  To confirm that a particular element -- say y -- is not present in the array?  In the list?
    Binary search for the array (or something where you select some value in the middle, if it's larger look at the right side of array and vice versa, and so on). I think that's O(logn)? Something shorter than O(n). For a linked list it'd b O(n) since you have to search from start to finish.
    
    For it to not be present, the same as above.
