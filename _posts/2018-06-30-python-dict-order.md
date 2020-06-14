---
layout: post
title: Python, dictionaries, mutation and insertion order
categories: [mutable, dict, memory management, insertion order, Python]
keywords: [mutable, dict, memory management, insertion order, Python]
external-url: https://dotkay.github.io/2018/06/30/python-dict-order
---

In an [earlier post](https://dotkay.github.io/2018/06/24/python-tuple-mem-mgmt/), we saw tuples, which are immutable data-types in Python, but in the case of a tuple of lists, we were able to modify the contents of the list. Now, we will see dictionary objects in Python and see if they behave as expected. Recall that dictionaries are mutable objects in Python.

```python
def mem_addr(item):
    return hex(id(item))

d1 = dict(k1 = 1, k2 = 'a')
print('memory referenced by d1: {0}'.format(mem_addr(d1)))
```

The memory referenced by `d1` seems to be `0x28be6286ee8`. Now, let us try to modify the contents of our dictionary. In particular, let us add a new key and a corresponding value.

```python
d1['k3'] = 10.5
print('memory referenced by d1: {0}'.format(mem_addr(d1)))
```

The memory referenced by `d1` still seems to be `0x28be6286ee8`. So, dictionaries seem to be well behaved. I like them.

However, for people who are still stuck with an older version (Python <= 3.5) and moving to Python >= 3.6, there are some surprises with dictionaries. For example, let us try with Python 3.6 first:

```python
d2 = { 'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5, 'f': 6, 'g': 7, 'h': 8, 'i': 9 }
print(d2)
```

prints out:
```
{'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5, 'f': 6, 'g': 7, 'h': 8, 'i': 9}
```

And if you notice, the keys are in order they were specified when `d2` was created. With Python <= 3.5 however, this was the output:
```
{'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5, 'f': 6, 'g': 7, 'h': 8, 'i': 9}
```

The reason for the above surprise is just that in Python 3.6 dictionaries got an order-preserving implementation and it became a standard since Python 3.7. 