---
layout: post
title: Is This Program Correct?
categories: [C, bugs, program verification]
keywords: [C, bugs, program verification, formal methods]
external-url: https://dotkay.github.io/2019/02/03/is-this-program-correct
---

Over the last couple of decades we have come to rely more and more on software. They have occupied more of our lives than any other artifact like television or automobiles (which themselves are beginning to be run more by software). We entrust them with our passwords, bank account numbers, personal details, email gossips, etc. But are they correct? Can they also be imperfect like us humans and consequently harm others that trusted them? We will explore how small and silly bugs in programs can lead to severe consequences. Since most safety critical software is written in C, we will stick to examples using the C programming language. But most of these could be extended to Java (may not be to Rust or other languages though).

__Is this program correct?__

Below is a simple implementation of Binary Search as found in several text-books, production software, etc. The input parameters are an array `arr` of size `n` and we are interested in searching for a target element `t` using binary search. If the target element is not found, we will return `-1` and if found, we will return the index of the element in the array.

{% highlight cpp %}
int bsearch(int arr[], int n, int t)
{
  int lo = 0;
  int hi = n - 1;
  int mid;
  while (lo <= hi)
  {
    mid = (lo + hi)/2;
    if (arr[mid] == t)
      return mid;
    if (arr[mid] < t)
      lo = mid + 1;
    if (arr[mid] > t)
      hi = mid - 1;
  }
  return -1;
}
{% endhighlight %}

What could go wrong in this program? One can write a bunch of unit tests and it would, most likely, go through fine. And if you think there is some very corner case scenario that is happening here, you are not alone. This bug was undiscovered for decades - we all know binary search algorithm is not something new. When this was discovered, it turned out that not only this binary search algorithm, but many others that involve binary search as a sub-routine was also wrong. [Google's blogpost on this](https://ai.googleblog.com/2006/06/extra-extra-read-all-about-it-nearly.html) goes into interesting details and it turns out it also [existed in JDK](https://bugs.openjdk.java.net/browse/JDK-6412541). 

The bug is related to arithmetic overflow when computing `mid` in:

{% highlight cpp %}
mid = (lo + hi)/2;
{% endhighlight %}

A potential fix for this would be to rewrite the above as:

{% highlight cpp %}
mid = lo + ((hi - lo)/2);
{% endhighlight %}

After all, we should not be trusting our programs as much as we do, before analyzing them.