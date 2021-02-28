---
layout: post
title: Counting cokes faster for a different reward ...
categories: [algorithms, data structures, C++, segment tree]
keywords: C++, data structures, algorithms, segment tree
external-url: https://dotkay.github.io/2018/09/12/segment-tree
---

In our [previous post](https://dotkay.github.io/2018/09/02/range-max-queries) we were wondering if we can count maximum number of coke cans dispensed from among a range faster than linear traversal of the array. We go back to [our academic friend who taught us about *Fenwick Tree*](https://dotkay.github.io/2018/02/05/fenwick-tree) for advice.

Our academic friend thinks this is a very easy problem. While Fenwick tree is a wonderful data structure, it can only compute reversible operations. He says there is a similar data structure called *Segment Tree* that can be used for any binary associative operation, besides cumulative operations as in Fenwick tree. He did not mention about Segment tree earlier as it occupies more space than a Fenwick tree. So, what is this *Segment tree*?

It is again a tree data structure, but we will work only with a linear array (just the interpretation is a tree). To construct a segment tree, we create an array twice the size of our original array. We then compute the max value of each pair of elements and store it in the location corresponding to the parent of the pair of elements. We already know that for any node *n*, the child nodes could be stored at *2n* and *2n+1*. So, in our array that is double the size of original array, all the elements towards the second half of the array would be the same as the original array (the child nodes) and they form the lowest layer of our tree interpretation (the leaf nodes). The pair-wise max form the next layer of nodes and so on until we converge on one root node that stores the max value in the array (the entire range). The following figure illustrates this:

<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/tmp/main/ds_illustrations/segment_tree.PNG"></center>
</div>

With this interpretation in mind, the construction of a segment tree is straight forward and it just involves tracking array indices to populate pair-wise max values.

{% highlight cpp %}
STree::STree(std::vector<int> _arr)
{
  n = _arr.size();
  st.assign(2*n, 0);
  for (int i = n; i < 2*n; i++)
    st[i] = _arr[i - n];
  for (int i = n-1; i > 0; i--)
    st[i] = std::max(st[2*i], st[2*i+1]);
}
{% endhighlight %}

Now, finding the max in a range would just involve looking at a few nodes rather than traversing all the elements in the range. For example, if we want to find the max value in the range 1 to 5, we just need to look at the values at the nodes labelled `1:4`and `5`and compute the max among these two values, instead of looking at 5 values.

{% highlight cpp %}
int STree::rmq(int i, int j)
{
  i += n;
  j += n;
  int max = INT_MIN;
  while (i < j)
  {
    if ((i & 1) == 1)
    {
      max = std::max(max, st[i]);
      i++;
    }
    if ((j & 1 == 1))
    {
      j--;
      max = std::max(max, st[j]);
    }
    i /= 2;
    j /= 2;
  }
  return max;
}
{% endhighlight %}

But from past experience we also know that the values would need to be updated quite often. Can we also perform point updates as we did in our Fenwick tree - after all, this is another tree structure and we should be able to traverse it to make updates. We will see that in a future post.