---
layout: post
title: More examples of tail recursions
categories: [recursion, ocaml]
keywords: [recursion, ocaml]
external-url: https://dotkay.github.io/2017/08/25/some-more-examples-of-tail-recursion/
---

We introduced tail recursion in our [previous post](https://dotkay.github.io/2017/08/24/introducing-tail-recursions). Let's see some more examples of tail recursion. Let's do a simple one, very similar to our introductory example in order to illustrate the win that tail-recursion optimization by the compiler provides. Let's consider the function `lst_rev`, introduced in one of our [earlier posts](https://dotkay.github.io/2017/08/17/lets-practice-some-more-examples) which takes a list `lst` and returns the reversed list. Here's it is for your reference:

{% highlight ocaml %}
let rec lst_rev lst =
  match lst with
  | [] -> []
  | h::t ->
     (lst_rev t) @ [h];;
{% endhighlight %}

Recollect that in Ocaml, `@` is the operator for list concatenation. Let's work out how the execution of this function on our list `[1; 2; 3 4]` would look like:

```
	lst_rev [1; 2; 3; 4]
= 	lst_rev [2; 3; 4] @ [1]
= 	lst_rev [3; 4] @ [2] @ [1]
= 	lst_rev [4] @ [3] @ [2] @ [1]
= 	lst_rev [] @ [4] @ [3] @ [2] @ [1]
=	[] @ [4] @ [3] @ [2] @ [1]
= 	[4; 3; 2; 1]
```

Here is our tail-recursive version of the same. Let's call it `tr_lst_rev`.

{% highlight ocaml %}
let tr_lst_rev lst =
  let rec aux_lst_rev lst acc =
    match lst with
    | [] -> acc
    | h::t -> aux_lst_rev t (h::acc)
  in
  aux_lst_rev lst [];;
{% endhighlight %}

Again, very similar to our previous example, we use an accumulator `acc` to collect the results of intermediate computations (results of each recursive step).

```
	tr_lst_rev [1; 2; 3; 4]
=	aux_lst_rev [2; 3; 4]	1::[]
=	aux_lst_rev [3; 4] 	2::[1]
=	aux_lst_rev [4] 	3::[2; 1]
=	aux_lst_rev [] 		4::[3; 2; 1]
= 	[4; 3; 2; 1]

```

