---
layout: post
title: Finding the minimum absolute difference among array elements
categories: [algorithms, data structures, arrays]
keywords: C++, data structures, arrays
external-url: https://dotkay.github.io/2018/04/14/array-min-abs-diff
---

Let us see how do we compute the minimum absolute difference among elements of an array. Given that we are concerened about all the elements of the array tells us that we need to 

1. Traverse all the elements of the array (so complexity is already O(n))
2. Maintain a running counter that captures the minimum difference as we traverse the array - the idea is also to initialize this variable to MAX value so that we can record the minimum difference easily

{% highlight cpp %}
int min_abs_diff(int arr[], int n)
{
  int min_diff = INT8_MAX;
  for (int i = 0; i < n; i++)
  {
    int diff = abs(arr[i] - arr[(i+1) % n]);
    if (diff < min_diff)
      min_diff = diff;
  }
  return min_diff;
}
{% endhighlight %}

Note how we try not to overflow the array index (while evaluating `arr[i+1]`) by computing modulo `n` - the size of the array.




