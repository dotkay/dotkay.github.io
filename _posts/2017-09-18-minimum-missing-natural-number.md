---
layout: post
title: Let's find the minimum missing natural number...
categories: [ocaml, recursion]
keywords: [ocaml, recursion]
external-url: https://dotkay.github.io/2017/09/18/minimum-missing-natural-number
---

Let's write a program to find the minimum missing natural number. We would be given an unsorted list of natural numbers, say `[0;3;2;9;1;7;5]` and we need to return `4`. Let's assume that there are no duplicates. And if we provide a list that does not start with `0` (natural numbers start with `0` and we assume that we provide proper input), we just return `0` as it is the smallest natural number. 

How do we go about solving this problem. Once we look at *unsorted*, we can think of sorting the provided list first. Once we sort the list, we just need to go through the elements of the list one by one and find the missing number. As we have sorted the list already, the first missing number we encounter would be the minimum missing number. 

{% highlight ocaml %}
let min_missing_num lst = 
  let sort_lst = List.sort compare lst in
  let rec find_min sort_lst = 
    match sort_lst with
    | [] -> -1
    | x::[] -> x+1
    | x::y::_ when y - x > 1 -> x+1
    | _::tl -> find_min tl
  in
  find_min ((-1)::sort_lst);;
{% endhighlight %}

Here, we are using OCaml List module's sort function that has the following signature:

{% highlight ocaml %}
(* - : ('a -> 'a -> int) -> 'a list -> 'a list = <fun> *)
{% endhighlight %}

And `compare` is a comparision function that has the following signature:

{% highlight ocaml %}
(* - : 'a -> 'a -> int = <fun> *)
{% endhighlight %}

Essentially, `compare x y` returns 0 if `x` and `y` are equal, `-1` if `x < y` and `1` if `x > y`.

Can we do better than this algorithm for finding the minimum missing natural number? Hint: sorting the input list is not very cheap - we could avoid that.