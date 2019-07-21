---
layout: post
title: Reversing a sub-array of an array in place
categories: [algorithms, data structures, arrays]
keywords: C++, data structures, arrays
external-url: https://dotkay.github.io/2018/04/05/reverse-a-subarray
---

In an [earlier post](https://dotkay.github.io/2018/04/02/reverse-an-array/), we saw how to reverse a given input array. But, it reversed the entire array. What if we want to pick a fragment of the input array and reverse only that?

Let us assume we are given the `start` and `end` indices - the window that we want to reverse. It is very similar to our previous approach, except that we need to be careful computing the indices to iterate on. 

{% highlight cpp %}
void reverse_arr(int arr[], int start, int end)
{
  int mid = (start + ((end - start)/2));
  for (int i = start; i <= mid; i++)
    swap(&arr[i], &arr[end - (i - start)]);
}
{% endhighlight %}

There is an [interesting story](https://thebittheories.com/the-curious-case-of-binary-search-the-famous-bug-that-remained-undetected-for-20-years-973e89fc212) about computation of mid-point given two window boundaries. At first glance, it would seem tempting to write it as `(start + end) / 2` but it is safer (and more correct) to write it as `start + ((end - start) / 2)`. 

