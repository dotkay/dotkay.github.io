---
layout: post
title: Let's practice some more recursion!
categories: ocaml recursion
keywords:
external-url: https://dotkay.github.io/2017/08/17/lets-practice-some-more-examples
---

Let's continue from our [earlier post](https://dotkay.github.io/2017/08/15/more-simple-recursion-examples) and practice some more simple problems just to get more and more familiar with recursion.

Let's start by writing a simple function to find the last element of a given list `lst`:

{% highlight ocaml %}
let rec last_elem lst =
  match lst with
  | [] -> None
  | [x] -> Some x
  | h::t -> last_elem t;;
(* val last_elem : 'a list -> 'a option = <fun> *)
{% endhighlight %}

This is also a nice way to introduce `Some` and `None` in OCaml. Just like how we have `'a list` which can be an `int list` or a `string list` or `char list`, OCaml also has this wonderful `'a option` type that can be nothing (`None`) or some type (`Some`). Note however that `'a option` type is not the same as `'a`. So, if the type is `'a` you can ask the compiler to treat it as an `int`, for example. But you can't do the same with `'a option` type. For friends of Java, C programming languages, you can think of `None` as similar to `null` type.

{% highlight ocaml %}
type 'a option = Some of 'a | None
{% endhighlight %}

For those JavaScript fans wondering if they can use similar `Some` and `None` in JavaScript, I found an [option type implementation here](https://github.com/mwilliamson/node-options) that provides this. I should admit that I have never used this implementation but it seems to serve the same purpose for JavaScript.

Let's test our `last_elem` function on an example.

{% highlight ocaml %}
let l1 = [1;2;3;4];;
last_elem l1;;
(* - : int option = Some 4 *)
{% endhighlight %}

Let's move on and practice some more examples. Let's now try and grab the last and the last-but-one elements from a list.

{% highlight ocaml %}
let rec last_two lst =
  match lst with
  | [] | [_] -> None
  | [x; y] -> Some (x, y)
  | _::t -> last_two t;;
(* val last_two : 'a list -> ('a * 'a) option = <fun> *)
{% endhighlight %}

`('a * 'a)` indicates a tuple - a pair in this case. For example, `(3, 4)` would be of type `(int * int)`. Let's check our implementation:

{% highlight ocaml %}
last_two l1;;
(* - : (int * int) option = Some (3, 4) *)
{% endhighlight %}

Let's now make it more generic and write a function to find the k<sup>th</sup> element of a list and let's give our function a very creative name `kth`.

{% highlight ocaml %}
let rec kth lst k =
  match lst with
  | [] -> None
  | h::t ->
     if (k=1) then (Some h)
     else kth t (k-1);;
(* val kth : 'a list -> int -> 'a option = <fun> *)
{% endhighlight %}

Let's check our implementation on `l1` again:

{% highlight ocaml %}
kth l1 2;;
(* - : int option = Some 2 *)
kth l1 6;;
(* - : int option = None *)
{% endhighlight %}

When we try to find the 6<sup>th</sup> element of the list `l1`, we get `None` type as a result as the list contains only 4 elements.

Let's now try to reverse an input list. Relax! It just sounds complicated. It is actually super simple when you think in terms of recursion.

{% highlight ocaml %}
let rec lst_rev lst =
  match lst with
  | [] -> []
  | h::t ->
     (lst_rev t) @ [h];;
(* val lst_rev : 'a list -> 'a list = <fun> *)
{% endhighlight %}

Recall from our previous post that `@` is the OCaml operator for list concatenation. It is a straight forward observation that after the first recursive call to `rev_lst`, the head element `h` is pushed to the last and in each recursive call the first element would keep getting pushed to the end of the result list.

{% highlight ocaml %}
lst_rev l1;;
(* - : int list = [4; 3; 2; 1] *)
{% endhighlight %}

This post is getting long. Please don't stop reading it! I promise, just one more example to finish this post! Let's write a function to remove an element from k<sup>th</sup> position in a given list:

{% highlight ocaml %}
let rec rem_kth k lst =
  match lst with
  | [] -> []
  | h::t ->
     if (k = 1) then t
     else h::(rem_kth (k-1) t);;
(* val rem_kth : int -> 'a list -> 'a list = <fun> *)
{% endhighlight %}

{% highlight ocaml %}
rem_kth 1 l1;;
(* - : int list = [2; 3; 4] *)
rem_kth 6 l1;;
(* - : int list = [1; 2; 3; 4] *)
{% endhighlight %}

That's all folks. If you have reached this line of this post (assuming you didn't start reading from the last line), Congratulations for sticking around!


