---
layout: post
title: Updates in a Segment Tree
categories: [algorithms, data structures, C++, segment tree]
keywords: C++, data structures, algorithms, segment tree
external-url: https://dotkay.github.io/2018/09/24/segment-tree-updates
---

In our [previous post](https://dotkay.github.io/2018/09/12/segment-tree) we saw *Segment tree* to compute binary associative operations on array ranges in an efficient manner. How do we go about updating elements and recomputing the max values, in an efficient manner?

Again, we know how to interpret our segment tree data structure (as a tree). We also know that the second half of our segment tree linear array contains the original array elements (leaf nodes). We make our update (change the value of an element) here first, and then bubble up the changes all the way to the root. We know that moving up the levels just involves looking for the pair-wise root nodes (at *n* for the pair (*2n*, *2n + 1*)). This makes our implementation straight forward as shown below.

{% highlight cpp %}
void STree::update(int index, int val)
{
  index += n;
  st[index] = val;
  int new_val;

  while (index > 1)
  {
    index /= 2;
    new_val = std::max(st[index*2], st[index*2 + 1]);
    if (st[index] != new_val)
      st[index] = new_val;
    else
      return;
  }
}
{% endhighlight %}
