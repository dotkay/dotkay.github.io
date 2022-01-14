---
layout: post
title: Computing elements that result in maximum product efficiently
categories: [data structures, arrays, algorithms, C++]
keywords: [data structures, arrays, algorithms, C++]
external-url: https://dotkay.github.io/2018/06/29/faster-max-product-items
---

In a [previous post](https://dotkay.github.io/2018/06/25/max-product-items) we were wondering if we can compute the elements (from a given unsorted array of integers) that result in maximum product faster than O(n logn). It turns out we can do a linear scan of the array, keeping track of the largest two and the smallest two elements. One of these pairs would result in the maximum product.

{% highlight cpp %}
void maxprod(std::vector<int> arr)
{
  int n = arr.size();
  int max1 = arr[0], max2 = INT_MIN;
  int min1 = arr[0], min2 = INT_MAX;
  
  for (int i = 1; i < n; i++)
  {
    if (arr[i] > max1)
    {
      max2 = max1;
      max1 = arr[i];
    }
    else if (arr[i] > max2)
      max2 = arr[i];
    if (arr[i] < min1)
    {
      min2 = min1;
      min1 = arr[i];
    }
    else if (arr[i] < min2)
      min2 = arr[i];
  }
  if (max1 * max2 > min1 * min2)
    std::cout << max1 << ", " << max2 << std::endl;
  else
    std::cout << min1 << ", " << min2 << std::endl;
}
{% endhighlight %}

The algorithm is very straight-forward that the code itself is self explanatory.