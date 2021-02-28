---
layout: post
title: Sharing toys again
categories: [algorithms, C++, dynamic programming]
keywords: C++, algorithms, dynamic programming
external-url: https://dotkay.github.io/2018/08/24/derangements_dp
---

In a [previous post](https://dotkay.github.io/2018/08/20/derangements) we saw how to compute the number if ways in which a bunch of toys can be rotated among as many number of kids without repetition. We also saw that we were computing intermediate problems over an over again, instead of remembering the computed value and reusing it (i.e. dynamic programming). Let us try it now.

We will first create a container to store and remember the results of intermediate computations as and when we perform them - in our case just a one dimensional array that stores how many ways we can distribute *n* toys among *n* kids. We can populate our container with the base cases (case of one kid and one toy and two kids and two toys).

{% highlight cpp %}
int ways[n+1];

// base case
ways[1] = 0;
ways[2] = 1;
{% endhighlight %}

Now, we iterate through the remaining number of toys, upto *n* and do the computation by reusing computed values instead of recursively calling the function to compute.

{% highlight cpp %}
int ways_dp(int n)
{
  int ways[n+1];

  // base case
  ways[1] = 0;
  ways[2] = 1;

  for (int i = 3; i <= n; i++)
    ways[i] = (i-1) * (ways[i-1] + ways[i-2]);
  
  return ways[n];
}
{% endhighlight %}

It is as simple as that.