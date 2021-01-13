---
layout: post
title: Of bits, sets and xors...
categories: [algorithms, data structures, C++]
keywords: C++, data structures, algorithms
external-url: https://dotkay.github.io/2018/02/01/cumulative-freq
---

Suppose we have an array that is getting populated with some sensor from  coke vending machines across a chain of restaurants - for every coke dispensed the element at the index of an array (you can imagine the indices correspond to the vending machine numbers) gets incremented by 1. And you being Coke's regional marketing manager are tasked with identifying how many cokes were dispensed by say, machines `0` to `10` or some range `i` to `j`, in order to give rewards to those machine owners who sold more cokes.

How would you go about doing it? Of course, since you have the array, you could traverse the array from index `i` to `j` and sum up the elements. But this is an `O(n)` computation and you want to do it faster. You hire a Stanford graduate as a software engineer and he says we could create a second array that stores the cumulative sums so that the look up would be a constant time operation. You are excited! You give him a large bonus.

How to implement this simple solution? In C++, let us assume that we have setup the constructor and we will populate an auxiliary array (`cfreq`) that will hold the cumulative sum of elements of the input array `_arr` (that has numbers representing number of coke cans dispensed).

{% highlight cpp %}
CumFreq::CumFreq(std::vector<int> _arr)
{
  int n = _arr.size();
  cfreq.assign(n, 0);
  cfreq = build_cfreq(_arr);
{% endhighlight %}

And the helper method `build_cfreq()` is just 

{% highlight cpp %}
std::vector<int> CumFreq::build_cfreq(std::vector<int> _arr)
{
  int n = _arr.size();
  cfreq[0] = _arr[0];
  for (int i = 1; i < n; i++)
    cfreq[i] = cfreq[i-1] + _arr[i];
  return cfreq;
}
{% endhighlight %}

Now that our cfreq contains the cumulative sums of original array elements, we can lookup this array in constant time to find out the cumulative sum of array ending at `j` (which is the sum of elements from `0` to `j`) or even sum of elements between indices `i` and `j`.

{% highlight cpp %}
int CumFreq::rsq(int end)
{
  return cfreq[end-1];
}

int CumFreq::rsq(int begin, int end)
{
  return (cfreq[end-1] - cfreq[begin-1]);
}
{% endhighlight %}

But one of the vending machines numbered `0` had some wiring problem with its sensor and count of the number of cokes dispensed remained stuck at 0 for this machine. Now, the issue is fixed and shows the accumulated reading that the machine owner wants to update. He updates the values and that updates the original array `_arr` at index `0`. Now, one has to recompute the array that holds cumulative frequency all over again. Can one come up with a better algorithm to avoid this scenario?
