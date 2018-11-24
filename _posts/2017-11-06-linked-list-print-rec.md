---
layout: post
title: Linked Lists - Print me (R)!
categories: [algorithms, data structures, linked lists]
keywords: C++, data structures, linked lists
external-url: https://dotkay.github.io/2017/11/06/linked-list-print-rec
---

In our [previous post](https://dotkay.github.io/2017/11/05/linked-list-print) we saw how to traverse and print the elements of a linked list in an iterative fashion. In this post, we will do the same (printing the elements of a linked list) but will do it in a fancy recursive way. This should remind you of our [earlier posts](https://dotkay.github.io/2017/08/15/more-simple-recursion-examples/) on recursion, just that now we are in C++ world.

As we saw when we taught ourselves recursion using a more intuitive programming paradigm (functional programming using OCaml programming language), in any recursive function, we need to take care of:
1. Base case
2. Recursive step

In this example, the base case is just an empty list (_NULL_) and the recursive step is to just print the item as long as the list doesn't fall into the base case.

{% highlight cpp %}
void LinkedList::print_list_r () {
  Node *it = this->head;
  if (it == NULL) {            // base case
    cout << "NULL";
    return;
  }
  this->head = it->next;       // move forward
  this->print_list_r();        // recursive call
  cout << " <- " << it->data;  // print 
}
{% endhighlight %}

It is very important to understand this and our [previous post](https://dotkay.github.io/2017/11/05/linked-list-print) as we will use the same idea to perform a more fancy operation on our linked list - to reverse it!
