---
layout: post
title: Computing GCD (greatest common divisor) of two given integers
categories: [algorithms, C++, recursion]
keywords: C++, recursion, GCD
external-url: https://dotkay.github.io/2017/10/09/computing-gcd
---

Today, let us see how to compute the greatest common divisor (GCD) of two given input numbers. Although it is a very easy problem with a relatively straight-forward implementation, the beauty of the problem is that the algorithm was discovered more than 2000 years ago by a Greek mathematician Euclid, after whom the algorithm is named.

It uses the concept of modular arithmetic as discussed in the [previous post](https://dotkay.github.io/2017/10/08/mod-arith). Put simply, the _gcd_ of two given integers x and y is just the greatest number that divides both x and y. For example, the greatest common divisor of both 6 and 9 is 3. The obvious approach to compute the _gcd_ if two given numbers is to factor both the numbers, pick out the common factors and multiply them. For example, 6 = 1 x 2 x 3 and 9 = 1 x 3 x 3, and the common factors being 1 and 3. Euclid's algorithm uses the following formula: 

If `x >= y`, `gcd(x, y) = gcd(x mod y, y)`. As you see, the recursion is built in the description itself. Here's an implementation:

{% highlight cpp %}
int euclid_gcd (int x, int y) {
  // base case
  if (y == 0)
    return x;
  else
    return euclid_gcd(y, x % y);
}
{% endhighlight %}

One has to note that in the recursive call, the first argument became `y` and the second `x mod y`. This is because of the following lemma:

> If `x >= y`, then `x mod y < x/2`. 

So, the arguments x and y decrease with each recursive call. The applications of modular arithmetic is very wide, some of which we will see in future posts.