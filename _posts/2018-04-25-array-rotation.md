---
layout: post
title: Rotating array elements
categories: [algorithms, data structures, arrays]
keywords: C++, data structures, arrays
external-url: https://dotkay.github.io/2018/04/25/array-rotation
---

Here is a very simple problem. Given an array of *n* elements and an integer *d* (less than *n*) how would you write a program to rotate (around) the elements of the array to the left by *d* elements? For example, if the input array (of size 7) is `{1, 2, 3, 4, 5, 6, 7 }` and *d* is 2, the output array would be `{ 3, 4, 5, 6, 7, 1, 2 }`.

Let's start simple. How would you rotate by 1? We would essentially move all the array elements to the left by one position, while moving the first element to the position of the last element. Essentially we would be moving *n* elements. Let's write a function to do that:

{% highlight cpp %}
void rot_arr_by_1(int arr[], int n)
{
  int tmp = arr[0];
  int i;
  for (i = 0; i < n-1; i++)
    arr[i] = arr[i+1];
  arr[i] = tmp;  
}
{% endhighlight %}

The time complexity of the above solution is *O(n)* while the space complexity is *O(1)* (one variable to store the initial element). Now, rotating by *d* is just rotating by 1 done *d* times. 

{% highlight cpp %}
void rot_arr_by_d(int arr[], int n, int d)
{
  for (int i = 0; i < d; i++)
    rot_arr_by_1(arr, n);
}
{% endhighlight %}

Now, the time complexity of the above function is *O(nd)*. Can we do better than this?


