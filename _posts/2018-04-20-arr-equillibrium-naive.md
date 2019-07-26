---
layout: post
title: Finding the equillibrium index in an array
categories: [algorithms, data structures, arrays]
keywords: C++, data structures, arrays
external-url: https://dotkay.github.io/2018/04/20/array-equillibrium-naive
---

> The equillibrium point in a given array is said to be the index such that the sum of all the elements before the index equals the sum of all the elements to the right of the index.

For example, if the input array is `[0, -3, 5, -4, -2, 3, 1, 0]`, the equillibrium indices are 7, 3 and 0. Note that `0` is an equillibrium index if the sum of all the elements until the end of the array are 0 and similarly, `n-1` is an equillibrium index of all the elements from 0 until `n-1` add up to 0.

Let us look at a very straight-forward solution. We could just traverse the array and for each element compute the sum of elements to the left and the sum of elements to the right (`lsum` and `rsum` in the code fragment below) and check if they are equal as we traverse the array. 

{% highlight cpp %}
void eq_index_On_2(int arr[], int n)
{
  int lsum, rsum;
  for (int i = 0; i < n; i++)
  {
    lsum = 0;
    rsum = 0;
    for (int j = 0; j < i; j++)
      lsum += arr[j];
    for (int j = i+1; j <n; j++)
      rsum += arr[j];
    if (lsum == rsum)
      std::cout << "equillibrium found at index: " << i << std::endl;
  }
}
{% endhighlight %}

As you can realize immediately, this is an `O(n^2)` solution. Can we do better?
