---
layout: post
title: Python, immutable data-types again, and memory management
categories: [immutable, tuples, memory management, Python]
keywords: [immutable, tuples, memory management, Python]
external-url: https://dotkay.github.io/2018/06/18/python-tuple-mem-mgmt
---

In an [earlier post](https://dotkay.github.io/2018/06/01/python-var-mem-mgmt/) we saw how Python's memory management behaves when dealing with immutable objects. In this post, let us see another immutable object, this time a *tuple* and examine how Python deals with it.

Let us consider a tuple of integer objects `t = (1, 2, 3)`. We see that it references memory address `0x1dd65ac45e8`

```python
def mem_addr(item):
    return hex(id(item))

t = (1, 2)
print('memory referenced by t: {0}'.format(mem_addr(t)))
```

What happens if we try to mutate or update the tuple object above, `t`? We see that it creates a new reference to a new object (at `0x1dd65a514c8`), instead of updating the earlier object. And the earlier reference would be reclaimed by the garbage collector. 

<br>
<div class="img_container">
![Python Memory Management](/assets/images/py/tup_mem_mgmt_1.png){:class="img=responsive"}
</div>

```python
t = (1, 2, 3)
print('memory referenced by t: {0}'.format(mem_addr(t)))
```

This is because *tuples* are immutable objects, more like integer objects we saw in an [earlier post](https://dotkay.github.io/2018/06/01/python-var-mem-mgmt/). 

So, all is clear and good, right? Wait until a future post on tuples again.