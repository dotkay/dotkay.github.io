---
layout: post
title: Efficient point updates in a Fenwick Tree
categories: [algorithms, data structures, C++]
keywords: C++, data structures, algorithms, Fenwick Tree
external-url: https://dotkay.github.io/2018/02/17/fenwick-tree-updates
---

In a [previous post](https://dotkay.github.io/2018/02/09/fenwick-tree-rsq) we saw how to use Fenwick Tree data-structure to make fast range queries over a collection of elements. One of the advantages of Fenwick Tree comes in use cases where the underlying collection is dynamic - i.e., there are frequent updates of the values it contains. 

Recall the structure of a Fenwick Tree that we introduced earlier.

<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/tmp/main/ds_illustrations/FenwickTree_arr.PNG"></center>
</div>

If the element at index 4 gets updated (in the underlying array from which our Fenwick Tree is built, note that we are using 1-indexed arrays instead of 0-indexed arrays which we will take care of in our code), we need to update only elements at 4, 8, 16, ... instead of updating everything to the right of index 4 (4 ... end of the array). We follow a similar procedure as we did for our query function and look for the next parent to update (i.e. node with the next bit set). In the case of 4 (00100), it would be 01000 (8), and so on, which is accomplished by `i + (i & -i)`. Let us consider an update (in this case, an addition of a value to the existing value):

{% highlight cpp %}
void FenwickTree::update(int index, int val)
{
  int n = fwtree.size();
  index += 1; // take care of 1-indexing in Fenwick Tree
  while (index < n)
  {
    fwtree[index] = add_val(fwtree[index], val);
    index += index & -index;
  }
}
{% endhighlight %}

`add_val()` could be subtract or multiply or any other function. 
