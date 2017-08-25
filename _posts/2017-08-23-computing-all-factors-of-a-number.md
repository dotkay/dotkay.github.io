---
layout: post
title: Computing factors of a number
categories: [algorithms, C++]
keywords: [algorithms, C++]
external-url: https://dotkay.github.io/2017/08/23/computing-all-factors-of-a-number/
---

Let's look at a quick algorithm to compute all factors of a number `N`. For example, if `N` is `12` we want all the factors `[1, 2, 3, 4, 6, 12]`. If `N` is say `36` we want `[1, 2, 3, 4, 6, 9, 12, 18, 36]`. We observe that:

1. `1` and `N` itself are always factors, of course.
2. Factors always occur in pairs. `(1, 12), (2, 6), (3, 4)` etc. If `N` is a perfect square, we also have $$(\sqrt{N}, \sqrt{N})$$.  

From the above we realize that we don't need to iterate through the numbers all the way until `N`. We just need to do it until $$\sqrt{N}$$. Here's the algorithm for computing all the factors:

{% highlight cpp %}
std::vector<int> all_factors (int N) {
    std::vector<int> result;
    result.push_back(1);
    result.push_back(N);
    for (int i = 2; i < (int)sqrt(N); i++) {
        if ((N % i) == 0) {
            result.push_back(i);
            if (i != (int)sqrt(N))
                result.push_back(N/i);
        }
    }
    return result;
}
{% endhighlight %}

That was a super short post! 