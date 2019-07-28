---
layout: post
title: Checking if two strings are isomorphic
categories: [algorithms, data structures, strings]
keywords: C++, data structures, strings
external-url: https://dotkay.github.io/2018/04/06/isomorphic-strings
---

Today, let us see how we can figure out if two given input strings are _isomorphic_ using a time-efficient algorithm.

> Given two strings s1 and s2 if there is a unique mapping from each of the characters of one to the other, then they are isomorphic

For example, `anna` and `naan` are isomorphic with the mapping `a -> n` and `n -> a`. Similarly `aab` and `xxy` are isomorphic with the mapping `a -> x` and `b -> y`, while `aab` and `xyz` are not isomorphic. However, `anna` and `naa` are not isomorphic as there is no direct mapping for the last `a` of `anna` (a hint that the strings should be of equal length for them to be isomorphic).

An approach is to traverse one of the strings and mark the occurence of the character in the string. The nice thing about character strings is that there are only 256 [ASCII characters](https://en.wikipedia.org/wiki/ASCII) and hence we can have a character array of size 256 to mark the occurence of characters in a string. Along with marking the occurence, we need to store the mapping of this character to the corresponding (array index) character of the second string.

1. During the very first encounter of a character, say the first `a` (index 0) in `anna`, we check if the corresponding index in the other string `naan` has already been visited.
2. We visit it (i.e. remember it in some algorithmic way). 
3. We store the mapping of this visit (i.e. `a -> n`). 
4. If we encounter a character again, say the last `a` in `anna`, we check for the mapping to see if the corresponding index in the second string is as per our expectations (i.e. obeys the mapping).

The way we maintain the mapping is through an array `map` and we also maintain whether we already visited a particular character using an array `visited`. Since we need two additional arrays of size 256 each, there is some cost we pay for this space. However, we traverse the input array only once and so it would be _O(n)_ time algorithm. These four steps are noted in the code fragment below for easier reference. 

{% highlight cpp %}
#define MAX_CHARS 256
bool isomorphic(std::string s1, std::string s2)
{
  bool visited[MAX_CHARS] = { false };
  int map[MAX_CHARS];

  // initialize map
  for (int i = 0; i < MAX_CHARS; i++)
    map[i] = -1;

  // check if both strings are of equal length
  int slen1 = s1.length();
  int slen2 = s2.length();
  if (slen1 != slen2)
    return false;

  // traverse s1 and update marked and visited
  for (int i = 0; i < slen1; i++)
  {
    // (1) first occurence
    if (map[s1[i]] == -1) 
    {
      // check if corresponding s2 char is visited
      if (visited[s2[i]] == true)
        return false;

      // (2) update visited
      visited[s2[i]] = true;                          

      // (3) store mapping
      map[s1[i]] = s2[i];                             
    }
    // (4) not the first occurence? check the mapping
    else if (map[s1[i]] != s2[i]) 
      return false;
  }
  return true;
}
{% endhighlight %}


