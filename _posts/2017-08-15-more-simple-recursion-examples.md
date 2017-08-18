---
layout: post
title: Some more recursion examples
categories: ocaml recursion
keywords:
external-url: http://dotkay.github.io/2017/08/15/more-simple-recursion-examples
---

Continuing with our [previous post](http://dotkay.github.io/2017/08/14/ocaml-recursion-simple/) on recursions, let's play with a couple of more simple examples to get ourselves familiar. This is just to start thinking in terms of recursive functions for the problems we try to solve. This kind of thinking will become more useful when we learn about tail recursion in one of the future posts.

Let's write a small function, call it `find`, to find if a given element belongs to a list. i.e., we are provided with an input list `lst` of integers and an integer `x` and the function would return `true` if `x` is one of the elements of `lst` and `false` otherwise.

{% highlight ocaml %}
let rec find x lst =
  match lst with
  | [] -> false
  | h::t ->
     if (h = x) then true
     else (find x t);;
(* val find : 'a -> 'a list -> bool = <fun> *)
{% endhighlight %}

{% highlight ocaml %}
find 2 l1;;
(* - : bool = true *)
find 0 l1;;
(* - : bool = false *)
{% endhighlight %}

As before, we think of the base case and the recursive step. We recursively call the function on a sub-list of the input list, till the problem reduces to the base case - the empty list.

Let's try another simple examples - to find the minimum integer in the given list of integers. We will call the function `find_min` and it takes an input list `lst`.

{% highlight ocaml %}
exception Failure of string                   
let rec find_min lst =
  match lst with
  | [] -> failwith("empty list")
  | [h] -> h
  | h::t -> min h (find_min t);;
(* val find_min : 'a list -> 'a = <fun> *)
{% endhighlight %}

Let's test it out:

{% highlight ocaml %}
find_min l1;;
(* - : int = 1 *)
let l2 = [-2; -10; 1; 9; 11; 7; 17];;
find_min l2;;
(* - : int = -10 *)
{% endhighlight %}

Let's now move away from having lists as input, and work on an example that produces an output list. This is a very familiar introductory CS example - converting an input decimal number to it's base-2 (`binary`) representation. Humans naturally count in base-10 (also called `decimal`) number system, probably because most of us were born with 10 fingers. Computers, to be technically correct I should say digital circuits, work on base-2 number system - they know `0` and `1`. Just like how we count 0 .. 9 and then start counting 10 .. 19, followed by 20 .. 29, etc., digital circuits  count 0, 1 followed by 10, 11 and then follow that by 100, 101, and 110,  111, etc. You see the pattern. Probably, it is more apparent if I write it one after the other:


      base-2    	   	  base-10
	     0  	  	     0
	     1  	  	     1
	    10 	 <-- restart	     2
	    11 		 	     3
	   100   <-- restart 	     4
	   101 	 	     	     5
	   110 	 	     	     6
	   111 	 	     	     7
	  1000 	 <-- restart 	     8
	  1001 	 	     	     9
	  1010 	 	    	    10   <-- restart
	  1011 	  	       	    11 
	  1100           	    12
	  1101           	    13
	  1110           	    14
	  1111           	    15

The usual way we compute the binary representation of a decimal number is to repeatedly divide it and collect the remainders. For example, if we want to compute the binary equivalent of decimal 7:

    2 |_ 7 _          ^
      2 |_ 3 _   - (1) |
        2 |_ 1 _ - (1) |
             ---------->

111 is the binary equivalent of decimal 7. Here, 3, 1 are quotients (`n/2` - n being the input number initally and then the quotient) and the ones on the right within parantheses are the remainders (`n mod 2`).

Let's work out one more example - the binary equivalent of 13:

    2 |_ 13 _               ^
      2 |_ 6 _        - (1) |
        2 |_ 3 _      - (0) |
          2 |_ 1 _    - (1) |
                    -------->

If you observe carefully, what we are doing essentially is repeatedly dividing the input number `n` by the base we want to convert our number to - in this case base-2, and collect the remainders. Dividing a number is the expression `n/2` for algorithmic purposes and the remainder is the expression `n mod 2`. What we are going to do is to repeatedly (think "recursively") divide `n` and collect the remainder in a list which we would eventually return as the output result. `@` is the OCaml syntax for list concatenation: for example `lst1 @ lst2` will concatenate `lst1` and `lst2`. Note the base case for our computation.

{% highlight ocaml %}
let rec bin_of_dec n =
  if n <= 0 then []
  else bin_of_dec (n/2) @
         (n mod 2)::[];;
(* val bin_of_dec : int -> int list = <fun> *)
{% endhighlight %}

Let's check if what we worked out for 7 and 13 are consistent with what this program computes:

{% highlight ocaml %}
bin_of_dec 7;;
(* - : int list = [1; 1; 1] *)
bin_of_dec 13;;
(* - : int list = [1; 1; 0; 1] *)
{% endhighlight %}

I guess it became a longer post than what I intended it to be, but I hope you are getting a better hang of thinking recursively. We will see more examples in future posts - feel motivated to play around with some examples in the mean time!!