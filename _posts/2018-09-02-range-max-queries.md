---
layout: post
title: Counting cokes for a different reward ...
categories: [algorithms, data structures, C++]
keywords: C++, data structures, algorithms
external-url: https://dotkay.github.io/2018/09/02/range-max-queries
---

In a [previous post](https://dotkay.github.io/2018/02/01/cumulative-freq) we looked at the problem of counting coke cans dispensed for marketing rewards. Now, the new marketing manager is more detail oriented. He noticed that some shops have only one or a couple of coke vending machines while larger restaurants and offices have dozens of them. He wants to see which machine number dispenses the maximum number of coke cans from a range of machine numbers. And he has decided to index each establishment (restaurant or office complex) with just a single machine number. How would one go about computing the maxinum number of coke cans dispensed among a range of machines?

The solution, from our previous effort in solving a similar problem, is straight forward - we can maintain an array and compute the max value among a given range of indices.

{% highlight cpp %}
int RMQ::rmq(int end)
{
  int max = rarr[0];
  for (int k = 0; k < end; k++)
  {
    max = std::max(max, rarr[k]);
  }
  return max;
}

int RMQ::rmq(int begin, int end)
{
  int max = rarr[begin];
  for (int k = begin; k < end; k++)
  {
    max = std::max(max, rarr[k]);
  }
  return max;
}
{% endhighlight %}

But what happens when we have millions of such queries - as different advertisers might be querying our database to send various kinds of offers? Do we have to traverse the range every time, in order to compute the max value? Or can we do better? 