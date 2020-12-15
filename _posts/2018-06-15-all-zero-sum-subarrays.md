---
layout: post
title: Finding all subarrays that sum to 0
categories: [data structures, arrays, algorithms, C++]
keywords: [data structures, arrays, algorithms, C++]
external-url: https://dotkay.github.io/2018/06/15/all-zero-sum-subarrays
---

In our [previous post](https://dotkay.github.io/2018/06/10/zero-sum-subarray-improved) we saw how to check if there is a subarray (formed of consecutive array elements) that sums to zero, in linear time. We were also thinking how to go about storing all the subarrays that sum to 0, as there could be more than one. Since we returned a Boolean result as soon as we found a subarray that sums to zero, we did not manage to find the second subarray that sums to 0, if such a subarray exists. Now, we will make an attempt to do that.

Intuitively, we know that we need to traverse the array as before and keep track of the accumulated sum of array elements as we traverse. We hash these values and do a lookup of it every time we encounter a new element (and hence an updated accumulator value) as we traverse.

```
     [initial subarray][0 sum subarray][some subarray][0 sum subarray][last subarray]
     <--------------- x ------------- y ------------ x'------------- y'------------->
```

At `y` we may find that the accumulator value already exists in our hash (as the subarray in the window between `x` and `y` sums to 0). On a lookup at `y`, we would get the index pointing to `x` and our current iterator (say `i`) would be at `y`. We can print out the values between `x` and `i` (or store it in some container), keep traversing the array until we encounter the ending index `y'` of the next subarray that sums to 0.

{% highlight cpp %}
void all_zero_sum_subarr(std::vector<int> arr)
{
  int n = arr.size();
  std::unordered_multimap<int, int> lookup;
  lookup.insert(std::pair<int, int>(0, -1));
  int acc = 0;
  for (int i = 0; i < n; i++)
  {
    acc += arr[i];
    if (lookup.find(acc) != lookup.end())
    {
      auto it = lookup.find(acc);
      while (it != lookup.end() && it->first == acc)
      {
        std::cout << it->second + 1 << ".." << i << std::endl;
        it++;
      } 
    }
    else
      lookup.insert(std::pair<int, int>(acc, i));
  }
}
{% endhighlight %}

Can you see why we are using `unordered_multimap` instead of `unordered_map` here?
