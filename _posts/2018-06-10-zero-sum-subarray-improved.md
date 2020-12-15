---
layout: post
title: Finding the subarray leading to zero sum, faster
categories: [data structures, arrays, algorithms, C++]
keywords: [data structures, arrays, algorithms, C++]
external-url: https://dotkay.github.io/2018/06/10/zero-sum-subarray-improved
---

In a [previous post](https://dotkay.github.io/2018/06/05/zero-sum-subarray), we computed a subarray composed of consecutive array elements that sums to 0 and were wondering if we can do it in linear time. And in fact, we can do it in linear time, by remembering the intermediate subarray sums rather than recomputing them.

We maintain a set to store the sum seen so far. Our array may be (if it has a subarray composed of consecutive array elements that sum to 0) composed of such blocks of elements:
```
     [initial part of the array][subarray that sums to 0][later part of the array]
     <------------------------ x ---------------------- y ----------------------->
```

{% highlight cpp %}
bool zero_sum_subarray(std::vector<int> arr)
{
  int n = arr.size();
  std::unordered_set<int> lookup;
  lookup.insert(0);
  int acc = 0;

  for (int i = 0; i < n; i++)
  {
    acc += arr[i];
    if (lookup.find(acc) != lookup.end())
    {
      return true;
    }
    else
      lookup.insert(acc);
  }
  return false;
}
{% endhighlight %}

Now, we initialize our memory 0. When we reach the index `x`, our accumulator (`acc`) would contain the sum of elements upto index `x`. As an when we traverse the array and compute the intermediate sums in the accumulator, we also see if our memory has seen the accumulator value and if it has not seen we populate the memory with the accumulator value. Now, when we go from `x` to `y` since the elements in this window would sum to 0, the accumulator value at `y` would be the same as at `x` (since the elements between `x` and `y` summed to 0 and did not contribute anything to the accumulator). And we have this value already stored in the memory (which we will know if we lookup the memory) and hence can confidently say that we have found the 0 sum subarray.

There may be more than one subarray that sums to 0. How do we capture and retain all the subarrays that sum to zero? Suppose we want to pick the longest subarray that sums to zero, how do we go about it?