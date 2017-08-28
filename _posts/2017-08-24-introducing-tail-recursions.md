---
layout: post
title: Introducing tail recursions
categories: [recursion, ocaml]
keywords: [recursion, ocaml]
external-url: https://dotkay.github.io/2017/08/24/introducing-tail-recursions/
---

Now that we are already thinking of recursive function calls whenever possible, it is a nice time to introduce tail recursions. Let's consider this function `lst_sum` that we worked out in one of our [earlier posts](https://dotkay.github.io/2017/08/14/ocaml-recursion-simple), repeated here for convenience:

{% highlight ocaml %}
let rec lst_sum lst = 
  match lst with
  | [] -> 0
  | h::t -> h + lst_sum t;;
{% endhighlight %}


When we call this function on this list `l1 = [1; 2; 3; 4; 5]`, this is what would how the stack frame of the execution by the compiler would look like:

```
	lst_sum [1; 2; 3; 4; 5]
=	1 + lst_sum [2; 3; 4; 5]
=	1 + 2 + lst_sum [3; 4; 5]
=	1 + 2 + 3 + lst_sum [4; 5]
=	1 + 2 + 3 + 4 + lst_sum [5]
=	1 + 2 + 3 + 4 + 5 + lst_sum []
=	1 + 2 + 3 + 4 + 5 + 0
=	15

```

Note that it performs the actual computation (or evaluates the intermediate results) only after all the recursive calls are completed. This means that we need to keep the function calls in the stack (which means spend storage for the function's local variables, etc.) until all the recursive calls are returned. This is a lot of resources wasted.

Let's see a tail-recursive version of the same function. Let's call it `tr_lst_sum`.

{% highlight ocaml %}
let tr_lst_sum lst =
  let rec aux_lst_sum lst acc =
    match lst with
    | [] -> acc
    | h::t -> aux_lst_sum t (acc + h)
  in
  aux_lst_sum lst 0;;
{% endhighlight %}

We have an auxiliary recursive function `aux_lst_sum` and pass another parameter `acc` (for accumulator) to it. The idea is to accumulate intermediate results so that we can start computations as and when a step completes, and not have to save the recursive calls to the functions in the stack frame. This is how the execution of our tail-recursive version would look like:

```
	tr_lst_sum [1; 2; 3; 4; 5]
= 	aux_lst_sum [1; 2; 3; 4; 5] 0
= 	aux_lst_sum [2; 3; 4; 5]    1
= 	aux_lst_sum [3; 4; 5] 	    3
= 	aux_lst_sum [4; 5] 	    6
= 	aux_lst_sum [5] 	    10
= 	aux_lst_sum [] 		    15
=	15
```

Note that the accumulator `acc` computes the intermediate results as and when they are available. We also store only one instance of the function call in the stack thereby saving a lot of space and more importantly, avoiding stack overflow.

Hope you enjoyed this!
