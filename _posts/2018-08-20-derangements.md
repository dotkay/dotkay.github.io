---
layout: post
title: Sharing toys happily
categories: [algorithms, C++, recursion]
keywords: C++, algorithms, recursion
external-url: https://dotkay.github.io/2018/08/20/derangements
---

Suppose you are incharge of a bunch of school kids and you have some expensive hi-tech toys, as many toys as the number of kids, from a sponsoring company that you are to ask the kids to share among themselves. The toys are all different and are sophisticated to different extent. You want each kid to have the toy for a day to play with. And you want to make sure no kid gets the chance to play with the toy the second time. How many possible ways can the toys be distributed?

Let's formalize it a little more. Suppose there are *n* kids - *k_1, k_2, ..., k_n* and so *n* toys - `1, 2, ..., n`. The first day is easy - you distribute toy *i* to kid *k_i*. From the second day, you need to make sure *k_i* does not get *i* again for the next *n* days. If *k_1* gets toy `2`, the problem is now reduced to *n-1* kids and *n-1* toys - i.e. one has to compute the number of ways in which you can distribute the toys `1, 3, ..., n` to kids *k_2, k_3, ..., k_n*. i.e. each kid gets the toy that they haven't yet played with (`n-1` possibilities). There can be this possibility as well: *k_1* gets some toy *j* and *k_j* gets toy `1` (essentially, *k_1* and *k_j* have swapped their toys), then our problem is now reduced to *n-2* kids and *n-2* toys.

We see that the computation of the two cases are identical - one with `n-1` toys and the other with `n-2` toys. Another thing to note is that when *k_1* is given toy `j` the first day, for the second day, there are `n-1` possible ways to distribute `n-1` toys to *k_1*, and so on. It is a recursive computation. The base case is when there are two kids and two toys (they just swap their toys the second day - so just one possible outcome), and when there are one kid and one toy (you just let the kid play with the one available toy for one day - so not much computation for second day and so second day has 0 possible outcomes).

{% highlight cpp %}
int ways_r(int n)
{
  // base case
  if (n == 1 || n == 2)
    return n-1;
  
  return (n-1) * (ways_r(n - 1) + ways_r(n - 2)); 
}
{% endhighlight %}

Since we are computing the intermediate (sub-problems) over and over again, we can remember the intermediate results and make it more efficient. Let's see how to do it in a future post.