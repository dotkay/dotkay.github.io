---
layout: post
title: Checking if a kth bit in a bit-vector is set
categories: [algorithms, bitwise operations, bit-vectors, C++]
keywords: C++, bitwise operators, bit-vectors
external-url: https://dotkay.github.io/2018/03/02/checking-set-bit
---

Armed with the primitive bitwise operators, let us starting playing with some bit-vectors and use these opertors to do some fancy computations. As a first example, let us see how to check if the _k_-th bit is set in a given bit-vector _n_ and an integer _k_. For example, in the binary representation of 10 which is `1010`, 2nd and 4th bits are set.

Here's the approach

1. We first want to generate a number whose only _k_-th bit is set. For example, if the given _k_ is 4, we want to generate a number whose only 4th bit is set.
2. Now, we *bitwise AND* the number generated above with the given bit-vector. 
3. If the result is non-zero then the k-th bit is set. 

Let us work out an example: Say we are given the number 9 and asked if the 1st bit is set (so _n_ is 5 (`101`) and _k_ is 3). we see that the 3rd bit is indeed set - our algorithm should return `true`.

1. Let us choose `100` since _k_ is set. i.e., we generated this bit-vector where _only_ the _k_-th (3rd here) bit is set. In a short while, we will see how to generate this bit-vector
2. We do a bitwise AND of this generated vector with input bit-vector _n_. `101 & 100` which yields `100`
3. `100` is non-zero and so our algorithm returns `true`.

Coming to step 1., how do we go about generating a bit-vector whose only _k_-th bit is set? The intuition lies in the way numbers are represented in binary. The bit positions are essentially powers of 2. For example, 1 is represented as `0001` (assuming we use 4 bits to represent a decimal number) - only the bit in the first position is set and this corresponds to 2^0. The second position corresponds to 2^1, third 2^2 and so on. 10 is represented as `1010` where second and fourth bits are set - i.e 2^1 and 2^3 bits are set (2^1 + 2^3 = 10). (Please refer to the conversions between decimal and binary [here](https://dotkay.github.io/2017/08/15/more-simple-recursion-examples/)).

And we have this other weapon `<<` that we can use to move a set bit towards the left. So, if we left-shift (`<<`) `0001` by 1, we get `0010` (2) and further left-shift yeilds 4 (as each left-shift is just multiplication by 2). We start with 1 and consecutive left shifts gives us bit-vectors where only the bit in a specific location is set and all others are unset. This is the intuition behind generating a bit-vector with a single bit set. So, if we want a bit-vector whose 3rd bit is set, we left-shift `0001` twice. In general if we want a bit-vector whose _k_-th bit is set, we left-shift by _(k-1)_.

The following code fragment illustrates the algorithm:

{% highlight cpp %}
int main()
{
  int N; // no. of test cases
  std::cin >> N;
  while (N--)
  {
    int n, k; // input number, k
    std::cin >> n;
    std::cin >> k;
    int res;
    res = n & (1 << (k-1));
    if (res != 0)
      std::cout << "bit at position " << k << " is set in " << n << std::endl;
    else
      std::cout << "bit at position " << k << " is not set in " << n << std::endl;
  }
  return 0;
}
{% endhighlight %}
