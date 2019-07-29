---
layout: post
title: Searching for occurence of a pattern in a string
categories: [algorithms, data structures, strings]
keywords: C++, data structures, strings
external-url: https://dotkay.github.io/2018/04/09/string-pattern-search
---

Let us write a very simple program to implement a simple variant of _str.find()_ that we used in our [previous post](https://dotkay.github.io/2018/04/04/string-rotation-by-n-check). Basically, we want to write a function that accepts an input string and a pattern string and identifies if the pattern forms a substring of the input string and if it does tells us the _first_ index position of occurence in the input string.

The naïve way is to traverse the input string looking for the pattern string. In order to do this, whenever we encounter the first character of the pattern string in the input string, we need to remember it and check if the following characters in the input string are the subsequent characters in the pattern string as well. We need to do this check (if successful) for as many characters as the length of the pattern string - quite intuitive. 

1. Traverse the input string
2. As we traverse the input string, check if we encounter the first character of the pattern string
  1. If the pattern string's first character _does not_ match the current index character of the input string, keep moving forward in the input string while still waiting for a match for the first character of the pattern string.
  2. If the pattern string's first character _does_ match the current index character of the input string, move forward in the pattern string and check if the second character of the pattern string matches the next character in the input string
  3. If we successfully match the subsequent characters of input string and we have reached the end of the pattern string (i.e. successfully matched as many characters as the length of the pattern string) return the index of the input string that matched the first character of the input string (from 2.2)

Let us write it down as a C++ function:

{% highlight cpp %}
int pat_search(std::string s, std::string pat)
{
  int slen = s.length();
  int plen = pat.length();
  int res = -1;
  for (int i = 0; i < slen; i++)
  {
    int j;
    for (j = 0; j < plen; j++)
    {
      if (s[i+j] != pat[j])
        break;
    }
    if (j == plen)
      return i;
  }
  return res;
}
{% endhighlight %}

This algorithm however matches only the first occurence of the pattern and not all occurences (there might be more than one occurence of the pattern in the input string). How do we modify the above algorithm to handle this case?



