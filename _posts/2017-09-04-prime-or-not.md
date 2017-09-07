---
layout: post
title: Prime or not?
categories: [algorithms, C++]
keywords: [algorithms, C++]
external-url: https://dotkay.github.io/2017/09/04/prime-or-not
---

Let's look at a simple problem if figuring out if a given number is a prime number or not? And how best we can compute it.

> A prime number is a whole number greater than 1, that are *only* divisible by itself and 1.

A naïve approach is to check if the number is divisble by all the numbers starting from 2 to itself. We start from `2` as it is our first prime number.

{% highlight cpp %}
bool is_prime(int n) {
  for (int i = 2; i < n; i++) {
    if (n % i == 0)
      return false;
  }
  return true;
}
{% endhighlight %}

But, can we do better? Notice that we need to check for numbers only less than or equal to the square root, say `sq` of the given number `n` to be tested. If there's a number that divides `n` and which is greater than `sq`, the result of that division would be a number less than `sq`. For example let's say `n = 26` and we want to figure out if `n` is prime. We are claiming that we need to check only until the square root of `26` - rounded down to `5`. Let's pick a number that divides `26`, say `13` and this number on dividing `26` yields `2`. So when we start to check from `2` to `5`, we would have already figured out that it is divisible by `2` and is not a prime. We just ran into another beautiful fact: 

> there are no even primes greater than 2

That would let us optimize our loop further - if we initially checked whether `n` is not `2`, we would check only every other (odd) number to see if it divides.

{% highlight cpp %}
bool is_prime(int n) {
  if (n <= 1) return false;
  if (n == 2) return true;
  if (n % 2 == 0) return false;
  int m = (int)sqrt(n);
  for (int i = 3; i <= m; i+=2) {
    if (n % i == 0)
      return false;
  }
  return true;
}
{% endhighlight %}

Primes are beautiful. Hopefully, I will write more posts on them in future.