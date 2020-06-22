---
layout: post
title: Computing subsets in the presence of duplicates
categories: [algorithms, recursion, C++, power set]
keywords: [recursion, algorithms, C++, power set]
external-url: https://dotkay.github.io/2018/06/04/subsets-dup-rec
---

In our [previous post](https://dotkay.github.io/2018/06/03/subsets-rec/) we saw how to compute all possible subsets of a set and we assumed there are no duplicates. Here, we will remove that restriction and see what modifications need to be done to our previous algorithm in order to accomodate the relaxation. The earlier algorithm referred to the input as a set, and I will continue referring to the earlier algorithm (although in strict mathematical terminology, a set does not have duplicates). So, the title of the post itself is misleading if you are a mathematics police.

First, let us understand what would be the output of our algorithm on an input set (or a list) that contains duplicates, say `[1 2 2]`. It is going to be:
```
[]
[1]
[1 2]
[1 2 2]
[1 2]
[2]
[2 2]
[2]
```

As you notice, there are duplicates in the result set as well `[1 2]`, `[2]`, etc. A careful observer must have already noticed that it requires just a one line change. Intuitively before we pick elements from our input set (containing duplicates) and insert them into our intermediate result set, we just need to check if we already encountered the element. If we sorted the input set _à priori_, the duplicates would be staying together and this would allow us to prevent inserting an element to our intermediate set a second time, if the previously inserted element was the same. In our traversal loop, we just need to check for this condition before we insert.

{% highlight cpp %}
for (int i = start_index; i < input_size; i++)
{
if (i != start_index && (input_set[i] == input_set[i-1]))
  break;
...
...
{% endhighlight %}

Also, we sort the input set before we call the procedure:
{% highlight cpp %}
std::sort(input_set.begin(), input_set.end());
all_subsets_rec(result, int_result, input_set, 0);
{% endhighlight %}

Try it out and convince yourself.