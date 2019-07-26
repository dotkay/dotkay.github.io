---
layout: post
title: Finding an element in a linked list and printing it out
categories: [algorithms, data structures, linked lists]
keywords: C++, data structures, linked lists
external-url: https://dotkay.github.io/2017/11/05/linked-list-print
---

Now, that we are slowly becoming experts in navigating through the nodes in the linked list, let us see how we can print the nodes of our linked list. Again, the idea is very simple:
1. Start from the _head_ node
2. Traverse the linked list until the list ends (node pointing to _NULL_)
3. On the way, print the data part (interesting part) of our list

{% highlight cpp %}
void LinkedList::print_list () {
  Node *it = this->head;          // get the head
  while (it != NULL) {            // traverse till the end
    cout << it->data << " -> ";   // print node data
    it = it->next;                // move forward
  }
  cout << "NULL\n";
}
{% endhighlight %}

This is an iterative solution. We will soon look at a recursive solution to this. Stay tuned.