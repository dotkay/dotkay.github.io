---
layout: post
title: Python, lists and memory management
categories: [mutable, lists, memory management, Python]
keywords: [mutable, lists, memory management, Python]
external-url: https://dotkay.github.io/2018/06/12/python-lists-mem-mgmt-2
---

In an [earlier post](https://dotkay.github.io/2018/06/06/python-lists-mem-mgmt/), we saw how lists, despite being *mutable* objects in Python are somewhat confusing when it comes to certain operations. Let us play some more and see how they behave when we concatenate lists using `append()`. 

```python
l1 = [1, 2]
print (l1)
print ('memory referenced by l1: {0}'.format(mem_addr(l1)))
```

In my execution the memory referenced by `l1` seems to be `0x2e70a4bc208`. Now, as in [our earlier example](https://dotkay.github.io/2018/06/06/python-lists-mem-mgmt/), let us append `3` to l1, but this time using the `append()` function.

```python
l1.append(3)
print (l1)
print ('memory referenced by l1: {0}'.format(mem_addr(l1)))
```

<br>
<div class="img_container">
![Python Memory Management](/assets/images/py/list_mem_mgmt_2.PNG){:class="img=responsive"}
</div>

Now, we see that the new list object (after appending `3`) references the same memory `0x2e70a4bc208` as before. So, when it comes to `append()` Python's memory manager seems to treat lists as a real mutable object. Python developers, especially new ones, need to be careful and understand these quirks thoroughly.