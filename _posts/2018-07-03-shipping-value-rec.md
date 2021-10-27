---
layout: post
title: Making value from shipping products
categories: [algorithms, recursion, knapsack, C++]
keywords: [recursion, algorithms, knapsack, C++]
external-url: https://dotkay.github.io/2018/07/03/shipping-value-rec
---

Suppose you own a few small boats and are making money shipping goods between UK and continental Europe. Your boats are small and they have limited capacity. You have your busy days once in a while but almost always you need to choose the products so that you can create maximum value. Your fee is not based on the weight of the products rather on the value of the products that you ship. 

Brexit vote happened and all of a sudden you get requests for shipping products that you have never shipped before. You are not sure how to decide which products to ship. Given a bunch of products like fish, cheese, expensive wine, Louis Vuitton bags, etc. along with their weight and their value, you want to decide how many of each item to include in order to get maximum value. Remember that you have small boats which have limited carrying capacity. 

Several years ago, you got a CS degree and you think it might come to use now. You decide to write a program in order to figure out maximum value that you could obtain. All good. You pick up your chromebook and start framing the problem. You have a list of items - their weights and values. You know the capacity of your boat (you do it for one boat at a time, as if one boat is in France, one is in UK and the third is in Amsterdam). 

```
a list w: weights of items
a list v: corresponding value of the items
threshold: capacity of your boat
```
Now, you can include the item to be carried in your boat or exclude it and tell the merchant to wait for the next trip or find another shipping agency. For an item `i`, once you decide to include it, your value would increase by `v[i]` and you will have `threshold - w[i]` capacity left in your boat. If you decide to exclude item `i`, you will have no value from that item (as you are not transporting it) but you will have `threshold` capacity to fill. It should be an easy problem then:

> for each of the items, you find the max value from the two choices you have: including an item `i` or excluding the item `i`

It is as simple as `max(incl, excl)` where `incl` and `excl` refer to the value you obtain by deciding to include the item `i` or exclude the item `i`. Once you include the item `i`, you would be left with one less item in your candidate set to pick the next one. Intuitively you can keep recursing until there are no more items left or until your threshold is reached. You go about writing a recursive algorithm to help you decide.

{% highlight cpp %}
int knapsack(std::vector<int>& w, std::vector<int>& v, int n, int threshold)
{
  // base case
  if (threshold < 0)
    return INT8_MIN;

  if (n < 0 || threshold == 0)
    return 0;

  // include the current element in the solution
  int incl = v[n] + knapsack(w, v, n-1, threshold - w[n]);
  // exclude the current element
  int excl = knapsack(w, v, n-1, threshold);
  return std::max(incl, excl);
}
{% endhighlight %}

Is this the most efficient way of writing this though? Think about it.