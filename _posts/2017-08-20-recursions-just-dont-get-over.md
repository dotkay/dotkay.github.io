---
layout: post
title: Recursions just don't get over ...
categories: [ocaml, recursion]
keywords:
external-url: https://dotkay.github.io/2017/08/20/recursions-just-dont-get-over
---

I don't know how my posts just happen to revolve around recursion, but we're only one week into learning and I have grand plans to learn (through teaching) deep learning techniques, data analysis, hardware engineering concepts, etc., besides recursion and functional programming. So, just hang on and enjoy!

Let's do a quick example to work out more recursion. This time, we will implement selection sort. Selection sort implementation, again, is very intuitive if we are in this thought process - recursion and a terse and intuitive programming language. Let's do it. We just need to traverse the list, select the minimum element and append it to the head of the list. And then, proceed by finding the next minimum element (from the rest-of-the-list which contains one element less than the original list as the minimum element has been moved to the head) and push it to the head, and so on. So we need two ingredients.

  * A function `rem` to remove an element `x` from a list `lst`. We will write it in recursive fashion
  * A function `find_min` to find the minimum element of a list (we already did this in one of our [previous posts](https://dotkay.github.io/2017/08/15/more-simple-recursion-examples/))

Let's implement the above ingredients that we need for selection sort recipe.

{% highlight ocaml %}
let rec rem x lst =
  match lst with
  | [] -> []
  | h::t ->
     if (h = x) then t
     else h::(rem x t);;
{% endhighlight %}

{% highlight ocaml %}
let rec find_min lst =
  match lst with
  | [] -> failwith("empty list")
  | [x] -> x
  | h::t -> min h (find_min t);;
{% endhighlight %}

Now, let's use the above two to implement selection sort. We will call the function `ssort`. Recollect that, we will find the minimum element `m` of the list, push it to the head (actually we also have to remove it from the rest-of-the-list otherwise there will be two copies - one at the head and other at the original position) and recursively call the function on the rest-of-the-list. Let's go for it:

{% highlight ocaml %}
let rec ssort lst =
  match lst with
  | [] -> []
  | _ -> let m = find_min lst in
         m::(ssort (rem m lst));;
{% endhighlight %}

That's all folks! Have a great week ahead!