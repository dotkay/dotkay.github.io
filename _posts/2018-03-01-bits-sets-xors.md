---
layout: post
title: Of bits, sets and xors...
categories: [algorithms, bitwise operations, bit-vectors, C++]
keywords: C++, bitwise operators, bit-vectors
external-url: https://dotkay.github.io/2018/03/01/bits-sets-xors
---

As ambiguous as the title may sound the contents of this topic would also surprise you every now and then. Yes, we are going to talk about bit-vectors and bitwise operations in C or C++.

As we have been taught several times since childhood, computers can understand only 1s and 0s. We humans have 10 fingers and so we started counting in decimal number system (10 digits 0..9 and every other number is made of these 10 digits). However as present day computers use digital circuits one needed to invent a number system for the underlying functionality of transistors. To make things simple, they decided to interpret a voltage above a certain threshold as 1 and the voltage below a certain other threshold as 0 and all our computations revolve around it. For those interested in technology history, [ENIAC was actually a decimal machine](https://history-computer.com/ModernComputer/Electronic/ENIAC.html).

Since our computers (as of now) are binary machines, everything - chars, strings, structs, music and videos are all represented as 0s and 1s. And we have primitive operations on these bits. Sounds like we are moving back to stone age, but be patient - we use these low level operations in system software even today due to the speed of such operations. We will concern ourselves with the most basic bitwise operations as below:

```
&      -  Bitwise AND
|      -  Bitwise OR
~      -  Bitwise complement (i.e. negation)
^      -  Bitwise XOR
>>     -  Bitwise right-shift
<<     -  Bitwise left-shift
```

As a quick note, `>>` can also be used for division by 2. For example 4 is `0100` in binary and `4 >> 1` would amount to `0010` which is 2 (4 / 2 = 2) and this on further shift `2 >> 1` results in `0001` which is 1 (2 /2 = 1).

Similarly, `<<` can also be used for multiplication by 2. For example 2 is `0010` in binary and `2 << 1` would result in `0100` which is 4 (2 * 2 = 4). 

One more quick aside is _2's complement_ - which is just a way of representing negative numbers. For example -2 would be represented (if we are allowed only 3-bits to represent) as `110` which is 2^3 - 2. In general, _-n_ in 2's complement is just `2^k - n` where _k_ is the number of bits used to represent it.
