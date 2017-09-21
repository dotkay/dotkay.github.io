---
layout: post
title: Finding the minimum missing natural number - a better way!
categories: [recursion, ocaml]
keywords: [recursion, ocaml]
external-url: https://dotkay.github.io/2017/09/20/minimum-missing-nat-number-2
---

In one of the [earlier posts](https://dotkay.github.io/2017/09/18/minimum-missing-natural-number) we saw a straight forward way to find the minimum missing natural number in a list. That solution, although very straight forward, required us to sort the list before finding the minimum missing number. The question was - can we get away without that expense of sorting that list?

The answer seems to be *yes*. Since we know that we are not allowing any duplicates and we consider only natural numbers, we can use a very nice property:

> In a perfectly consecutive sequence of natural numbers, any chosen number is also the number of natural numbers less than it.

That is, if we consider the consecutive sequence of number `0 1 2 3 4 5` and choose `3`, we see that there are exactly three natural numbers before it - `0 1 2`. A curious mind would have noted that these three numbers actually need not be in order - they should just exist. For example `1 0 2 3 4 5` has three numbers before `3`, they are not in sequence, but the fact that there are three of them assures us that nothing less than three is missing in the sequence. This is the property we are going to use to come up with a simpler search. Just like how we [partitioned a list of numbers around a pivot element for quicksort](https://dotkay.github.io/2017/09/19/list-partitioning-and-quicksort), we will choose an element `x` and push all the numbers less than it (in any order) to the left of it and the rest to the right of it. We will also need to keep track of the number of elements `num` to the left of the chosen number (in order to check our fancy property mentioned above). Let's write the partition function first:

{% highlight ocaml %}
let partition x lst = 
  let aux (num, left, right) y = 
    if (y < x) then num+1, y::left, right
    else num, left, y::right
  in
  List.fold_left aux (0, [], []) lst;;
{% endhighlight %}

If the number of elements tracked is equal to the chosen number, it just means that there is no missing number in the left partition (just like the example above where the number of elements less than `3` is equal to three, and we don't have any missing natural number to the left of `3`). Now, we will use this partition function to find the missing natural number:

{% highlight ocaml %}
let min_missing_num lst =
  (* m is the least nat number - 0 *) 
  let rec find_min m l = 
    match l with
    | [] -> m  (* we return 0 as the missing num *)
               (* as it is the least nat num *)
    | h::t -> 
      let (num, left, right) = partition h t in
      (* if (num = h) left side is perfect *)
      (* search on the right partition *)
      if (num + m = h) then find_min (h+1) right
      else find_min m left
    in
    find_min 0 lst;;
{% endhighlight %}

Think of `m` as the accumulator - we know that `0` is the first natural number, so in case our input list is an empty one (base case), we just return the first (minimum) natural number that is missing. Is there too much going on in this? If you could work this out in a sample input, say `[0; 3; 2; 9; 1]` it would help understand it better. 
