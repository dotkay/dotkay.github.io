---
layout: post
title: Some more tail recursion...
categories: [algorithms, recursion, ocaml]
keywords: [recursion, ocaml]
external-url: https://dotkay.github.io/2017/08/30/some-more-tail-recursion
---

Let's continue with tail recursion and folding (recollect our [previous post](https://dotkay.github.io/2017/08/29/auxiliary-functions-tail-recursion-and-reversing-a-list). Let's use those concepts to write insertion sort algorithm. In an [earlier post](https://dotkay.github.io/2017/08/19/some-more-recursion) we wrote a recursive implementation of insertion sort algorithm as below:

{% highlight ocaml %}
let rec insert x lst =
  match lst with
  | [] -> [x]
  | h::t ->
     if (x <= h) then x::h::t
     else h::(insert x t);;
{% endhighlight %}

{% highlight ocaml %}
let rec isort lst =
  match lst with
  | [] -> []
  | [x] -> [x]
  | h::t -> insert h (isort t)
{% endhighlight %}

Now, let's write a tail recursive version of insertion sort. Let's just call it `tr_isort`. 

{% highlight ocaml %}
let tr_isort lst =
  let rec aux lst acc =
    match lst with
    | [] -> acc
    | h::t -> aux t (insert h acc)
  in
  aux lst [];;
{% endhighlight %}

Food for thought - is it possible to write a tail-recursive version of `insert` function that we used above? If yes, why don't we try it. If no, why not?