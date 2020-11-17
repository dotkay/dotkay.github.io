---
layout: post
title: Rotating array elements faster
categories: [algorithms, data structures, arrays]
keywords: C++, data structures, arrays
external-url: https://dotkay.github.io/2018/04/27/array-rotation-On
---

In our [previous post](https://dotkay.github.io/2018/04/25/array-rotation), we saw a simple problem and a simpler solution to the problem. However, the cost was prohibitive (*O(nd))*. How can we reduce the time complexity? Let's try to do it at the expense of some space.

The idea here is again very simple. Instead of doing 1 rotation *d* times, we would copy over *d* elements at ones and shift them together. Earlier needed only one temporary variable to store the first element of the array before moving it to the position of the last element. But now, we would need a variable that can hold *d* elements as we are going to move *d* elements at once. So our space complexity has gone up from *O(1)* to *O(d)*.

{% highlight cpp %}
void rot_arr_by_d(int arr[], int n, int d)
{
  // space: O(d)
  int* tmp = new int[d];
  // copy the first d elements from arr to tmp
  // time: O(d)
  for (int i=0; i < d; i++)
    tmp[i] = arr[i];
  // rotate the remaining n-d elements
  // time: ~ O(n)
  for (int i=0; i < n-d; i++)
    arr[i] = arr[d+i];
  // fill the remaining from tmp
  // time: O(d)
  for (int i=0; i < d; i++)
    arr[n-d+i] = tmp[i];
}
{% endhighlight %}

Since we had have *d* less than *n* as the problem statement, *O(n)* would dominate and this would be a *O(n)* solution. Can we do better than this?

