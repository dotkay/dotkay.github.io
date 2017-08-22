---
layout: post
title: Learning to count set bits
categories: [algorithms, C]
keywords:
external-url: https://dotkay.github.io/2017/08/21/learning-to-count-set-bits
---

Let's take a break from recursion and learn to count the number of bits set in an integer. For example, in an integer say `9` there are two set bits. Of course, we will be dealing with unsigned integers and the number of bits set is in the binary representation (the language that our computers understand and speak). We already saw how to convert an integer to binary in one of our [previous posts](https://dotkay.github.io/2017/08/15/more-simple-recursion-examples/). You may want to refer to that in case you want to quickly refresh your memory.

Let's work out the first technique we would use. Let's take the integer `9`. It's binary representation is `1001`. So, there are two set bits. Looks very intuitive - start from the right-most bit, have a counter and start counting the set bits, while right shifting our bit string. We just need a counter to keep track of the count and two operations - right shift and an operation to identify a set bit. Let's see how to do that. 

1. We initialize a counter, call it `count` to 0. 
2. We do a bitwise `&` with `1`. This would identify if a bit is set. If it's set, we would increment `count`.
3. Right shift our original input and continue till we encounter 0 (terminating condition for our loop).

```
   n  	       n&1 	    	  count
   1001	       			  0
               0001		  1
   0100	       0000		  1
   0010	       0000		  1
   0001	       0001		  2
   0000	        -		  2
```

final result = 2

Let's write a quick C function:

{% highlight c %}
unsigned int count_set_bits (unsigned int n) 
{
    unsigned int count = 0;
    while (n) {
        count += n & 1;
        n >>= 1;
    }
    return count;
}
{% endhighlight %}

There's a better way to do this, thanks to [Brian Kernighan](https://www.cs.princeton.edu/~bwk/)'s algorithm. He observed that subtracting a `1` toggles all the bits upto and including the right-most set bit. For example, if you subtract `1` from `1010`, it results in `1001` - the last two bits, `0` and the right-most set bit `1` got flipped. Now, if we perform a bitwise `&` of this result with the original number, effectively we would be unsetting the right-most set bit. Let's work out an example to understand it better. Let's start again with `1001` (9).

```
  n       n-1    n&(n-1)      count
1001     1000     1000          1
1000     0111     0000          2
0000      --       --           2

```

final result = 2. Note that we loop only as many times as the number of set bits, unlike the previous case.

Let's write a quick C function:

{% highlight c %}
unsigned int BK_count_set_bits (unsigned int n) 
{
    unsigned int count = 0;
    while (n) {
        n &= (n-1);
        count++;
    }
    return count;
}
{% endhighlight %}

That's all for now. Let me get my head around other bits and pieces before my next post.