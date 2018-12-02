---
layout: post
title: Stack using Arrays - Operations
categories: [algorithms, data structures, stacks]
keywords: C++, data structures, stacks
external-url: https://dotkay.github.io/2017/11/14/stacks_operations
---

In our [previous post](https://dotkay.github.io/2017/11/13/stacks) we introduced the _Stack_ data structure implemented using arrays. Now, we will see how to implement the operations on such a Stack - in particular we will learn how to implement the following methods:

* Push(item) - to push the input item into the stack
* Pop() - to pop an item from the stack
* top_of_stack() - to track the item in the top of the stack
* is_empty() - to check if the stack is empty

As we have already seen Queues, we pretty much have an idea of how to go about doing this. While in the case of a queue, we initialized front and rear and used those to see when we can add elements and which index to increment, here we initialized top (for _top of stack_) to `-1` and we shall use that while performing our operations. We are tracking only _top_, so we increment the index when we _push()_, decrement it when we _pop()_ and check the value to determine when the stack is empty as shown in the code fragment below:

{% highlight cpp %}
bool Stack::push (int item) {
  // check if there's place to push
  if (top >= (MAXSIZE-1)) {
    cout << "Stack overflow!";
    return false;
  }
  // if there's place store the item
  else {
    arr[++top] = item;
    return true;
  }
}

int Stack::pop () {
  // check if there's anything to pop
  // or if the stack is empty
  if (top < 0) {
    throw out_of_range("Stack underflow!");
  }
  else {
    return arr[top--];
  }
}

int Stack::top_of_stack () {
  return arr[top];
}

bool Stack::is_empty () {
  return (top == -1);
}
{% endhighlight %}

That was easy!