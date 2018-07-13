---
layout: post
title: 
categories: [algorithms, C++]
keywords:
external-url: https://dotkay.github.io/2017/09/30/array-query-sum
---

Let us discuss an interesting algorithm problem - finding sub-array sums in an array. 

> Given an array `a` and a set of queries `q` indicating ranges in an array, say sub-array indicies, how to compute the sum of the sub-array elements in the ranges specified in the query.

In this post, we will discuss a very straightforward solution that traverses the array and the set of queries and computes the sum of each of the sub-arrays specified by the query bounds.

A query is just modelled as a `struct` specifying the left and right sub-array bounds by integers `L` and `R`. For example, `{3, 5}` would mean *sum the elements in the indicies 3, 4, 5 - i.e. a[3] + a[4] + a[5]* 

{% highlight cpp %}
struct Query {
  int L, R;
};
{% endhighlight %}

Now, let us walk through the queries one by one, and for each query, we shall traverse the array and pick up the elements in the indices specified by the query and sum them up. We initialize an accumulator `sum` and keep updating it for this purpose. Again, `a` is the input array of size `n`, and `q` is an array of queries and there are `m` queries in all.

{% highlight cpp %}

{% endhighlight %}
// walk through the queries one by one and 
// get the query bounds
// Complexity: O(m)
for (int i=0; i < m; i++) {
  int L = q[i].L, R = q[i].R;
  // accumulator to collect the sum
  int sum = 0;
  // traverse the array and sum up the elements
  // within the query bounds
  // Complexity: O(n)
  for (int j=L; j<=R; j++) {
    sum += a[j];
  }
}
// Total Complexity: O(nm)
{% highlight cpp %}

As you can see we have two loops - one within another and hence the total complexity is *O(mn)*. How can we make this naïve algorithm better? What do we look for? Hint: If I have queries one of which is a subset of another, we would end up computing the sum twice. For example, if two of our queries are `{0,4}` and `{1,3}`, by walking through all the queries and traversing the array for each query as above, we are not utilizing the fact that we could reuse the sub-array sum within `{1,3}` in the query `{0,4}` instead of recomputing them independently.
