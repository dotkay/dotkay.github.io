---
layout: post
title: Queue using Linked List - Operations
categories: [algorithms, data structures, queues]
keywords: C++, data structures, queues
external-url: https://dotkay.github.io/2017/11/12/queue_linked_list_methods
---

In our [previous post](https://dotkay.github.io/2017/11/11/queues_linked_list), we saw how to model a Queue data structure using Linked List as a container for elements. Now, we will see how to implement the methods _enqueue()_ and _dequeue()_. 

This is very similar to inserting a new element to a linked list as we saw [earlier](https://dotkay.github.io/2017/11/02/linked-list-insertion). To insert a new item, we construct a node with that item and a _next_ pointer, add it to the list and adjust the pointers.

{% highlight cpp %}
void Queue::enqueue (int item) {
  // if the queue is empty
  // front and rear are the same, i.e the new item
  Node *new_item = new Node;
  new_item->data = item;
  new_item->next = NULL;
  if (rear == NULL) {
    front = rear = new_item;
    return;
  }
  // else add it to the rear end 
  // of the queue
  rear->next = new_item;
  rear = new_item;
}
{% endhighlight %}

<br>
![Queue Operations](/assets/images/data_structures/queue_ll.png){:class="img=responsive"}

{% highlight cpp %}
int Queue::dequeue () {
  int res;
  // check if the queue is empty
  if (front == NULL)
    throw out_of_range("Empty queue");
  
  // get the item to dequeue
  Node *dequeue_item = front;
  res = front->data;
  front = front->next;

  // now, if there was only one node
  // to pop front would point to NULL
  if (front == NULL)
    rear = NULL;

  delete (dequeue_item);
  return res;
}

bool Queue::is_empty () {
  return (front == NULL);
}
{% endhighlight %}

That's all there is in Queues!