---
layout: post
title: More efficient computation of equillibrium index in an array
categories: [algorithms, data structures, arrays]
keywords: C++, data structures, arrays
external-url: https://dotkay.github.io/2018/04/23/array-equillibrium
---

In an [earlier post](https://dotkay.github.io/2018/04/20/arr-equillibrium-naive), we saw how to compute the equillibrium index of an array. But it was a very ordinary implementation - `O(n^2)`. We could do much better with some auxiliary space spent, i.e. we maintain an auxiliary array to keep a running sum of the elements to the left as we traverse the array. 

Here is the idea. We would create an auxiliary array of the same size as the input array. As we traverse the input array from left to right, we compute the _prefix sum_ of the elements in the array and store it in this auxiliary array (`left_sum` in the code fragment below). Now, `left sum` can be used to query, for example, the sum of elements to the left of any index `i` as we traverse the array.

We now traverse the input array, this time from right to left, and keep a running sum of the elements in a single variable (`right_sum` in code fragment below). As we traverse, we check for a match in the auxiliary array we had built earlier for the left sum, and if there is a match we have found an equillibrium point. Since we do array traversal only twice, this becomes an `O(n)` solution with `O(n)` auxiliary space for storing the prefix sums.

{% highlight cpp %}
void eq_index(int arr[], int n)
{
  // compute the left sum
  int* left_sum = new int[n];
  left_sum[0] = arr[0];
  for (int i = 1; i < n; i++)
    left_sum[i] = left_sum[i-1] + arr[i-1];

  // traverse input array from the right,
  // computing right_sum and matching it with
  // left sum (i.e. looking for equillibrium)
  int right_sum = 0;
  for (int i = n-1; i >= 0; i--)
  {
    if (right_sum == left_sum[i])
      std::cout << "equillibrium found at index: " << i << std::endl;
    right_sum += arr[i];
  } 
}
{% endhighlight %}

Power of prefix sums! 
