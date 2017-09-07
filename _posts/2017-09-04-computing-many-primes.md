---
layout: post
title: Computing many primes...
categories: [algorithms, C++]
keywords: [algorithms, C++]
external-url: https://dotkay.github.io/2017/09/05/computing-many-primes
---

In our [previous post](https://dotkay.github.io/2017/09/04/prime-or-not) we saw how to check if a given number is prime. Now, what if we want to find all the primes from `1` to `1000`? Sure, we can call our `is_prime()` function on every number from `1` to `1000` and list out the ones that pass the test. Is there a better way? There absolutely is! And it turns out that it was invented by a Greek mathematician [Etatosthenes](https://en.wikipedia.org/wiki/Eratosthenes), who by the way also happened to invent Geography. The algorithm is commonly referred to as *Sieve of Eratosthenes*. 

We start by assuming that all the numbers, say `1` to `n` are primes. Assume we have an array of size `n` and we marked all the elements as prime. Now, we traverse the array and start marking out all the multiples, say `2, 4 ,6, 8, 10, ...` as not prime, and similarly `3, 9, 15,...`. Once we are done, we are left only with primes. I am still amazed at the simplicity of this algorithm given that it was invented more than a couple of thousand years ago.

{% highlight cpp %}
vector<int> eratosthenes(int n) {
  vector<int> result;
  vector<bool> prime(n+1, true);
  prime[0] = false;
  prime[1] = false;
  int m = (int)sqrt((double)n);
  for (int i = 2; i <= m; i++) {
    if (fast_is_prime(i))
      result.push_back(i);
        for (int k = i*i; k <= n; k += i) {
          prime[k] = false;
        }
  }
  return result;
}
{% endhighlight %}

That's all folks!