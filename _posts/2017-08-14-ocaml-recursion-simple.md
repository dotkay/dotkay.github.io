---
layout: post
title: Let's play with some simple recursion
categories: ocaml recursion
keywords:
external-url: http://dotkay.github.io/2017/08/14/ocaml-recursion-simple/
---

Recursion has been one of my favourite concepts for a very long time much like my fascination for mathematical induction. The subtle differences between the two would be a topic for a separate post. 

Let's do some simple recursive functions just to illustrate the beauty. I chose [OCaml] for this post as it is one of my favourite programming languages. Somehow, I feel that many algorithms when coded in OCaml look very intuitive and understandable than in other imperative programming languages. We will look at some algorithms in both OCaml and C in a later post and leave it to the reader to decide as to which one looks more intuitive.

OCaml is a very nice functional programming language and it offers `list` as a primitive data type. For example, if we want a list of five integers, this is how we do it in OCaml:

{% highlight ocaml %}
let l1 = [1;2;3;4;5];;
{% endhighlight %}

We would usually think of the list data type itself to be a recursive definition. i.e., a list is made of either an empty list or a list composed of a `head` element and `tail` where tail itself is a list (possibly empty list). For example, in the list `l1` above, `1` constitutes the head element and the tail corresponds to the list `2;3;4;5`.

Now, let's write a recursive function to count the number of elements in the list.

1. Let's think of the base case: when the list is empty - in which case we just return `0` as the result.
2. And let's build our thought process this way - what if the list has just one element? This would correspond to a list where there is a single head element and an empty list as the tail. i.e., we count the single head element and the empty list (the tail) we know contributes `0` to our result (the base case we just saw in 1.).
3. Now, when the list has 2 elements, we think of it as having a head element and a tail list that consists of a single element. Now, we count the head element and apply the same function (our counting) to count the number of elements in the tail list (which now corresponds to the case we saw in 2.).

Essentially what we are doing is:

1. If the list is empty, return 0 as the result
2. If the list is not empty, count the head element (1) and call the function (recursively) to count the number of elements in the tail

Now, let's write the above two steps in the following program which we call `lst_len` (for list length), that takes a single input parameter `lst`:

{% highlight ocaml %}
let rec lst_len lst = 
  match lst with
  | [] -> 0
  | h::t -> 1 + lst_len t;;
(* val len_lst : 'a list -> int = <fun> *)
{% endhighlight %}

Recursive functions in OCaml are defined with `rec` keyword. Let's use this function to count the number of elements in our list `l1`:

{% highlight ocaml %}
lst_len l1;;
(* - : int = 5 *)
{% endhighlight %}

Let's use the same thought process to write a recursive function `lst_sum` to sum up (add) the elements of the list.

{% highlight ocaml %}
let rec lst_sum lst = 
  match lst with
  | [] -> 0
  | h::t -> h + lst_sum t;;
(* val lst_sum : int list -> int = <fun> *)
{% endhighlight %}

And let's use this function to sum up the elements in our list `l1`:

{% highlight ocaml %}
lst_sum l1;;
(* - : int = 15 *)
{% endhighlight %}

Isn't this intuitive and elegant way of programming? We'll talk more about simple programs that can be written in an intuitive way and try to develop our understanding of the concepts in a clear way.

Thanks for your interest and keep checking out this space for more.


[OCaml]: http://www.ocaml.org 