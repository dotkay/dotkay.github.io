---
layout: post
title: Computing permutations - divide and conquer
categories: [algorithms, C++, recursion]
keywords: Permutations, Divide and Conquer, C++
external-url: https://dotkay.github.io/2017/10/06/computing-permutations
---

In one of the [previous posts](https://dotkay.github.io/2017/09/21/permutations-of-a-list/) we saw how to compute all permutations of a list recursively. Let us attempt the same, but this time with C++, in what is called divide and conquer approach - essentially divide the input into smaller chunks and recursively call the function on each of the smaller chunk.

Let us compute the permutations of say characters in a string. A string of _n_ characters would have _n!_ permutations. For example, if we have the string "ABC", the permutations (6 in all) are:

```
ABC
ACB
BAC
BCA
CBA
CAB
```
We shall do it by going through the string of characters and iteratively swapping each character with the neighbouring character to get the permutation. For example, for the string "ABC":

<br>
![Permutations of "ABC"]
(/assets/images/algorithms/cpp/perm_1.png){:class="img=responsive"}

Here is a function `permute()` implementing the traversal: We are given a string _s_ with starting index _start_ and ending index _end_.

{% highlight cpp %}
void permute(string s, int start, int end) {
  int i;
  if (start == end)
    cout << s << endl;
  else {
    for (i=start; i<=end; i++) {
      swap(s[start], s[i]);
      permute(s, start+1, end);
      swap(s[start], s[i]);
    }
  }
}
{% endhighlight %}

What happens if we use the above algorithms to find permutations of strings that have duplicated characters? For example, the string "AAB" would produce:

```
AAB
ABA
AAB  (*)
ABA  (*)
BAA
BAA  (*)
```

As you can see, we are computing the same permutation more than once (marked with *). How can we modify the above function to handle duplicates?