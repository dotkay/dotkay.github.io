---
layout: post
title: Checking if a string is an isogram
categories: [algorithms, data structures, strings]
keywords: C++, data structures, strings
external-url: https://dotkay.github.io/2018/04/07/string-isogram
---

> A string is an isogram if no character in it appears more than once.

Let us write a simple algorithm to identify if a given input string is an isogram. For simplicity let us consider only strings that have small characters and no spaces or special characters i.e. - only characters from _a_ to _z_.

In our previous post, we learnt how to keep track of characters that appear in a string as we traverse the input string. We use the same idea here, just this time we simplify it to be 26 characters (_a_ to _z_) instead of 256.


1. We traverse the input string and maintain a counter for each of the occurences in the string. Note that we subtract 'a' from the ASCII value as our strings contain only _a_ to _z_ and we want our index `0` to correspond to _a_. The intention of this simplification was precisely to learn how to modify our algorithm for such specific use cases.
2. We traverse the counter array (which is essentially a mapping `seen: character -> count` to see if any of the characters appeared more than once (i.e. their count mapping is greater than 1).

{% highlight cpp %}
#define MAX_CHARS 26
bool isogram(std::string s)
{
  int seen[MAX_CHARS] = {0};
  int slen = s.length();
  bool res = true;

  // (1)
  for (int i = 0; i < slen; i++)
    seen[s[i] - 'a']++;

  // (2)
  for (int i = 0; i < 26; i++)
  {
    if (seen[i] > 1)
    {
      res = false;
      break;
    }
  }
  return res;
}
{% endhighlight %}


