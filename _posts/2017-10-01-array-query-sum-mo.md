---
layout: post
title: 
categories: [algorithms, C++]
keywords:
external-url: https://dotkay.github.io/2017/10/01/array-query-sum-mo
---

In the [previous post](https://dotkay.github.io/2017/09/30/array-query-sum/), we saw the naïve way of computing sub-array sums, given a set of queries. Now, following the hint provided in the previous post, let us try to think what would make it better.

First, let us try to understand it with an example. If we had an inpur array `a` and three queries of the form `{0, 3}`, `{4, 8}` and `{0, 8}`, we were independently computing `a[0] + a[1] + a[2] + a[3]`, `a[4] + a[5] + a[6] + a[7]` and `a[0] + a[1] + a[2] + a[3] + a[4] + a[5] + a[6] + a[7] + a[8]`. Although the sub-array sums we computed for the first two queries `{0, 3}` and `{4, 8}` could have just been reused instead of computing the sum all over again. Even in the case where the third query was of the form `{0, 10}` we could have used the results computed for the queries `{0, 3}` and `{4, 8}`. This also means that we need to compute the queries `{0, 3}` and `{4, 8}` so that we could reuse them for `{0, 8}` - i.e., if we computed `{0, 8}` first, we already lost the advantage. Which means that we need to order our queries in such a way that we compute the queries that have the potential to be reused before computing the other queries - in the above example `{0, 3}` and `{4, 8}`.

The ordering of queries themselves could be done in several ways. In this post, we shall look at one Mo's algorithm that buckets the queries into a number of buckets which are a function of the size of the input array. If the input array is of size `n`, we put all the queries whose left index (`L`) ranges from 0 ... \sqrt(n) -1 in the first bucket, (\sqrt n) ... (2 * \sqrt(n) - 1), and so on. Within each bucket, we shall order the queries in increasing order of the right indices - the queries' `R` values.

{% highlight cpp %}
// a, b : two Queries to be compared in order to sort
bool compare(Query a, Query b) {
  // first, sort by L if they are in different buckets
  if (a.L/bucket != b.L/bucket)
    return a.L/bucket < b.L/bucket;
  // within the same bucket, queries are sorted
  // according to R values
  return a.R < b.R;
}
{% endhighlight %}

Now, we need to adjust for over-lapping ranges in the queries. For example, if the previous (already computed) query was `{2, 5}` and the query that is currently being worked upon is `{4, 7}` then we need to discount `a[2]` and `a[3]` from the already computed sum (for `{2, 5}`) and also add `a[6]` and `a[7]` to it.

Very similarly, we may have to remove elements from the right as well (i.e. tracking the `R` indices). For example, if the previous range was `{0, 5}` and the current range `{2, 3}`, we need to discount `a[4]` and `a[5]` from the previous sum, as well (besides `a[0]` and `a[1]` which were taken care when we were handling L (previous paragraph)).

{% highlight cpp %}
// initialize the current L and R values
int currL = 0, currR = 0;
// initialize an accumulator for the sum
int curr_sum = 0;

// iterate over the queries
for (int i=0; i<m; i++) {
  int L = q[i].L, R = q[i].R;

  // taking care of L
  // taking care of discarding
  // sub-parts from the sum
  while (currL < L) {
    curr_sum -= a[currL];
    currL++;
  }
  // taking care of adding 
  // sub-parts to the sum
  while (currL > L) {
    curr_sum += a[currL];
    currL--;
  }

  // taking care of R
  // adding elements to R
  while (currR <= R) {
    curr_sum += a[currR];
    currR++;
  }
  // discounting elements
  while (currR > R+1) {
    curr_sum -= a[currR - 1];
    currR--;
  }
}
{% endhighlight %}

Let us run this on an example. Let us assume we are provided with an input array `a` which is `{ 1 2 3 1 1 2 4 1 3 4 2 1 2 3 4 1 1 3 4 2 3 2 1 2 3 }` of size 25 (`n`) and the following 8 (`m`) queries `(2,4) (1,7) (0,8) (5,8) (10,15) (12,16) (17,20) (18,21)`. Now, since `n` is 25, we need to put the queries with L values in the range 0 ... \sqrt(n) -1 in the first bucket and so on. The first bucket, for example, would initially (arranged according to L values from 0..\sqrt(25) - 1), i.e. 0..4, will have the queries `(0, 8) (2, 4) (1, 7)` and then re-ordered as per their `R` values to `(2, 4) (1, 7) (0, 8)`. The other buckets are second: `(5,8)`, third: `(10, 15) (12, 16)`, fourth: `(17, 20) (18, 21)`.

Take some time to work through it. It would be worth the time to enhance the understanding. 