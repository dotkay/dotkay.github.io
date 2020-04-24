---
layout: post
title: Python, mutable data-types (lists) and memory management
categories: [mutable, memory management, Python]
keywords: [mutable, memory management, Python]
external-url: https://dotkay.github.io/2018/06/06/python-lists-mem-mgmt
---

In one of our [previous posts](https://dotkay.github.io/2018/06/01/python-var-mem-mgmt/) we saw how Python's memory management handles immutable variables in a program. Lists in Python are mutable. Let's see how it works out.

Let us consider a list `l1` that contains `[1, 2]` and see what memory address it references. 

```python
def mem_addr(item):
    return hex(id(item))

l1 = [1, 2]
print (l1)
print ('memory referenced by l1: {0}'.format(mem_addr(l1)))
```

In my execution, it seems to reference the memory address `0x1d49c799e48`. Now, let us concatenate a list containing a single element `[3]` to `l1`. Since lists are mutable, shouldn't we expect the new list created out of concatenation to reference the same memory location? Let's check it out.

```python
l1 = l1 + [3]
print (l1)
print ('memory referenced by l1: {0}'.format(mem_addr(l1)))
```

<br>
<div class="img_container">
![Python Memory Management](/assets/images/py/list_mem_mgmt_1.PNG){:class="img=responsive"}
</div>

We see that it references a new memory location (in my case `0x1d49c79bc08`) different from the earlier one. What is happening? Aren't lists *mutable* objects? Let us see in future posts when the memory manager would reference newly created lists to the same memory location as the initial list. Till then, play around with Python and discover more quirks.