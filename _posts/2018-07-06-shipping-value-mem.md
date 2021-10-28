---
layout: post
title: Making value from shipping products efficiently
categories: [algorithms, memoization, knapsack, C++]
keywords: [recursion, memoization, algorithms, knapsack, C++]
external-url: https://dotkay.github.io/2018/07/06/shipping-value-mem
---

Last week, you [wrote a recursive algorithm](https://dotkay.github.io/2018/07/03/shipping-value-rec) to choose which products to accept for your shipping. Brexit is all over the news and with different kinds of cross border levies that might come into place, your shipping business has become even more chaotic. You get lots of items that need to be shipped but most of them low value and you don't want to pass up on those. So you want to make your algorithm scale up to large number of items and still create the best value for you. Your CS skills are rusty at this point and you are busy reading and discussing Brexit news. You decide to meet an old classmate in a pub just to rant about Brexit. He had gone to school with you studying CS and is now a lecturer in a small college nearby.

You meet him in the pub, and after getting tired of Brexit discussions, you start reminiscing about your college days and the teachers you had. You recall the algorithm you wrote the previous week and start telling your friend about it. You friend is asking you why you had to write a recursive algorithm and how do you plan to scale it up when you have lots of inputs. You don't want to think hard on the problem and you just order another drink. You show your algorithm to your friend in your chromebook. Your friend, being a lecturer, opens starts editing the program and tells you:

> Those who cannot remember the past are condemned to repeat it

You think he is talking about one of the many previous trips to the bar when you got heavily drunk. You don't remember those vividly anyway. He was actually talking about remembering intermediate results as you make recursive calls. He shows you how to quickly put a hash-table and store the intermediate results as you make recursive calls.

You declare an unordered map `lookup` and populate it when we compute `max(incl, excl)`. 

{% highlight cpp %}
std::unordered_map<std::string, int> lookup;
// initially, we have n items and `t` threshold
std::string key = std::to_string(n) + ":" + std::to_string(t);
{% endhighlight %}

For every item `i` we have to decide whether or not to carry, we look at the value of the item and also the remaining threshold `t` when we make recursive calls to `knapsack()` function. We can check if we have a result already computed and stored (as a result of a previous call). 

{% highlight cpp %}
if (lookup.find(key) == lookup.end())
{
  ...
  // make recursive calls; compute incl, excl
  // compute max(incl, excl)
  lookup[key] = std::max(incl, excl);
  ...
}
{% endhighlight %}

{% highlight cpp %}
std::unordered_map<std::string, int> lookup;

int knapsack(std::vector<int>& w, std::vector<int>& v, int n, int t)
{
  // base case
  if (t < 0)
    return INT8_MIN;

  if (n < 0 || t == 0)
    return 0;

  std::string key = std::to_string(n) + ":" + std::to_string(t);

  if (lookup.find(key) == lookup.end())
  {
    // include the current element in the solution
    int incl = v[n] + knapsack(w, v, n-1, t - w[n]);
    // exclude the current element
    int excl = knapsack(w, v, n-1, t);
    lookup[key] = std::max(incl, excl);
  }
  return lookup[key];
}
{% endhighlight %}

The next day, you realize that you are able to use the algorithm modified by your friend on much larger number of items. Remembering is not that bad after all.