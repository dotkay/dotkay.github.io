---
layout: post
title: Packing consecutive repetitions in a list into sublists
categories: [recursion, ocaml]
keywords: [recursion, ocaml]
external-url: https://dotkay.github.io/2017/09/01/pack-repetitions-into-sublists
---

In one of our [earlier posts] we saw how to eliminate consecutive repetitions in a list. Let's refresh our memory and take a look at the `compress` function we saw earlier:

{% highlight ocaml %}
let rec compress lst =
  match lst with
  | [] -> []
  | x1 :: (x2::x3 as t) ->
     if (x1 = x2) then compress t
     else x1 :: compress t
  | smth_else -> smth_else;;
{% endhighlight %}

This is a straight forward recursive function. Let's first rewrite it using auxiliary function.

{% highlight ocaml %}
let compress lst =
  let rec aux acc l =
    match l with
    | [] -> acc
    | x::[] -> x::acc
    | x1::(x2::x3 as t) ->
       if (x1 = x2) then aux acc t
       else aux (x1::acc) t
  in
  List.rev(aux [] lst);;
{% endhighlight %}

I think it is pretty straight forward - if we see repetition `(x1 = x2)` we ignore the element and call the auxiliary function on the remaining part of the list. (Note that we do not eliminate `x2` as we want to retain a copy of each repeating element).

Today, we shall not eliminate, but collect the consecutive repeating elements into sublists. For example, if we have the list `[1;1;1;2;2;3;4;5;5;6;1]` we want to make it into this list `[[1; 1; 1];[2; 2];[3];[4];[5; 5];[6];[1]]`

We will again use recursive calls to auxiliary function, very creatively called `aux`. Apart from keeping track of repetitions, we also need to collect them into sublists. So, in this case, as we traverse the input list and process element by element, we will collect the repeating ones in a sublist and collect the ones that are not consecutive repetitions in another (as this will also be a part of our final result). We know that we usually return the accumulator as the result - so in this case, we may want to maintain two accumulators - one `cur` to collect the consecutive repeating elements, and another `acc` to collect the remaining.

- When we encounter repetitions, we will push the repeating entries into `cur` sublist
- When there are no repetitions, we will keep merging `cur` with `acc` and eventually return `acc` as the result.

{% highlight ocaml %}
let pack lst =
  let rec aux cur acc l =
    match l with
    | [] -> acc
    | [x] -> (x::cur)::acc
    | x1::(x2::x3 as t) ->
       if (x1 = x2) then aux (x1::cur) acc t
       else aux [] ((x1::cur)::acc) t
  in
  List.rev(aux [] [] lst);;
{% endhighlight %}

In both the `compress` and `pack` functions that use auxiliary function, we reverse the result using OCaml `List` module's  built-in `rev` function.

Food for thought - why is the result getting reversed? If you work out a small example, it would become apparent.

That's all for today. Enjoy your weekend!


