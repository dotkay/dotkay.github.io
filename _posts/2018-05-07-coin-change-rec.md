---
layout: post
title: Do you have some change?
categories: [algorithms, recursion, C++]
keywords: [recursion, algorithms, C++]
external-url: https://dotkay.github.io/2018/05/07/coin-change-rec
---

In a [previous post](https://dotkay.github.io/2018/05/05/climbing-stairs-recursively), we saw a recursive algorithm for computing the number of ways to reach atop _n_ stairs. Let's do a similar computation, this time for computing the number of ways you can combine coin denominations to arrive at a given amount. More precisely:

> Given a set of coin denominations and a target amount, how many ways can you combine the denominations in such a way that the combination sums up to the target amount? You can assume that you have unlimited supply of denominations.

For example, if you have unlimited supply of \$1 and \$2 currency bills, how many ways can you combine them to return a change for \$3? You could give three \$1 bills, or a \$1 bill along with a \$2 bill (or alternately, a \$2 bill along with a \$1 bill, which is just a duplicate of the previous case just that I kept the \$2 bill upon the \$1 bill while giving).

Let us think recursively. Given a set S = { \$1, \$2 } of bills, we could pick a \$1 bill (to give) and now we have to think how many ways you can pick bills from our set S for the remaining amount of \$2 (\$3 the target amount - \$1, the bill we already picked). Now, if you choose to pick another \$1 bill, you have to think how many ways you can pick bills from our set S for the remaining amount of \$1 (\$3 the target amount - our first picked \$1 - our second \$1 pick). Now, we cannot pick \$2 as we need only \$1 and are just left with one choice - to pick another \$1 from the set. This gives us one solution { \$1, \$1, \$1 }. 

Alternately, we could have first picked a \$2 bill and then we would be left with no choice but to pick another \$1, so that it adds up to \$3. What we are essentially doing is picking a bill whose value is less than the target amount and then computing the number of ways you can pick bills for the remaining amount, i.e. target amount - picked bill amount (our recursive step). And if this difference becomes 0, then we have a solution that sums up to the target amount (our base case for recursion).

{% highlight cpp %}
int coin_ways(std::vector<int>& S, int n, int target)
{
  // base case
  if (target < 0)
    return 0;
  if (target == 0)
    return 1;

  int ways = 0;
  for (int i = 0; i < n; i++)
  {
    ways += coin_ways(S, n, target - S[i]);
  }
  return ways;
}
{% endhighlight %}

If you try the above implementation on our example with S = { 1, 2 } and target = 3, you will get _ways_ to be 3. And the three ways are { 1, 1, 1 }, { 1, 2 } and { 2, 1 }. What if we want only the unique ways? How would you go about modifying the above algorithm? That is we want to collapse { 1, 2 } and { 2, 1 } as just one count - after all it does not matter if I keep the \$1 bill upon \$2 bill or the other way around as long as I am returning bills that sum up to \$3. Think about it.