---
layout: post
title: Binary Trees
categories: [data structures, recursion, ocaml]
keywords: [data structures, recursion, ocaml]
external-url: https://dotkay.github.io/2017/09/22/binary-trees
---

Let's talk about *Binary Trees* - we cannot afford to ignore binary trees after having talked about several search algorithms. We will see many more applications of this wonderful data structure, but to get started, let's understand what they are and how to create a simple one. Again, I am going to be using OCaml as I find it intuitive and concise. Probably, I will post the equivalent C/C++ code in later posts.

> A Binary Tree is a tree in which each node can have at most two children

A binary search tree is just a recursive data structure with a root node and two children, which themselves could be trees or leaf nodes (that have no children). Since the children could themselves be trees, we have this recursive data structure. For example,

```
             node-0
	      /  \
 	     /    \
	 node-1  node-2
	  / \      / \
         /   \    /   \
       leaf leaf leaf leaf	 

```

is how they generally look. Here, `node-0` has `node-1` and `node-2` as child nodes, which themselves are binary trees (as they have two ('bi') children). It could use used to represent many things. For example, a family tree:

```
            Mother
	     /  \
            /    \
       daughter  Son
                 / \
                _  daughter  

```

Let's first define the type *binary tree* - we would call it just `tree`.

{% highlight ocaml %}
type 'a tree =
  | Leaf
  | Node of 'a tree * 'a * 'a tree;;
{% endhighlight %}

This just defines the type `'a tree` - as noted in one of our [earlier posts](https://dotkay.github.io/2017/08/17/lets-practice-some-more-examples/) 'a is like *any* - we could have integer trees, string trees, etc. that would take different type values. So, a `tree` could either be a `Leaf` or another `tree` composed of two child trees and a root node (`'a`). Now we can create a new empty tree with just a Leaf:

{% highlight ocaml %}
let t = Leaf;;
(* val t : 'a tree = Leaf *)
{% endhighlight %}

Or we could create a tree with a root node and two child nodes, which themselves are trees with children:

{% highlight ocaml %}
let t2 = Node (Leaf, 1, Node (Leaf, 2, Node (Leaf, 3, Leaf)));;
(* val t2 : int tree = Node (Leaf, 1, Node (Leaf, 2, Node (Leaf, 3, Leaf))) *)
{% endhighlight %}

I know it looks awkward, but let's decompose it and understand. `Node (Leaf, 3, Leaf)` is one tree. Let's call it C. `Node (Leaf, 2, C)` is the next tree - Let's call this guy B. `Node (Leaf, 1, B)` is the other one. So, we have something like this:

```
             1
	    / \          
           /   \
	 leaf   2                  |
	       / \                 |
              /   \                | -> B
	    leaf   3       |       |
                  / \      |-> C   |
		 /   \     |       |
	       leaf leaf   |       |

```

In the following post, we will write a functions to interact with this structure.
