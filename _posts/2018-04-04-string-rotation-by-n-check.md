---
layout: post
title: Checking for string rotations by a fixed length
categories: [algorithms, data structures, strings]
keywords: C++, data structures, strings
external-url: https://dotkay.github.io/2018/04/04/string-rotation-by-n-check
---

In [yesterday's post](https://dotkay.github.io/2018/04/03/string-rotation-check) we saw how to check if two given strings are rotations of each other. Today, we will add one other restriction to the problem and try to solve it. What if the algorithm needs to check if the two input strings are rotations of each other by a fixed length `n` which is also provided as an input to the function? For example, `anna` and `naan` are rotations of each other by `2` as we need to make two rotations (each rotation moves only 1 character) to get from one string to the other and similarly one cannot be obtained from the other by rotation of just 1.

We use the same algorithm as before, but this time we will be careful to store the index position (when we search for one of the strings in the concatenation) and match it against the input `n`.

{% highlight cpp %}
bool str_rot_by_n(std::string s1, std::string s2, int n)
{
  if (s1.length() != s2.length())
    return false;
  int index;
  std::string s = s1 + s1;
  index = s.find(s2);
  if (index == std::string::npos)
    return false;
  else
  {
    if (index == n || (index == (s1.length() - n)))
      return true;
    else
      return false;
  }
}
{% endhighlight %}

Again, we have to check if the lengths of the input strings are the same. Without this check, we migth deduce that `ello` can be obtained from `hello` by rotating through `1` character position.
