---
layout: post
title: Insert and delete items in a min heap
categories: [algorithms, data structures, heap]
keywords: C++, data structures, heap
external-url: https://dotkay.github.io/2018/03/12/min-heap-insert-delete
---

In a [previous post](https://dotkay.github.io/2018/03/09/min-heap) we saw that constructing a heap (min heap) and retrieving min valued elements from it were very straight forward. Let us see how do we maintain the heap property (min heap property) of the data structure as we insert or delete items from it.

In order to achieve this, we will make use of two helper methods `sink()` and `swim()` which would be used in the client visible methods `insert_item()` and `delete_item()`.

Let's look at how to insert a given item into the heap. We insert it at the end (of the vector as we have implemented our heap using C++ `std::vector`) and we bubble up that element to it's appropriate position. If this newly inserted element happens to be the min element so far, `swim()` would bubble it up all the way to the root. If not, it will occupy a position in the tree that satisfies the heap property - parent node's key is smaller than that of childrens.

{% highlight cpp %}
void MinHeap::insert_item(int item)
{
  heap[++n] = item;
  swim(n);
}
{% endhighlight %}

Similarly, while deleting the min element (which we know is at the root), we swap the current root element with the last element of the vector and delete the last element of the vector (point it to NULL). Now, the element occupying the root position may not be the min element anymore. So, we bubble down the root element using a call to `sink()` to an appropriate position in the tree that satisfies the heap property. 

{% highlight cpp %}
void MinHeap::delete_min()
{
  std::swap(heap[1], heap[n]);
  heap[n] = (int)NULL;
  n--;
  sink(1);
}
{% endhighlight %}

We will take a look at `sink()` and `swim()` methods in a future post.