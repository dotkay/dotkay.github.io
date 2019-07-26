---
layout: post
title: Reversing a linked list
categories: [algorithms, data structures, linked lists]
keywords: C++, data structures, linked lists
external-url: https://dotkay.github.io/2017/11/07/linked-list-reverse
---

In this post, let us try to write a function to reverse our linked list. In particular, we will do it in an _iterative_ fashion. Suppose we start with the following input list:

```
1  -->  2  -->  3  -->  NULL
```
After performing a reversal we should end up with the following result:

```
3  -->  2  -->  1  -->  NULL
```

Conceptually, we are reversing the pointers (turing around the arrows). In our data structure, these are denoted by the _next_ pointer of each node. So, it is actually just setting the _next_ pointer of the current node to point to the previous node in the list. For example, if our current node is `2` and its _next_ pointer is pointing to node `3` originally, we want our function to make the next pointer of `2` to point to `1`. We are remembering the previous node just as in our [previous example](https://dotkay.github.io/2017/11/04/linked-list-delete) to delete a node. It looks like that's all to it:

```
curr->next = prev
```

But as soon as we set the _next_ pointer of `2` to point to `1`, we lost the connection to the rest of the list following `2` (`3  -->  NULL`). Intuitively, to get over this, we need to remember more than just the previous node in the list - we also need to keep track of the next node (a handle to the next node so that we do not lose the rest of the list after we turn the current node's _next_ pointer). Once you have a grasp of this intuition the coding it up is straight-forward. For better clarity, let us also work through a simple example (with 3 elements as above) following the function definition below:

{% highlight cpp %}
void LinkedList::reverse_list () {
  Node *prev = NULL;
  Node *next;
  Node *curr = this->head;
  while (curr != NULL) {
    next = curr->next; // get the next element
    curr->next = prev; // link in reverse direction 
    prev = curr;       // move ahead - set new prev, curr  
    curr = next;
  }
  this->head = prev;
}
{% endhighlight %}

<br>
![Linked List](/assets/images/data_structures/linked_list_reverse_iter.png){:class="img=responsive"}

Now, you get it! 