---
layout: post
title: Binary Trees again
categories: [data structures, recursion, ocaml]
keywords: [data structures, recursion, ocaml]
external-url: https://dotkay.github.io/2017/09/23/binary-trees-2
---

In the [previous post](https://dotkay.github.io/2017/09/22/binary-trees), we saw how to define a binary tree. Now, that we have the tree, we need to be able to insert items into the tree. So, let us write an `insert` function to do that:

{% highlight ocaml %}
let insert x tree = Node (Leaf, x, tree);;
{% endhighlight %}

If we want to insert an element `0` into an empty tree, we just do the following:

{% highlight ocaml %}
let empty = Leaf;;
(* val empty : 'a tree = Leaf *)
insert 0 empty;;
(* - : int tree = Node (Leaf, 0, Leaf) *)
{% endhighlight %}

Let us try something more fun. Let's create a tree from a list. We have worked with lists all along and it is imaginable that we would accept inputs in the form of lists, but we want to implement our algorithms (later on!..) using tree data structure. So, this function is going to be very helpful. Let's just call the function `make_tree`.

{% highlight ocaml %}
let rec make_tree lst =
  let empty = Leaf in
  match lst with
  | [] -> empty
  | h::t -> insert h (make_tree t);;
{% endhighlight %}

Let us use our new function to create a tree from the list `[0; 1; 2]`.

{% highlight ocaml %}
make_tree [0;1;2];;
(* - : int tree = Node (Leaf, 0, Node (Leaf, 1, Node (Leaf, 2, Leaf))) *)
{% endhighlight %}

Wasn't that super easy?
