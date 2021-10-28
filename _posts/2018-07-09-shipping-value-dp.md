---
layout: post
title: Generating Optimal Value from Shipping
categories: [algorithms, dynamic programming, knapsack, C++]
keywords: [recursion, dynamic programming, algorithms, knapsack, C++]
external-url: https://dotkay.github.io/2018/07/09/shipping-value-dp
---

[Last week](https://dotkay.github.io/2018/07/06/shipping-value-mem) your old CS friend helped you refine your algorithm. Now, he has offered to send one of his students to do an internship in your shipping business (your business never had interns) to help you refine your algorithms. You invite the student to show your code and the refined version and he says apart from refining this algorithm, he would also gather data on daily shipping and use data science and machine learning to help you predict your returns from shipping. You seem impressed and let him do his work.

He revises your algorithm and adds the following comments:

```
This is a typical dynamic programming problem. It has:
- optimal substructure: the optimal solution can be built successively from optimal solutions of the subproblems
- overlapping subproblems : the problem can be broken down into subproblems of smaller size
```

He goes on to write that it could also be solved in a `bottom-up` fashion rather than a `top-down` manner as your lecturer friend did. That is, instead of starting with the big problem and breaking it down into smaller subproblems, you could start with the smallest subproblem you can imagine (say your ship's capacity is `0`) and build up solutions to larger subproblems progressively.

The idea here is to store the results of intermediate subproblems in some data structure (very much like the [hash-table we saw earlier](https://dotkay.github.io/2018/07/06/shipping-value-mem)) and refer to the values in the data structure as we build solutions to larger subproblems. Since we look at the number of items left to decide (whether to accept or not) and the threshold (capacity) of our boat, we use a 2D vector `max_val` to store the result.


{% highlight cpp %}
std::vector<std::vector<int>> max_val(n+1, std::vector<int>(t+1));
{% endhighlight %}

where `n` is the number of elements and `t` is the threshold (capacity).

If the capacity of our ship is `0` we cannot carry anything and hence the value we would obtain is `0`.

{% highlight cpp %}
// if the threshold is 0, max_val is 0
// as you can't carry anything
for (int i = 0; i <= n; i++)
  max_val[i][0] = 0;
{% endhighlight %}

Similarly, if there are no items to carry, we don't get any value out of our business.

{% highlight cpp %}
// if there are 0 items, max_val is 0
for (int j = 0; j <= t; j++)
  max_val[0][j] = 0;
{% endhighlight %}

We can now build solutions for other values of `i` (1..n) and `j` (1..t) by iterating over the possible values and using the solutions to the smallest subproblems computed above. Now again, we need to check if an item `i` would fit in our boat (it would fit only if it is within the ships remaining capacity). If it would fit, we need to check if it is a good choice to carry it, for which we do a comparision of the value we obtain with and without the item `i`, very similar to `incl` and `excl` earlier. If `j` is the remaining threshold, and `w[i-1]` is the weight of the current item,


{% highlight cpp %}
// if item i fits in the knapsack, add its value
if (j - w[i-1] >= 0)
  max_val[i][j] = std::max(v[i-1] + max_val[i-1][j - w[i-1]], max_val[i-1][j]);
{% endhighlight %}

Putting it all together,

{% highlight cpp %}
int knapsack(std::vector<int>& w, std::vector<int>& v, int n, int t)
{
  std::vector<std::vector<int>> max_val(n+1, std::vector<int>(t+1));

  for (int j = 0; j <= t; j++)
    max_val[0][j] = 0;
  
  for (int i = 0; i <= n; i++)
    max_val[i][0] = 0;

  // for each item in the set
  for (int i = 1; i <= n; i++)
  {
    // for every weight upto max threshold
    for (int j = 1; j <= t; j++)
    {
      if (j - w[i-1] >= 0)
        max_val[i][j] = std::max(v[i-1] + max_val[i-1][j - w[i-1]], max_val[i-1][j]);
      else 
        max_val[i][j] = max_val[i-1][j];
    }
  }
  return max_val[n][t];
}
{% endhighlight %}
