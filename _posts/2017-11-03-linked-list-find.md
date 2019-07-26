---
layout: post
title: Searching for an element in a linked list
categories: [algorithms, data structures, linked lists]
keywords: C++, data structures, linked lists
external-url: https://dotkay.github.io/2017/11/03/linked-list-find
---

In this post, let us see how to find if a given item exists in the linked list. Conceptually, it is very simple - just go through the nodes one by one and see if the data matches the item given as input. But, where do we start the traversal from? This is what we use the _head_ pointer for. And when do we stop? Obviously, if we find the item we are looking for, we stop. We might also not find the item at all, in which case we traverse all of the list until we hit the _NULL_ node (that indicates the end of the list).

{% highlight cpp %}
Node *LinkedList::find (int item) {
  Node *it = this->head;
  while (it != NULL) {
    it = it->next;
    if (it->data == item) {
      return it;
    }
  }
  return it;
}
{% endhighlight %}