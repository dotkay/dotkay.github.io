---
layout: post
title: How About This Program? Is This Correct?
katex: True
categories: [C, bugs, program verification]
keywords: [C, bugs, program verification, formal methods]
external-url: https://dotkay.github.io/2019/02/13/is-this-program-correct
---

Most system software is written in C. Besides being one of the oldest programming languages C has arbitrary memory address access and pointer arithmetic that made it attractive for several applications. Further, the memory footprint of C and small runtime made it the preferred language for embedded applications. It is no surprise that most of the software that we encounter in our everyday life has at least some (or in many cases most) part of it written in C.

Overtime, several libraries were developed for C which made programming in C fast and easy. Let us look at a small C function `copy_data()` that uses one such library function `memcpy(dest, src, n)` that copies *n* bytes from a *src* memory to *dest* memory area. 

```C
void copy_data(char *buf, int len)
{
  char tmp[80];
  if (len > sizeof(tmp))        // [A]   
    return -1;
  
  memcpy(tmp, buf, len);        // [B]
  printf("copied data: %s\n", tmp);
}
```

Our tiny C function `copy_data` has a pointer to a character buffer `buf`. We intend to copy `len` bytes from `buf` to `tmp`. We call the `memcpy(...)` function passing `tmp`, `buf` and `len`. Looks simple and clean. But is it correct? Think about it.

Although this function looks simple enough to just visually review for correctness, there is a subtle bug. An user of the function could pass a negative value for `len` and pass the check at `[A]`. At `[B]` is where this gets manifested. `memcpy()` takes an *unsigned int* as the `len` parameter and hence a negative value for `len` would be interpreted as a huge unsigned value at `[B]`, causing the memory beyond `tmp` to be overwritten. 