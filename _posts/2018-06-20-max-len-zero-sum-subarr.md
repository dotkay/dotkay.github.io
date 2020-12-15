---
layout: post
title: Computing maximum length subarray that sums to 0
categories: [data structures, arrays, algorithms, C++]
keywords: [data structures, arrays, algorithms, C++]
external-url: https://dotkay.github.io/2018/06/20/max-len-zero-sum-subarr
---

In a [previous post](https://dotkay.github.io/2018/06/15/all-zero-sum-subarrays) we saw how to compute all the subarrays (formed by consecutive elements of an array) that sum to zero. Here, we are going to compute the maximum length one among all those subarrays. You might think why it needs a separate post - one can store all the computed subarrays in a vector and find the maximum of the sizes of the vectors. But one could in fact keep track of the maximum length as and when we compute the individual subarrays that sum to zero. 

Let us look at the naïve approach, as it would be much simpler to understand, and incorporate this computation into it.

{% highlight cpp %}
void max_len_subarr(std::vector<int> arr)
{
  int n = arr.size();
  int max_len = 0;
  for (int i = 0; i < n; i++)
  {
    int acc = 0;
    for (int j = i; j < n; j++)
    {
      acc += arr[j];
      if (acc == 0)
      {
        int len = j - i + 1;
        max_len = std::max(len, max_len);
      }
    }
  }
  std::cout << "max len: " << max_len;
}
{% endhighlight %}

We initialized a variable `max_len` to `0` and update it as and when we find the starting and ending indices of the subarray that sums to zero. We can extend the same idea to the linear scan algorithm, as below:

{% highlight cpp %}
void max_len_subarr(std::vector<int> arr)
{
  int n = arr.size();
  std::unordered_multimap<int, int> lookup;

  lookup.insert(std::pair<int, int>(0, -1));
  int max_len = 0;
  int acc = 0;
  for (int i = 0; i < n; i++)
  {
    acc += arr[i];
    if (lookup.find(acc) != lookup.end())
    {
      auto it = lookup.find(acc);
      while (it != lookup.end() && it->first == acc)
      {
        int len = i - (it->second + 1);
        max_len = std::max(len + 1, max_len);
        it++;
      }
    }
    lookup.insert(std::pair<int, int>(acc, i));
  }
  std::cout << "max len: " << max_len << std::endl;
}
{% endhighlight %}
