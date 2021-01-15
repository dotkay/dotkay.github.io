---
layout: post
title: Counting Cokes faster ...
categories: [algorithms, data structures, C++]
keywords: C++, data structures, algorithms, Fenwick Tree
external-url: https://dotkay.github.io/2018/02/05/fenwick-tree
---

In a [previous post](https://dotkay.github.io/2018/02/01/cumulative-freq) you as a Marketing Manager was struggling to count the number of Cokes dispensed in order to compute the reward for the vendors. You made an expensive hire and made some progress, but wasn't enough. Now, you are talking to your old academic friend over coffee and he is surpised why this is a big problem. He just exclaims that you should have used a *Fenwick Tree* instead. 

So, what is this *Fenwick Tree*? It is an awesome data structure that allows you to compute the sum across a range of numbers without iterating over every element in the range. Of course, the earlier solution was able to do that as well. But the beauty that *Fenwick Tree* adds is that you could also do point updates in `O(log n)` time. And you don't need nodes and pointers - the *Tree* structure is captured in the array itself. It was discovered by Prof. Peter Fenwick in 1994 in an article titled [*A new data structure for cumulative frequency tables*](https://onlinelibrary.wiley.com/doi/abs/10.1002/spe.4380240306).

How do we go about constructing one? We create an array of size one larger than the original input array (1 larger as we want to ignore the element at index `0` - we will soon see why) and copy over the elements of the input array in this new array starting from index `1`. The interpretation of the tree (though the elements are stored in a linear data structure like an array) is that the indices which have LSB `1` (i.e. all odd indices) are interpreted as leaves of the tree. One level up are the elements that have the second bit set, and so on. Given an element, how do we find the parent node for it? We know that if the index corresponding to an element `x` has left-most bit set at position `i` then it's parent should have the next bit set. For example element at index one (bit-0 set - 0001), and it's parent is the one at index two (bit-1 set - 0010). Similarly element at index three (bit-1 set - 0011) has it's parent at index four (bit-2 set - 0100). And element at index seven (bit-2 set - 0111) has it's parent at index eight (bit-3 set - 1000). Given `i`, `i + (i & -i)` would give the parent's index. 

<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/tmp/main/ds_illustrations/fenwick_tree.PNG"></center>
</div>

Let's use this to construct our Fenwick tree. `_arr` is the given input array and the function returns the constructed Fenwick tree (array).

{% highlight cpp %}
std::vector<int> FenwickTree::build_fwtree(std::vector<int> _arr)
{
  int n = _arr.size();
  std::vector<int> res(n+1);
  res.assign(n+1, 0);
  for (int i = 1; i <= n; i++)
    res[i] = _arr[i-1];
  for (int i = 1; i <= n; i++)
  {
    int p = i + (i & -i);
    if (p < res.size())
    {
      res[p] += res[i];
    }
  }
  return res;
}
{% endhighlight %}

We will see how to perform the other query operations in a future post. Stay tuned.