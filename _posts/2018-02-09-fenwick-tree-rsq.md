---
layout: post
title: Faster range queries using Fenwick Tree
categories: [algorithms, data structures, C++]
keywords: C++, data structures, algorithms, Fenwick Tree
external-url: https://dotkay.github.io/2018/02/09/fenwick-tree-rsq
---

In a [previous post](https://dotkay.github.io/2018/02/05/fenwick-tree), we introduced *Fenwick Tree* as an awesome data structure to use for making cumulative sum queries across a range of array indices. We populated our *Fenwick Tree* and it is ready to make queries on, which this post is about.

Recall that we interpret the *Fenwick Tree* which is actually a linear data structure (a C++ array or vector) but interpreted as a tree as shown in the figure below. This is what allows us to make fast queries. For example, node at index four holds the sum of the elements at 1, 2, 3 and 4. So, if we want to sum, say first 9 elements we just need to lookup the value at index 8 (which has the sum of all the elements in the range 1..8) and add it to the element at index 9. Note that we had to look at only 2 cells (8 and 9) to compute the sum of 9 cells. 

<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/tmp/main/ds_illustrations/FenwickTree_arr.PNG"></center>
</div>

In order to write a function to compute the sum, we just need to find the appropriate nodes. Recall that the lower most layer of the tree, the leaves, correspond to indices that have LSB set. The layer above that have the next bit set and so on. So, if we want the sum of first seven elements, we look at index seven (which is 0111), and sum the value here to the one at index six (which is 0110) and sum this to the one at index 4 (which is 0100). In other words, we need to sum the elements at indices `0111`, `0110` and `0100`, i.e. elements at nodes whose binary representation has the bit set starting from right-most bit.
```
011[1] ->  01[1]0 -> 0[1]00
```

Once we start at seven (0111), we can flip the right-most set-bit(s) by this operation `i - (i & -i)` (think of it as finding the parent nodes). Given this, the function to compute the cumulative sum would look like:

{% highlight cpp %}
int FenwickTree::rsq(int i)
{
  int sum = 0;
  while (i > 0)
  {
    sum += fwtree[i];
    i -= (i & -i);
  }
  return sum;
}
{% endhighlight %}

And we can reuse the above function to find the cumulative sum between any two ranges `i` and `j`.

{% highlight cpp %}
int FenwickTree::rsq(int i, int j)
{
  return rsq(j) - rsq(i);
}
{% endhighlight %}

One could think about a similar way to make point updates (i.e. the input array being dynamic) which is what makes Fenwick Tree an awesome data structure.