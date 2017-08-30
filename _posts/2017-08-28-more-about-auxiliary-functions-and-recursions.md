---
layout: post
title: More about auxiliary functions and recursions
categories: [recursion, ocaml]
keywords: [recursion, ocaml]
external-url: https://dotkay.github.io/2017/08/28/more-about-auxiliary-functions-and-recursions
---

In an [earlier posts](https://dotkay.github.io/2017/08/25/more-examples-of-tail-recursion/), tail recursions were introduced using two very simple functions `tr_lst_sum` and `tr_lst_rev`. In this post, let us carefully observe the structure of some simple tail recursive functions and see what they have in common. We will understand and use this information to write a generic function that can be used to write these other functions. Sounds like inception movie eh? Let's get started!

Here's the tail recursive version of `lst_sum` to sum an input list `lst` of elements.

{% highlight ocaml %}
let tr_lst_sum lst =
  let rec aux_lst_sum lst acc =
    match lst with
    | [] -> acc
    | h::t -> aux_lst_sum t (acc + h)
  in
  aux_lst_sum lst 0;;
{% endhighlight %}

And here's the tail recursive version of `lst_len` to compute the length of an input list `lst` of elements.

{% highlight ocaml %}
let tr_lst_len lst =
  let rec aux_lst_len lst acc =
    match lst with
    | [] -> acc
    | h::t -> aux_lst_len t (acc + 1)
  in
  aux_lst_len lst 0;;
{% endhighlight %}

Let's carefully observe the above two functions and try to understand the pattern - the recipe for such a computation. In both the functions,

1. We have an initial accumulator (in this case the value is `0` but it could be anything in general)
2. We traverse the list, apply the auxiliary function to the initial value of the accumulator and a list element and compute a new value for the accumulator.
2.1. We do the above step to each element of the list (by calling the auxiliary function recursively/repeatedly on each element) and compute new values for the accumulator on the way
3. When we are done with the entire list, we return the accumulator contents as the result

Now, if we just denote the auxiliary function by `faux`, it has a general shape - `faux acc lst` - we do traverse the list `lst`, but this is the general shape that we observe - call `faux` on the initial value of the accumulator `acc` and a list element and use the resulting value as the new value of the accumulator for the next call. For example, in the above functions the new values of the accumulators are `(acc + h)` and `(acc + 1)`. Now, let's try to wrap this all into a single function, which we would call a `leftee` - which would take three parameters - an accumulator `acc`, a function `f` to apply (to the accumulator and list element), and of course a list `lst` to work on and will look like `leftee acc f lst`. Quick note: we call it `leftee` as the `acc` appears to the left of `f` (I think readers are already getting a hint as to where this is headed. Good!).

{% highlight ocaml %}
let rec leftee acc f lst =
  match lst with
  | [] -> acc
  | h::t -> leftee (f acc h) f t;;
(* val leftee : 'a -> ('a -> 'b -> 'a) -> 'b list -> 'a = <fun> *)
{% endhighlight %}

As we see above the new value of the accumulator is the function applied to the current value of the accumulator `acc` and a list element `h`.

Now, let's rewrite `tr_lst_sum` and `tr_lst_len` using our `leftee`:

{% highlight ocaml %}
let tr_lst_sum lst = leftee 0 ( + ) lst;;
{% endhighlight %}

Here `( + )` is the function - just the addition operator. Isn't it super concise? Aren't you in love with this already?

{% highlight ocaml %}
let tr_lst_len lst = leftee 0 (fun x _ -> x + 1) lst;;
{% endhighlight %}

Food for thought - how would you use `leftee` to reverse an input list?


