---
layout: post
title: Checking for string rotations
categories: [algorithms, data structures, strings]
keywords: C++, data structures, strings
external-url: https://dotkay.github.io/2018/04/03/string-rotation-check
---

Today, let us play with some examples using "strings". Let us see if we can write a function which, given two strings, would tell you if the input strings are rotations of each other. For example, `anna` and `naan` are rotations of each other while `anna` and `nana` are not. More simply, two strings are rotations if you can get from on to the other while moving the characters in order (without over-stepping):

```
a-n-n-a   --> 0. original string
n-n-a-a   --> 1. rotated by 1 ('a' moves to the end)
n-a-a-n   --> 2. rotated by 1
```

A very simple algorithm would just concatenate one of the input strings with itself and try to find the second string in the concatenation of the first. In the above example, this would be:

1. Concatenate one of the strings with itself. Say, we choose `anna` to concatenate and form the concatenated one `annaanna`
2. Search for the occurence of the second string `naan` in the concatenation,
3. We see that `naan` is indeed a substring of the concatenation _an_**naan**_na_ and a rotation of `anna`. 

{% highlight cpp %}
bool str_rotation(std::string s1, std::string s2)
{
  if (s1.length() != s2.length())
    return false;
  std::string concat_str;
  concat_str = s1 + s1;
  int res_pos = concat_str.find(s2);
  if (res_pos == std::string::npos)
    return false;
  else 
    return true;
}
{% endhighlight %}

A caveat here is to check for the length of the two strings _a priori_. This is to avoid sub-strings of smaller length that would be identified as rotations by our algorithm. For example, without this check, we would deduce `ann` to be a rotation of `anna`.
