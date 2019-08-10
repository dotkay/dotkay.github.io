---
layout: post
title: How to find out the position of the right-most set bit in a bit-vector?
categories: [algorithms, bitwise operations, bit-vectors, C++]
keywords: C++, bitwise operators, bit-vectors
external-url: https://dotkay.github.io/2018/03/03/checking-rightmost-set-bit
---

As we are getting comfortable thinking in terms of bits and bit-wise operators, let us play with them some more. Let us see how to find the position of the right-most set bit, given a bit-vector? Note that this is different from the [previous](https://dotkay.github.io/2018/03/02/checking-set-bit) problem of checking if the bit in a specific bit position is set. Here, we want to just find the right most set bit, and the position in the bit-vector is not given - we are to find that position.

For example, 10 in binary is `1010` and the right-most set bit is at position 2 (second from the right most digit). Given 10, our algorithm has to output 2. Similarly, 8 in binary is `1000` and given this, our algorithm has to output 4. 

The intuition is that since multiple bits may be set in a bit-vector (unless it is a power of 2) we need to find a way of isolating the right-most set bit and then traverse the vector to find its position in the vector. For example, suppose a bit-vector (with the right-most bit of 10 isolated) is given to us, it would look like `0010`. Now we can write a simple algorithm to check the bit-position of the only bit (the lonely, isolated bit) set in the vector. We already know that we could use right shift operator repeatedly on this bit-vector, until it becomes 0, as follows:

```
0010           -> given bit-vector with only one bit set
0010 >> 1      -> right-shift by 1 position (once)
0001 >> 1      -> right-shift by 1 position (twice)
0000  
```
Quite intuitively, the number of right-shifts we needed to apply is the position of the only set bit. 

Let us write that as a C algorithm:

{% highlight cpp %}
int count = 0;
while (x != 0)  // check for 0
  {
    x = x >> 1; // right-shift
    count++;    // maintain count
  }
return count;
{% endhighlight %}

Now, what operation do we use to find this x above? Or referring to our example, how do we find the vector `0010` that gave us the right-most set bit for our input vector which was `1010`? Think about the properties of bit-vectors, especially negative numbers. 

Stay tuned for a post describing it.

