---
layout: post
title: Computing the number of inversions in an array - using divide and conquer approach
categories: [algorithms, C++]
keywords:
external-url: https://dotkay.github.io/2017/10/03/array-inversions-merge-sort
---

In our [previous post](https://dotkay.github.io/2017/10/02/array-inversions-naive), we saw an `O(n^2` algorithm to compute the number of inversions in an input array. Now, let us see how we can use divide and conquer approach to solve the same problem. We will see that we can do better than `O(n^2)` using this approach.

In the traditional recursive version of merge-sort, we divide the input array into two halves and call merge-sort procedure on each of the sub-arrays recursively and eventually merge the results. Suppose our input array is `{2, 4, 1, 3, 5}` and suppose that the merge-sort procedure calls are complete and that we are in the merge process. Let us say that we ended up with the following sorted subarrays and trying to merge them up into a single sorted array - `{2, 4}` and `{1, 3, 5}`. The way merge procedure works is to compare the two sub-arrays (call it `left` and `right`) and compare the elements one by one. First, we compare `2` and `1`, since `1` is less than `2`, we push `1` to the result array (`1` being the smaller element). And we have encountered an inversion - the index of `2` is smaller than the index of `1`. Since we know that each of the sub-arrays are sorted, elements that follow `2` in the `left` sub-array would be greater than `2` and since `2` formed an inversion with `1` (of the `right` sub-array), so will all the elements that follow `2` in the `left` sub-array. So, we already see two inversions - `(2, 1)` and `(4, 1)`. Now we move on and compare the next elements - `2` and `3` and push `2` into the result array, and move on to the next. Now, we compare `4` and `3` and since `3` is smaller, we push it into the result array - we also encounter an inversion `(4, 3)`. A pair of keen eyes would note that whenever we push an element from the `right` sub-array into the result array, we encounter (at least) an inversion and the number of inversions at that step equals the number of elements following the current element in `left` sub-array. Think over it. 

{% highlight cpp %}
#define REP(i, n) for (int i=0; i<n; i++)
#define REPK(i, k, n) for (int i=k; i<n; i++)

int merge(int arr[], int l, int m, int r) {
  int inv_cnt = 0;
  // create tmp arrays for l and r
  int lsz = m - l + 1;
  int rsz = r - m;
  int left[lsz];
  int right[rsz];
  // populate
  REP(i, lsz)
    left[i] = arr[l + i];
  REP(i, rsz)
    right[i] = arr[m + 1 + i];
  // compare and merge
  int i, j, k;
  i = 0; j = 0;
  k = l;
  while ((i < lsz) && (j < rsz)) {
    if (left[i] <= right[j])
      arr[k++] = left[i++];
    else {
      arr[k++] = right[j++];
      inv_cnt += lsz - i;
    }
  }
  // fill in the left-over elements
  while (i < lsz) 
    arr[k++] = left[i++];
  while (j < rsz) 
    arr[k++] = right[j++];

  return inv_cnt;
}

int mergesort (int arr[], int l, int r) {
  int inv_cnt = 0;
  if (l < r) {
    int mid = l+(r-l)/2;

    inv_cnt = mergesort(arr, l, mid);
    inv_cnt += mergesort(arr, mid+1, r);
    inv_cnt += merge(arr, l, mid, r);
  }
  return inv_cnt;
}

{% endhighlight %}


Since we use divide and conquer, in fact we could re-purpose merge step of merge-sort as shown below to count the number of inversions, the time complexity of this approach is `O(nlogn)` which is better than our previous approach.
