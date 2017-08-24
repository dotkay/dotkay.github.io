---
layout: post
title: Some more recursion please...
categories: [ocaml, recursion, algorithms]
keywords:
external-url: https://dotkay.github.io/2017/08/19/some-more-recursion
---

Let's put on our thinking-in-recursion hat and put to use all that we have learned from our examples. We will do this by working out only two (so this will be a short post) examples that will use the recursion concepts that are bread and butter for us now.

As a first example, we will write a function to eliminate consecutive repetitions of elements in a list. For example, if we pass the list `[1;1;2;2;3;3;3;4;5;5]` to our function, it should return `[1;2;3;4;5]`, after removing the repetitions. How do we go about doing this? The moment we see consecutive repetitions, we know that we can easily track this by observing any two consecutive elements in the list while traversing the list. We need to observe at least two consecutive elements in order to find out if they are repetitions. So far, in our previous examples, we have usually been observing one element, the first element of a list (or a sub-list) calling it the `head` and denoting it `h`. Remember the pattern-matchings of the form `| h::t -> ` in our previous code snippets? We were observing an element `h` concatenated with a list `t`. Now, we need to observe two consecutive elements instead of one, to check if they are repetitions - something of this shape `| h1 :: h2::t`. Now, we can compare `h1` and `h2` and check if `h2` is a repetition of `h1`. If they are not the same, we can always treat `h2::t` as the rest-of-the-list, which we called `t` (as in `h::t`) in our previous examples. Now, let's jump in to the algorithm:

1. Base case - if it's an empty list, nothing to check so we will just return an empty list
2. Otherwise - we think of the list to be made up of a head element `x1` and the rest-of-the-list. The rest-of-the-list part we will further expand (in order to allow for checking repetitions). So, let's say the rest-of-the-list is made up of `x2::x3` - `x2` is the head element of rest-of-the-list and `x3` is the rest-of-the-list part of our original rest-of-the-list. Our pattern to match would look something of this shape: `x1 :: (x2::x3 as t)` - the `as t` just gives a name `t` to `x2::x3`.
   * if `x1` and `x2` are the same, then we recursively call the function on `x2::x3`. But, we threw `x1` away and that's fine because it was meant to be eliminated. We still have `x2` that has the same value.
   * If `x1` and `x2` are not the same, we know that `x1` does not have a doppelganger following it, and so we will include it in our result list that we will eventually return. We just append `x1` to the result of the function call on rest-of-the-list.
3. Any other pattern, we just return the same pattern. Why do we need this? Because we want the patterns we match to be exhaustive - to cover all the cases. Suppose we have a list with a single element, this pattern would match that.

{% highlight ocaml %}
let rec compress lst =
  match lst with
  | [] -> []
  | x1 :: (x2::x3 as t) ->
     if (x1 = x2) then compress t
     else x1 :: compress t
  | smth_else -> smth_else;;
{% endhighlight %}

It turned out to be pretty simple, right?

Now, let's work out another example before our enthusiasm dies down. Let's do insertion sort. We will write it out as two recursive functions. Wait, don't run away. It's going to be simple. First, let us write a function that inserts an element `x` to a list `lst`, and it will insert `x` in such a way that the element next to `x` in `lst` would be great than `x` and the element before it would be less than or equal to `x`. Why are we writing this function? This is not insertion sort. Wait, it will be clear in a minute. We will call this function `insert`, takes two arguments `x` and `lst`.

1. Base case - if `lst` is empty, we just insert `x` into the empty list and return it
2. Otherwise, we have to traverse the list and see where to insert `x`. If head element is greater than `x`, it is easy - we just insert `x` at the head of the input list `lst` and return it. If not, we look for a position in the rest-of-the-list `t` to insert our `x`.

{% highlight ocaml %}
let rec insert x lst =
  match lst with
  | [] -> [x]
  | h::t ->
     if (x <= h) then x::h::t
     else h::(insert x t);;
{% endhighlight %}

Now, we will use the above function to write our insertion sort function `isort`. Just think what would happen if `lst` was already sorted in the above case. In that case, we would be inserting `x` to `lst` to maintain sorted order (just because of the rules that we imposed for inserting `x`). Let's write down the algorithm.

1. Base case - if `lst` is empty, return the empty list
2. If the list has just one element, it is trivially sorted, just return the input list
3. If the list has two or more elements, pick elements one by one, starting from the head element `h` and use our `insert` function to insert it into the appropriate position.

{% highlight ocaml %}
let rec isort lst =
  match lst with
  | [] -> []
  | [x] -> [x]
  | h::t -> insert h (isort t)
{% endhighlight %}

Let's check if it works on a simple test example:

{% highlight ocaml %}
let l1 = [1;7;9;3;11;2;10];;
isort l1;;
(* - : int list = [1; 2; 3; 7; 9; 10; 11] *)
{% endhighlight %}

That's too much for my head for today. Let's do more interesting examples in future posts when we get into the concept of tail recursion.