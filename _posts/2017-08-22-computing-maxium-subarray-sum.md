---
layout: post
title: Computing maximum subarray sum
categories: [algorithms, C++]
keywords: [algorithms, C++]
external-url: https://dotkay.github.io/2017/08/22/computing-maximum-subarray-sum
---

Let's look at one of my favourite algorithm problems from my younger days - Computing the maximum subarray sum of a given array. That is, if you are given an array, find the maximum sum formed by the subarrays of the array. For example, if the array is `[-1; 2; 6; 4; 2]`, the maximum subarray sum is `12` contributed by the subarray `[2; 6; 4]`. Let's look at how to solve this.

The straight-forward approach is to go through all possible subarrays, compute their sum and pick the maximum of those. 

{% highlight cpp %}
int max_subarray_sum_On3 (vector<int> arr) {
    int res = 0;
    int n = arr.size();
    for (int a = 0; a < n; a++) {
        for (int b = a; b < n; b++) {
            int sum = 0;
            for (int c = a; c <= b; c++) {
                sum += arr[c];
            }
            res = max(res, sum);
        }
    }
    return res;
}
{% endhighlight %} 

Here, `a` and `b` denote the window of the subarray. We use the loop with the index `c` to compute the sum in the subarray defined by the window between `a` and `b`. We then compute the max of the accumulated sum `sum` from this window and the saved result `res`. The time complexity of this algorithm is O(n<sup>3</sup>).

Let's do it a little better. What if we compute the sum at the same time as we extend the window to the right - i.e., move `b` to the right (the second for loop that increments `b`)? Let's try that.

{% highlight cpp %}
int max_subarray_sum_On2 (vector<int> arr) {
    int res = 0;
    int n = arr.size();
    for (int a = 0; a < n; a++) {
        int sum = 0;
        for (int b = a; b < n; b++) {
            sum += arr[b];
            res = max(res, sum);
        }
    }
    return res;
}
{% endhighlight %} 

We initialize `sum` before entering the loop and compute the `sum` and the max of `sum` and the saved result (max-so-far) within this loop. The time complexity of this algorithm is O(n<sup>2</sup>). 

Can we do better? I initially thought 'No'. And it was too hard to convince myself the simple and elegant algorithm by [Joseph Kadene](http://tepper.cmu.edu/our-faculty-and-research/about-our-faculty/faculty-profiles/kadane/kadane-joseph). 

{% highlight cpp %}
int max_subarray_sum_3 (vector<int> arr) {
    int res = 0, sum = 0;
    int n = arr.size();
    for (int a = 0; a < n; a++) {
        sum = max(arr[a], sum + arr[a]);
        res = max(res, sum);
    }
    return res;
}
{% endhighlight %} 

The idea is to look at the first loop (indexed by `a`) as a subarray consisting of elements upto `a-1` followed by element at `a`. As we traverse the array, we keep computing the max of the element we are currently at `arr[a]` and (the sum-so-far + the element we are currently at - which is actually the boundary of the subarray, meaning max-until-this-point) - `sum + arr[a]`. `res` indicates the maximum value seen so far and we update it after comparing against the max-until-this-point (the max we computed after moving the window one element to the right, which is now in `sum`). Since we iterate over the array only once (one for loop), the time complexity of this algorithm is O(n). Isn't it awesome?

I don't know how clearly I managed to explain it. Someday, I will add intuitive images working out the above three and see if it is any more intuitive.

