---
layout: post
title: More examples using auxiliary functions
categories: [recursion, ocaml]
keywords: [recursion, ocaml]
external-url: https://dotkay.github.io/2017/08/26/more-examples-using-aux-functions
---

Let's look at a couple of more examples in order to get us thinking towards using auxiliary functions and accumulators while writing recursive functions. This would help us write tail-recursive functions which are safer and always a good practice. Note that some of the language compilers do not optimize tail recursions and so be aware of this fact in order not to be surprised when you do not see performance improvements while using tail recursive functions.

Let's write the standard explode function `explode` that explodes a string into a list of characters. i.e., if you pass the string `"hello"`, it would explode it and return the list `['h'; 'e'; 'l'; 'l'; 'o']`.

{% highlight ocaml %}
let explode s =
  let rec aux_expl n acc =
    if n < 0 then acc
    else aux_expl (n-1) (s.[n]::acc)
  in
  aux_expl (String.length s - 1) [];;
{% endhighlight %}

Let's write another function `prime_factors` that would return all the prime factors of an input number `n`. Again, we shall use an auxiliary function to do the intermediate computations.

{% highlight ocaml %}
let prime_factors n =
  let rec aux_factors d n =
    if n <= 1 then []
    else if (n mod d = 0) then d::(aux_factors d (n/d))
    else aux_factors (d+1) n
  in
  aux_factors 2 n;;
{% endhighlight %}

That's all for today! Hope it was enjoyable.