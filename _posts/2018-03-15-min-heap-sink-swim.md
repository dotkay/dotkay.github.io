---
layout: post
title: Min heap, sink and swim
categories: [algorithms, data structures, heap]
keywords: C++, data structures, heap
external-url: https://dotkay.github.io/2018/03/15/min-heap-sink-swim
---

In a [previous post](https://dotkay.github.io/2018/03/12/min-heap-insert-delete) we saw insertion and deletion of keys in a min heap. The heap property however is maintained by helper functions `sink()` and `swim()` which are used in deletion and insertion respectively. In this post, we will take a look at the implementation of these functions.

The main intuition behind the implementation is traversal of the tree from root towards the leaves (bubble down using `sink()`) and from leaf node towards the root (bubble up using `swim()`). The main objective is to maintain (or restore) the heap property which is just that the parent node is smaller than the children, which indicates that we need a way of identifying (and comparing) parent and children nodes. For any node *k* in the tree which is not a root, the parent node is at index *k/2* and children nodes are at *2k* and *2k + 1*. So, all we need are to identify the elements at these indices, compare the values and keep swapping elements until heap property is restored. Besides we need to check boundary conditions (i.e. bubble up until we reach the root (*k > 1*)and bubble down (*2k < n*) until we reach the leaf).

{% highlight cpp %}
void MinHeap::swim(int k)
{
  // parent of k : k/2
  while (k > 1 && (heap[k] < heap[k/2]))
  {
    std::swap(heap[k], heap[k/2]);
    k /= 2;
  }
}
{% endhighlight %}

{% highlight cpp %}
void MinHeap::sink(int k)
{
  // children of k : 2k, 2k + 1
  while (2*k < n)
  {
    int j = 2*k;
    if (k < n && (heap[2*k] < heap[2*k+1]))
      j++;
    if (!(heap[k] > heap[j]))
      break;
    std::swap(heap[k], heap[j]);
    k = j;
  }
}
{% endhighlight %}

