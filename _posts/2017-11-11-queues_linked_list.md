---
layout: post
title: Queues using Linked List
categories: [algorithms, data structures, queues]
keywords: C++, data structures, queues
external-url: https://dotkay.github.io/2017/11/11/queues_linked_list
---

In an [earlier post](https://dotkay.github.io/2017/11/09/queues), we saw implementation of Queues using arrays. Now, we will use a _Linked List_ to store the elements instead of an array. Since we are all linked list champs by now, we already know how to go about building a linked list given an input set of elements - create nodes that contain our elements and join the nodes using _next_ pointers. 

We will also use this example to introduce the notion of a _friend_ class in C++.

> A _friend class_ F is a C++ class that can access private and protected members of another class A in which F is declared as friend. Here, a _Queue_ class (F) may be allowed to access private members of a Node class (A).

{% highlight cpp %}
class Node {
  private:
    int data;
    Node *next;
    friend class Queue;
};

class Queue {
  private:
    Node *front, *rear;
  public:
    Queue ();
    void enqueue (int item);
    bool is_empty ();
    int dequeue ();
};

Queue::Queue () {
  this->front = NULL;
  this->rear = NULL;
}
{% endhighlight %}

There is also a notion of _friend function_, very similar to _friend class_:
> A _friend function_ f can be used to access private and protected members and it can be either:
* a method of a class A
* a global function

In the following post, we will see how to implement the methods _enqueue()_ and _dequeue()_ for the Queue class above.