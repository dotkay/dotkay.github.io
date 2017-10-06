---
layout: post
title: Binary Search Tree
categories: [data structures, recursion, ocaml]
keywords: [data structures, recursion, ocaml]
external-url: https://dotkay.github.io/2017/09/25/binary-search-tree
---

In a [previous post](https://dotkay.github.io/2017/09/22/binary-trees), we saw binary trees. Today, we will see Binary *Search* Trees (BST). The key difference is that when we insert nodes into our tree, we make sure the items whose values are less than that of the root are added to the left sub-tree and the ones whose values are greater than that of the root are added to the right sub-tree. Let's start by defining our data structure. The definition is the same as our earlier *tree* definition. Just for the sake of clarity let's call our type `bst`. 

{% highlight ocaml %}
type 'a bst =
  | Leaf
  | Node of 'a tree * 'a * 'a tree;;
{% endhighlight %}

Now, for inserting an element into our tree, we wouldn't just insert the element as we did earlier, but we shall compare the element to the root and decide which of the sub-trees (left or right) we want to insert our new item to. This looks like a very small difference - but it has huge implications for search.

{% highlight ocaml %}
let rec insert x bst =
  match bst with
  | Leaf -> Node (Leaf, x, Leaf)
  | Node (left, n, right) ->
     if (x < n) then Node (insert x left, n, right)
     else Node (left, n, insert x right);;
{% endhighlight %}

Let's also write the function to create a bst from an input list, which again is the same as before:

{% highlight ocaml %}
let rec make_bst lst =
  let empty = Leaf in
  match lst with
  | [] -> empty
  | h::t -> insert h (make_bst t);;
{% endhighlight %}


In future posts, we will see the different ways we can traverse this tree.

