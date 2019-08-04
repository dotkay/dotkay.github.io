---
layout: post
title: Tail recursions and reversing a list
categories: [recursion, ocaml]
keywords: [recursion, ocaml]
external-url: https://dotkay.github.io/2017/08/29/auxiliary-functions-tail-recursion-and-reversing-a-list
---

So, how about reversing a list using our `leftee` function from our [previous post](https://dotkay.github.io/2017/08/28/more-about-auxiliary-functions-and-recursions)?

Let's work it out now. Here's the original tail recursive function for your reference: 

{% highlight ocaml %}
let tr_lst_rev lst =
  let rec aux_lst_rev lst acc =
    match lst with
    | [] -> acc
    | h::t -> aux_lst_rev t (h::acc)
  in
  aux_lst_rev lst [];;
{% endhighlight %}

All you need to observe is how the accumulator `acc` changes - here we take a list element we are currently processing and stick it before (at the head) of the current accumulator `acc`.

{% highlight ocaml %}
let tr_lst_rev lst = leftee (fun a x -> x::a) [] lst;; 
{% endhighlight %}

In most functional programming languages our `leftee` is actually called `fold_left` and is tail recursive. There's also a `fold_right` which is not tail recursive, because of the way it applies the function to the list elements. More on this in a later post!