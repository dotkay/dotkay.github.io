---
layout: post
title: List Partitioning and Quicksort
categories: [algorithms, recursion, ocaml]
keywords: [algorithms, recursion, ocaml]
external-url: https://dotkay.github.io/2017/09/19/list-partitioning-and-quicksort
---

Before we try to come up with a better solution for the problem in the [previous post](https://dotkay.github.io/2017/09/18/minimum-missing-natural-number), let us look at another familiar problem - Quicksort. A quick refresher of mergesort from one of the [earlier posts](https://dotkay.github.io/2017/08/31/recursions-and-merge-sort) will make this exercise much simpler. In mergesort, we essentially wrote a `split` function to split an input list into two lists and recursively called the mergesort algorithm on each of the sub-lists produced by `split` and eventually merged them using a `merge` function that merges two lists by comparing the element at the head of the sub-lists.

The idea behind quicksort is similar. Instead of just splitting the list into two sub-lists, we are going to choose a *pivot* element (a fancy name for *just an element* from our input list) and split the list into two sub-lists in such a way that all the elements in the input list that are less than the pivot element would fall into one sub-list and the rest of the elements will fall into the other. Now that we are very much comfortable with writing recursive functions using accumulators, let us go ahead and write one for partitioning the list into a pair of lists (two sub-lists) given a pivot element. So, the inputs to our function are a list `lst` (to split) and a `pivot` element.

{% highlight ocaml %}
let partition pivot lst =
  let rec aux (acc1, acc2) l =
    match l with
    | [] -> (acc1, acc2)
    | h::t -> 
      if (h < pivot) then aux (h::acc1, acc2) t
      else aux (acc1, h::acc2) t
  in
  aux ([], []) lst;;
{% endhighlight %}

Let's go ahead and see what it does on a sample list `lst1` which contains `[1; 11; 9; 3; 6; 7; 2; 29]`. Let's pick `7` to be our pivot element. 

{% highlight ocaml %}
let lst1 = [1;11;9;3;6;7;2;29];;
partition 7 lst1;;
(* - : int list * int list = ([2; 6; 3; 1], [29; 7; 9; 11]) *)
{% endhighlight %}

As we see, all the elements less than our pivot element, `7` in this case, are in one of the sub-lists generated by `partition` function.

Now, quicksort is just choosing the head element as the pivot, generating two sub-lists `l1` and `l2` and calling quicksort recursively on each of the sub-lists. Since each recursive call pushes the smaller element further towards the left, eventually when all recursive calls return, the list would be sorted in acsending order.

{% highlight ocaml %}
let rec quicksort lst =
  match lst with
   | [] -> []
   | x::[] -> [x]
   | h::t -> let l1, l2 = partition h t in
     quicksort l1 @ (h::quicksort l2);;
{% endhighlight %}

And let us try it on `lst1`:
{% highlight ocaml %}
quicksort lst1;;
(* - : int list = [1; 2; 3; 6; 7; 9; 11; 29] *)
{% endhighlight %}

This exercise will help us find a better solution to the problem of finding the minimum missing natural number from an unsorted list. Does this ring any bell?
