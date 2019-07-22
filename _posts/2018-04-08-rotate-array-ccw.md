---
layout: post
title: Rotating an array counter clockwise around a given index
categories: [algorithms, data structures, arrays]
keywords: C++, data structures, arrays
external-url: https://dotkay.github.io/2018/14/08/rotate-array-ccw
---

Given an array, how do you rotate it counter clockwise around a given input index position? i.e. If the input array was `[1, 2, 3, 4, 5, 6, 7, 8]`, the result of rotation around index `3` (that has the element 4) in the counter clockwise direction would be `[5, 6, 7, 8, 1, 2, 3, 4]`. The sequence of transformations the array goes through as each of the elements until the given index rotates would be:

```
1 2 3 4 5 6 7 8            --> input array
2 3 4 5 6 7 8 1            --> 1 has rotated away to the end of the array
3 4 5 6 7 8 1 2            --> 2 has rotated away following 1
4 5 6 7 8 1 2 3            --> now, it's 3's turn
5 6 7 8 1 2 3 4            --> the element at index 3 (i.e. 4) around which we
                               wanted to rotate has also completed.
```

We can use the [algorithm we developed to reverse a sub-array](https://dotkay.github.io/2018/04/05/reverse-a-subarray), in order to achieve this rotation. The idea is simple: 

1. First, reverse the sub-array consisting of elements from the beginning of the array until the pivot (around which we want to rotate the array) in place
2. Now, rotate the remaining sub-array alone (i.e. from the pivot until the end of the array
3. Complete it by reversing the entire array once

```
1 2 3 4 5 6 7 8            --> input array
4 3 2 1 5 6 7 8            --> step-1 first sub-array reversed
4 3 2 1 8 7 6 5            --> step-2 second sub-array reversed
5 6 7 8 1 2 3 4            --> step-3 rotation of the entire array 
```

An implementation would look like:

{% highlight cpp %}
void rotate_arr_ccw(int arr[], int size, int pivot)
{
  reverse_arr(arr, 0, pivot);
  reverse_arr(arr, pivot+1, size-1);
  reverse_arr(arr, 0, size-1);
}
{% endhighlight %}


