---
layout: post
title: Reversing elements of an array in groups
categories: [algorithms, data structures, arrays]
keywords: C++, data structures, arrays
external-url: https://dotkay.github.io/2018/04/17/reverse-subarray-groups
---

Earlier, we [saw how to reverse a sub-array](https://dotkay.github.io/2018/04/05/reverse-a-subarray) given the window to be reversed. How do we reverse an array in subarray groups? For example, if our input array is `[1, 2, 3, 4, 5, 6, 7, 8]` and group size is `3`, we want to reverse every group of 3 elements in the array and the remaining ones. Something like:

```
1 2 3 4 5 6 7 8                 -> input array
(3 2 1) 4 5 6 7 8               -> first group of 3 elements reversed;
                                   group denoted by (..)
(3 2 1) (6 5 4) 7 8             -> second group of 3 elements reversed
(3 2 1) (6 5 4) (8 7)           -> remaining elements (less than group size)
                                   reversed
```

The algorithm is very similar to the earlier one, just that we need to take care of the group boundaries while traversal and reversing, just like how we took care of boundaries while reversing subarrays.

{% highlight cpp %}
void reverse_in_groups(int arr[], int n, int g)
{
  for (int i = 0; i < n; i += g)
  {
    int lo = i;
    int hi = min(i + g - 1, n - 1);
    while (lo < hi)
    {
      swap(&arr[lo++], &arr[hi--]);
    }
  }
}
{% endhighlight %}

Here, `n` denotes the size of the input array `arr` and `g` denotes the size of the group.




