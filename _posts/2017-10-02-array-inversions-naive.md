---
layout: post
title: Computing the number of inversions in an array - naïve method
categories: [algorithms, C++]
keywords:
external-url: https://dotkay.github.io/2017/10/02/array-inversions-naive
---

Let us think about computing the number of inversions in an array. Let us also assume that our array has unique elements.

> Two elements in an array `arr` form an inversion if `arr[i] > arr[j]` for `i < j`. 

For example, if `{2, 4, 1, 3, 5}` is our input array, it has 3 inversions `(2, 1), (4,1)` and `(4, 3)`. Let us look for a naïve straight-forward algorithm to solve this problem - i.e., traverse the array comparing the elements and checking if there is an inversion.

{% highlight cpp %}
int inv_count (int arr[], int n) {
  int inv_count = 0;
  for (int i=0; i<n-1; i++)
    for (int j=i+1; j<n; j++)
      if (arr[j] < arr[i])
        inv_count++;
  return inv_count;
  // Time complexity: O(n^2) (two for loops)
}
{% endhighlight %}

Inversion tells us how far the array is from being sorted. For a sorted array, the number of inversions is `0` and if the array is sorted in the other order it has maximum number of inversions.

But can we do better than `O(n^2`?