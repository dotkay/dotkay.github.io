---
layout: post
title: Linked Lists - Add me!
categories: [algorithms, data structures, linked lists]
keywords: C++, data structures, linked lists
external-url: https://dotkay.github.io/2017/11/02/linked-list-insertion
---

Having introduced linked lists in our [previous post](https://dotkay.github.io/2017/11/01/linked-lists-intro), 
let us look at some operations on such a data structure. Specifically, let us look at how to insert a new item (a new _node_) to a linked list. Typically, we start with an empty linked list (denoted by just one node, the NULL node) and grow it by adding more and more items. The usual approach to adding a new item is to form a node (the building block) for the new item and then attach the item to a position in the linked list - by default we choose to add it to the head.

{% highlight cpp %}
Node *LinkedList::insert_item (int item) {
  Node *new_node = new Node(item); // form the building block
  new_node->next = this->head;     // set the next pointer
  this->head = new_node;           // make new node the head
  this->length++;                  // update the length
}
{% endhighlight %}

