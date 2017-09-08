---
layout: post
title: Let's implode!
categories: [recursion, ocaml]
keywords: [recursion, ocaml]
external-url: https://dotkay.github.io/2017/09/06/lets-implode-a-list
---

In one of the [previous posts](https://dotkay.github.io/2017/08/26/more-examples-using-aux-functions/) we looked at a recursive function `explode` to explode a string into a list of characters. Now, we shall try to implode a list of characters back into a string. We'll call this function `implode` that takes a list `lst` as input. 

We need an accumulator in order to collect the characters from the input list to prepare our output, so let's create one `acc` whose length would be equal to the length of the input list `lst` (of characters). 

1. Base case - if the input list `lst` is an empty one, just return the accumulator.
2. If the list is not empty, we pick the head element and push it into the accumulator. We start with index `'0'` of the (mutable) String and recursively call the function on the remaining part of the list, incrementing the index for each call. 

{% highlight ocaml %}
let implode lst =
  let acc = Bytes.create (List.length lst) in
  let rec aux i l =
    match l with
    | [] -> acc
    | h::t -> Bytes.set acc i h; aux (i + 1) t in
  aux 0 lst;;
{% endhighlight %}

Note: The latest version of OCaml, my preferred programming language, has a mutable data-type `Bytes` while it made the `String` data-type immutable. 

Food for thought - how would be implement `implode` using the immutable String type, in a purely functional fashion?