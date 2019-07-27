---
layout: post
title: Reversing a linked list using a recursive algorithm
categories: [algorithms, data structures, linked lists]
keywords: C++, data structures, linked lists
external-url: https://dotkay.github.io/2017/11/08/linked-list-reverse-rec
---

In our [previous post](https://dotkay.github.io/2017/11/07/linked-list-print-reverse), we looked at an iterative function to reverse a linked list. I believe it was a lot of fun. Now, we shall look at a recursive function to do the same. As before, whenever you hear recursion, you should just think of the base case and the recursive steps (i.e. what is to be done in each recursive step - like printing the node's data in our [recursive print function](https://dotkay.github.io/2017/11/06/linked-list-print-rec)) - once this is clear, the rest would be straight forward. For reversing a linked list, at each recursive step, we need to update the pointer directions - if there is a pointer `C  -->  D`, after the recursive call it would be `C  <--  D`. We keep track of two pointers, `head` and `rest` (everything following `head`) - and recursively call the function. 

{% highlight cpp %}
void LinkedList::reverse_list_r () {
  Node *rest = NULL;
  Node *first = NULL;
  first = this->head;
  rest = first->next;
  if (first == NULL || rest == NULL)
    return;                   // base case
  this->head = rest;          // move forward
  this->reverse_list_r ();    // recursive call  
  rest->next = first;         // update pointers
  first->next = NULL;
}
{% endhighlight %}

I will leave it as an (interesting) exercise for the reader to work out this function as we did for the iterative case.