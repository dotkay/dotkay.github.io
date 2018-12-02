---
layout: post
title: Queue using Arrays - Operations
categories: [algorithms, data structures, queues]
keywords: C++, data structures, queues
external-url: https://dotkay.github.io/2017/11/10/queue_operations
---

In our [previous post](https://dotkay.github.io/2017/11/09/queues), we looked at the modelling of the Queue class using an _array_ as the container to hold the queue elements. _front_ and _rear_ indicate the boundary of the queue (the first and the last elements). When we want to add a new element, we add it at the _rear_. Likewise, when we want to remove and process an element, we remove it from the _front_. That is, enqueue increments the `rear` member and dequeue increments the `front` member.

<br>
![Queue Operations](/assets/images/data_structures/queue_arr.png){:class="img=responsive"}

{% highlight cpp %}
void Queue::enqueue (int item) {
  if (rear >= MAXSIZE - 1)
    throw out_of_range("Queue is full. Nothing can be enqueued now.");
  else {
    arr[++rear] = item;
  }
}

int Queue::dequeue () {
  if (rear == -1)
    throw out_of_range("Can not dequeue from empty queue");
  return arr[front++];
}
{% endhighlight %}

So, when _front = rear_ there is only one element and if _front > rear_, the queue is empty (recollect that the `front` is initialized to 0 and `rear` is initialized to -1).

{% highlight cpp %}
bool Queue::is_empty () {
  return (front > rear);
}
{% endhighlight %}

Although pretty straight-forward, Queues have a variety of applications. We will soon see some applications when we discuss Graph data structures.