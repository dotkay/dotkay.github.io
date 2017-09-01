---
layout: post
title: Some more tail recursion...
categories: [algorithms, recursion, ocaml]
keywords: [recursion, ocaml]
external-url: https://dotkay.github.io/2017/08/31/recursions-and-merge-sort
---

By now, we are all pretty comfortable with recursive functions, using auxiliary functions, etc. Let's now put these skills to write merge sort algorithm in a recursive fashion. We need the following three ingredients to prepare our recipe

   - `split` function that would take a list and split it into two lists
   - `merge` function that would merge a pair of sorted lists
   - `merge_sort` function that would use the above two to build the sorted list recursively.

Let's prepare the above one by one. First, the `split` function that takes a list `lst` as input and splits them and returns a pair of lists as output. The moment we see that we need to return two lists (a pair of lists) as output, intuitively we can imagine that we would need two accumulators, let's call it `a1` and `a2`. Next, we will think about the possible cases (patterns).

1. The base case is going to be empty list as input in which case our result would be two empty lists (the two accumulators we use).
2. If we pass a list that has a single element, one of the lists we return would contain this single element and the other would be an empty list (remember, we need to return two lists as result).
3. If there are multiple elements, like any reasonable list, we would pick the first element and push it into the first accumulator, the second element into the second accumulator and then recursively call the auxiliary function on the rest of the list.

So, this is what it looks like - you can match the three items above to the three patterns in the code fragment below - pretty straight forward.

{% highlight ocaml %}
let split lst =
  let rec aux a1 a2 l =
    match l with
    | [] -> a1, a2
    | [x] -> x::a1, a2
    | x1::(x2::x3) ->
       aux (x1::a1) (x2::a2) x3
  in
  aux [] [] lst;;
{% endhighlight %}

Now, let's prepare the second item in our list - the `merge` function. This is just pattern matching and even simpler than our `split` function.

{% highlight ocaml %}
let rec merge (lst1, lst2) =
  match lst1, lst2 with
  | [], l -> l
  | l, [] -> l
  | (h1::t1 as l1), (h2::t2 as l2) ->
     if (h1 < h2) then h1 :: merge (t1, l2)
     else h2 :: merge (l1, t2);;
{% endhighlight %}

Finally, let's prepare the merge_sort function that takes a list `lst` as input. First we would split the input list into two lists using our `split` function. Then, we would recursively call `merge_sort` on the two sub-lists (result of `split` function) and merge the results of these recursive calls using our `merge` function. Again, the base case is the empty list and another possibility is an input list with a single element - both are straight forward.

{% highlight ocaml %}
let rec merge_sort lst =
  match lst with
  | [] -> []
  | [x] -> [x]
  | l -> let l1, l2 = split l in
         merge (merge_sort l1, merge_sort l2);;
{% endhighlight %}

That was a very intuitive way to write a merge sort algorithm. Hope you all agree with me!