---
layout: post
title: Reversing an array in place
categories: [algorithms, data structures, arrays]
keywords: C++, data structures, arrays
external-url: https://dotkay.github.io/2018/04/02/reverse-an-array
---

Today, let us write a small program to reverse the elements of an array - i.e. reverse the order of elements in an array. For example, if the input array is `[1, 3, 4, 11, 2, 6]`, in the output array, the elements would be in reverse order - i.e. `[6, 2, 11, 4, 3, 1]`. One way would be to create a new (output) array and traverse the input array from the end and copy the elements to the output array. But, in this case, we would be creating an additional array (if the input array was of a million elements, we would have to create another (output) array big enough to hold a million elements). We could do it "in place" - i.e., without creating an additional array.

We traverse the array from the beginning and swap the elements with those from the end of the array. This way, by the time we are at the mid-point of the array, we would have swapped all the elements and the array would be in reverse order.

{% highlight cpp %}
void rev_arr(int arr[], int n)
{
  for (int i = 0; i < n/2; i++)
    swap(&arr[i], &arr[n - i - 1]);
}
{% endhighlight %}

where `swap(arr[a], arr[b])` would swap the elements at array locations `a` and `b` and `n` is the size of the input array `arr`.
