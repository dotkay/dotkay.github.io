---
layout: post
title: All permutations of a list
categories: [recursion, ocaml]
keywords: [recursion, ocaml]
external-url: https://dotkay.github.io/2017/09/21/permutations-of-a-list
---

Let's write a sweet short function to generate all permutations of a list. We will be using some of the built-in functions of the OCaml List module - but these are generic and it could be implemented very easily (refer to the end of this post for sample implementations). One of them is the `map` function, that accepts an input function and a list and applies that function to each element of the list. For example, if we want to square each element of an input list `lst`, call the function `sq_lst`:

{% highlight ocaml %}
let sq_lst lst = List.map (fun x -> x * x) lst;;
{% endhighlight %}

When we provide the function with a list `[1;2;3]`, we would obtain `[1;4;9]` as the result.

{% highlight ocaml %}
sq_lst [1;2;3];;
(* - : int list = [1; 4; 9] *)
{% endhighlight %}

Another built-in function from the List module we would use is `flatten`, which just flattens a list of lists into a list. For example, if we want to flatten `[[1; 2]; [3; 4]; [5]]` into a single list:

{% highlight ocaml %}
List.flatten [[1; 2]; [3; 4]; [5]];;
(* - : int list = [1; 2; 3; 4; 5] *)
{% endhighlight %}

Let's focus back at the problem at hand - generating permutations of a list. 

> Permutation - all possible arrangements of a list of items, where order is important. 

For example, `{a,b,c} {a,c,b} {b,a,c} {b,c,a} {c,a,b} {c,b,a}` are permutations of `{a,b,c}`. Let's approach this problem by first writing a function - let's call it `insert` that would take two arguments - an element `x` to insert and a list `lst` to insert `x` into. And this function `insert` would insert `x` at all possible positions in `lst`. For example, if we have a list `[1;2]` and an element `0`, we want to insert this `0` at all possible positions in the list `[1;2]`, producing `[[0; 1; 2], [1; 0; 2], [1; 2; 0]]` - note that this is not the permutation, we are just inserting a given element into all possible positions in the list.

{% highlight ocaml %}
let rec insert x lst =
  match lst with
  | [] -> [[x]]
  | h::t -> 
    (x::lst) :: (List.map (fun el -> h::el) (insert x t));;
{% endhighlight %}

Since we are producing a list of lists as output, for the base case we create a list of list containing a single element - the input element `x`. The second part just applies the function to each element of the list, besides adding the element to the list itself. So, `x::lst` produces `[0; 1; 2]`, and the `map` part produces `[1; 0; 2]` (which is applying the function to the first element `1` of the list (`h::el`) - the function just adds the element `0` to the list head item `1` giving `1; 0`) and similarly `[1; 2; 0]`.

Now we will use this `insert` function to write our `perm` (for permutation) function, which is straight-forward given the `insert` function. We will just traverse the list and choose each item in the list and insert the item to all the positions of the rest of the list.

{% highlight ocaml %}
let rec perm lst =
  match lst with
  | [] -> [lst]
  | h::t -> 
    List.flatten (List.map (insert h) (perm t));;
{% endhighlight %}

{% highlight ocaml %}
perm [0;1;2];;
(* - : int list list = *)
(* [[0; 1; 2]; [1; 0; 2]; [1; 2; 0]; [0; 2; 1]; [2; 0; 1]; [2; 1; 0]] *)
{% endhighlight %}

Hope this was the most intuitive way to a permutation function. 

Here's a sample implementation of map and flatten functions - I creatively named them `mapp` and `flatn`:

{% highlight ocaml %}
let rec mapp f lst =
  match lst with
  | [] -> []
  | h::t -> f h :: (mapp f t);;
{% endhighlight %}

{% highlight ocaml %}
let flatn lst =
  let rec aux acc l =
    match l with
    | [] -> acc
    | h::t -> aux (acc @ h) t
  in
  aux [] lst;;
{% endhighlight %}

