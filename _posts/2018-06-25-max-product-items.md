---
layout: post
title: Computing elements that result in maximum product
categories: [data structures, arrays, algorithms, C++]
keywords: [data structures, arrays, algorithms, C++]
external-url: https://dotkay.github.io/2018/06/25/max-product-items
---

Suppose we are given an unsorted array of integers and asked to find the pair of elements from the array that results in maximum product, how do we go about computing it?

A naïve approach is to find the product of each pair and maintain the maximum product seen so far. This would be an \(O(n^2)\) algorithm. Let us start with this and improve on it.

{% highlight cpp %}
void maxprod(std::vector<int> arr)
{
  int n = arr.size();
  int max_prod = INT_MIN;
  int max_i, max_j;

  for (int i = 0; i < n-1; i++)
  {
    for (int j = i + 1; j < n; j++)
    {
      if (arr[i] * arr[j] > max_prod)
      {
        max_prod = arr[i] * arr[j];
        max_i = i;
        max_j = j;
      }
    }
  }
  std::cout << arr[max_i] << ", " << arr[max_j] << std::endl;
}
{% endhighlight %}

Can we do better than \(O(n^2)\)? Clearly, yes. We know that we could sort an array efficiently in \(O(n log n)\). We could sort the array and the maximum product would be either the product of the largest two elements or smallest two elements (if they are both negative). 

{% highlight cpp %}
void maxprod(std::vector<int> arr)
{
  int n = arr.size();
  std::sort(arr.begin(), arr.end());

  if (arr[0] * arr[1] > arr[n-1] * arr[n-2])
    std::cout << arr[0] << ", " << arr[1] << std::endl;
  else
    std::cout << arr[n-1] << ", " << arr[n-2] << std::endl;
}
{% endhighlight %}

Now, can we do better than \(O(n log n)\)?

