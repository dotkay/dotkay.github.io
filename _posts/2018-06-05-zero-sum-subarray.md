---
layout: post
title: Finding the subarray leading to zero sum
categories: [data structures, arrays, algorithms, C++]
keywords: [data structures, arrays, algorithms, C++]
external-url: https://dotkay.github.io/2018/06/05/zero-sum-subarray
---

Given an array of integers, how would you compute the subarray composed of consecutive array elements, that sums to 0? There are \(n^2\) such subarrays and traversing each of those in the worst case to compute the different sums would take \(O(n)\). But one could make it a little better by having a rolling sum computed as and when we are exploring the subarrays. Let us look at the naïve solution. Remember that we want subarrays formed by consecutive array elements. 

We keep a marker (i) on each array element (outer loop), and search for the subarray starting from this marker to another one (j) while checking if the sum of array elements between i and j sum to 0. 

{% highlight cpp %}
bool zero_sum_subarray(std::vector<int> arr)
{
  int n = arr.size();
  for (int i = 0; i < n; i++)
  {
    int sum = 0;
    for (int j = i; j < n; j++)
    {
      sum += arr[j];
      if (sum == 0)
        return true;
    }
  }
  return false;
}
{% endhighlight %}

How can we make this algorithm better? Can we compute it in linear time?
