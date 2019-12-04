---
layout: post
title: Climbing stairs recursively
categories: [algorithms, recursion, C++]
keywords: [recursion, algorithms, C++]
external-url: https://dotkay.github.io/2018/05/05/climbing-stairs-recursively
---

> How many different ways can you reach atop a fleet of *n* step stairs taking one or two step jumps at a time?

This question might ring a bell for some who have heard about an Italian mathematician who computed a similar sequence for counting rabbits in his garden. Let us think about it using a smaller example and generalize the solution. Let us say we have only 2 steps to climb. Given the constraints (1 step or 2 step climbs only), we can complete 2 steps in the following ways:

1. 1 step, 1 step
2. 2 steps

2 possible ways. How about 3 steps? 

1. 1 step, 1 step, 1 step
2. 1 step, 2 steps
3. 2 steps, 1 step

<br>
![3 steps](/assets/images/algorithms/cpp/three_steps.png){:class="img=responsive"}

So, 3 possible ways. What about if we have an additional one to climb (i.e. total of 4 steps to climb)? We can do it in the following ways:

1. 1 step, 1 step, 1 step, 1 step
2. 1 step, 2 steps, 1 step
3. 1 step, 1 step, 2 steps
4. 2 steps, 1 step, 1 step
5. 2 steps, 2 steps

<br>
![4 steps](/assets/images/algorithms/cpp/four_steps.png){:class="img=responsive"}

We also notice that the number of ways of climbing 4 steps is the number of ways of climbing 2 steps + the number of ways we could climb 3 steps. Recursively, we could compute for any *n* steps, given the constraints, we could climb it by computing the number of ways of climbing *n-1* and *n-2* steps.

{% highlight cpp %}
int stairs(int n)
{
  // base cases
  if (n <= 2)
    return n;

  int res = stairs(n-1) + stairs(n-2);
  return res;
}
{% endhighlight %}




