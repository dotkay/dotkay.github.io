---
layout: post
title: Python, immutable objects and memory management, again
categories: [immutable, tuples, memory management, Python]
keywords: [immutable, tuples, memory management, Python]
external-url: https://dotkay.github.io/2018/06/24/python-tuple-mem-mgmt
---

In an [earlier post](https://dotkay.github.io/2018/06/18/python-tuple-mem-mgmt/), we saw how immutable objects like tuples are handled by Python's memory management. It was straight-forward - tuples are immutable and so, when we try to update the tuple object, Python creates a new reference. Or does it? Always?

Let us consider the following tuple, this time a *tuple of lists*. Recall that lists in Python are mutable objects.

```python
def mem_addr(item):
    return hex(id(item))

a = [1, 2]
b = [4, 5]
t = (a, b)
print(t)
print('memory referenced by t: {0}'.format(mem_addr(t)))
```

And our output:
```
([1, 2], [4, 5])
memory referenced by t: 0x2103c874a48
```

We see that the memory referenced by the object `t` which in our case is a tuple is `0x2103c874a48`. And we know that tuples are immutable objects in Python. So, let's try to change the above tuple object `t`. This time we are going to do that by updating the individual elements `a` and `b` that constitute our tuple object.

```python
a.append(3)
b.append(6)
print(t)
print('memory referenced by t: {0}'.format(mem_addr(t)))
```

And we get the following printed:
```
([1, 2, 3], [4, 5, 6])
memory referenced by t: 0x2103c874a48
```

<br>
<div class="img_container">
![Python Memory Management](/assets/images/py/tup_mem_mgmt_2.png){:class="img=responsive"}
</div>

And what just happened here? Our immutable object `t` got updated without a new reference being created. So, it is not just the object itself that matters, the type of the constituent objects also plays a role in memory management. Hope this is enough motivation to play around with different mutable and immutable objects and how Python's memory management handles them.