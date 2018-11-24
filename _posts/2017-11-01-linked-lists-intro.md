---
layout: post
title: Linked Lists
categories: [algorithms, data structures, linked lists]
keywords: C++, data structures, linked lists
external-url: https://dotkay.github.io/2017/11/01/linked-lists-intro
---

Let us look at some fundamental data structures which are just a collection of primitive data types. For example, an array of integers is a collection of integers, a string is a collection of characters, etc. 

Here, we are interested in _Linked Lists_ which are just a collection (_list_) made by linking together some data-types (_node_). The data-types themselves could be any primitive or a data-type formed of primitive types. For simplicity, we will discuss linked lists of integer nodes. The building block of the linked list is a _node_ and nodes are chained (linked) together using pointers, just a data-type that stores the address of the next node. The following sketch would explain it better.

<br>
![Linked List](/assets/images/data_structures/linked_lists_intro.png =200px){:class="img=responsive"}

Here is how you would describe a node and a linked list as C++ classes:

{% highlight cpp %}
class Node {
  public:
    int data;
    Node *next;
  public: 
    Node (int item);
};
{% endhighlight %}

We denote the fist node of the list as "head" node which will come handy when we have operations that traverse the list. The next pointer just stores the address of the next node, as shown in the image below.

{% highlight cpp %}
class LinkedList {
  private:
    Node *head;
    int length;
  // constructors and member functions
  ...
{% endhighlight %}

<br>
![Linked List](/assets/images/data_structures/linked_lists_intro2.png){:class="img=responsive"}
