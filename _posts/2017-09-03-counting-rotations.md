---
layout: post
title: Counting the number of rotations of a sorted array
categories: [algorithms, C++]
keywords: [algorithms, C++]
external-url: https://dotkay.github.io/2017/09/03/counting-rotations
---

Let's look at another simple, interesting problem:

*Given a sorted array, with no duplicates, that has been rotated (also called circularly sorted array), find out the number of times it has been rotated*  

For example, `[2 3 5 8 11 12]` is a sorted list of numbers and if we rotate it twice, we end up in `[11 12 2 3 5 8]`. We are required to find the number of times it has been sorted, looking at this list. The straight forward way is to look for the minimum element of the array and the index of the mimimum element gives us the number of times it has been rotated. In this case `2` is the minimum element and the index of the mimumum element is `2` (indices start at `0` in most of the languages we use here). The time complexity would be O(n) as we need to traverse the array looking for the mimimum element.

Can we do better? Can we use a nice property of circularly sorted arrays (lists)?  

> For the element we are looking for, call it the pivot element, both the left and right neighbours are greater than the pivot element. This is the only element in a circularly sorted array with this property.  

So, our goal is to find the pivot element. We already know that the array has been sorted - so we can use binary search to look for the pivot element. We compute the middle element of the array, call it `mid` and search in the left and right halves of the middle element. Let's call the lower index `low` and higher index `high` for the purposes of computation. So, we compute the middle element as `mid = (high - low) / 2`. The neighbours of this middle element, called `prev` and `next` are computed as `prev = (mid + 1) % n` where `n` is the size of the array (since it is circularly sorted we need to wrap around and hence we do this `modulo n` operation) and `next = (mid + n -1) % n`. Now, if `mid` turns out to be our pivot element, i.e. we check for pivot property, we are done - we just return `mid` as the result. Otherwise, we keep moving `low` and `high` to decide which half of the array we want to search for the pivot element. Recollect that we know the array is (circularly) sorted and this makes our job easier. For example, if the element at `mid` is less than the one at `high` we can deduce that the right half of the array is sorted, and so we adjust `high` to be `mid - 1` (i.e. make left half our focus of pivot element search).

{% highlight cpp %}
int rotation_count(int A[], int n) {
  int low = 0;
  int high = n-1;
  int mid = (high - low) / 2;
  int next, prev;
  while (low <= high) {
    if (A[low] <= A[high])
        return low;
    next = (mid + 1) % n;
    prev = (mid + n - 1) % n;
    // check pivot element property!
    if (A[mid] <= A[next] && A[mid] <= A[prev])
        return mid;
    else if (A[mid] <= A[high])
        high = mid - 1;
    else if (A[mid] >= A[low])
        low = mid + 1;
    }
}
{% endhighlight %}

Isn't it interesting? That's all for now!