---
layout: post
title: Python, immutable data-types and memory management
categories: [immutable, memory management, Python]
keywords: [immutable, memory management, Python]
external-url: https://dotkay.github.io/2018/06/01/python-var-mem-mgmt
---

I recently started coding in Python as I was playing around with data science, statistics and machine learning libraries. As I started writing more and more Python (Python 3) code, I also started exploring how different it is from C/C++. Although I am very familiar with programming languages like OCaml, Python is giving me more surprising discoveries than in any other languages I have played with. Let us look at some of those together.

First is how Python's memory management handles immutable and mutable data-types. For beginners, in Python everything is an object. Something declared like 

```python
a = 10
```

results in an `int` object `a` that references a memory location. The memory location referenced by the object can be determined by using `id()` function and by convention you denote it in Hexadecimal number, so one often does `hex(id(a))`.

Now, let us see what is the memory referenced by our variable (actually a Python object) `a`.

```python
print('memory referenced by a: {0}'.format(hex(id(a))))
```

and it returns `0x7ffd06a5a2b0`. Now, let us reassign `a` to value `20`. Now, we see that memory referenced has changed to `0x7ffd06a5a3f0`, instead of changing the value in the location referenced earlier. 

```python
a = 20
print('memory referenced by a: {0}'.format(hex(id(a))))
```

<br>
<div class="img_container">
![Python Memory Management](/assets/images/py/var_mem_mgmt_2.PNG){:class="img=responsive"}
</div>

In programming languages like C or Java, the contents in the memory would be changed. However, in Python a new reference is created to a memory location containing the (updated) value `20`. Now our previous int object is not referencing anything and Python's garbage collector would reclaim it. 
