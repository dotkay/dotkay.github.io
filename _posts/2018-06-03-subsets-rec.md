---
layout: post
title: Computing subsets of a set
categories: [algorithms, recursion, C++, power set]
keywords: [recursion, algorithms, C++, power set]
external-url: https://dotkay.github.io/2018/06/03/subsets-rec
---

Let us try and compute all subsets of a given set of integers. 

Let us try a recursive solution in this post. We will also see how to implement it in a more efficient manner in a later post. Suppose that the user is given the set of elements as a vector of integers and to further simplify, let us assume that there are no duplicates in the input set (and that's why we call it a set). We want to return the set of all possible subsets that can be formed - a  vector of vectors. At this point, we have some idea of what data-type we could use. If you are programming in C++, one could straight away use a `std::vector`. If you are using Python or some other functional language, you could use a list. 

Let's think recursively now. What would be the base condition? That is we are given an empty set as input. We just return. That was simple.

Now, if we had just one element in our input set, what would be our result? The result would have a set containing the one element, and an empty set (as empty set is a valid subset of any set). This already gives us an operational hint - may be, we can start with an empty result set to begin with and traverse the given input set and add elements from it to our result set. In this simple case, let us suppose that the input set is just `[1]`. Here's how we would proceed
```
[]        - empty result set
[] [1]    - adding the one element from our input set
``` 

Let's keep going. What happens when there are two elements in our input set? Say, `[1 2]`? As we saw above, we will start with an empty result set `[]`. We can traverse the input set and pick and add more elements from it to our result set, until we exhaust the input set:
```
[]              - empty result set
[] [1]          - adding the first element
[] [1] [1 2]    - adding the second element
```

At this point, we have exhausted the input set. But we have not captured `[2]` as a part of our solution yet. What do we need to do in order to capture that? Just like how we added the first element `1` to our initial empty set, we should add only the second element `2` to our initial input set. In order words, we backtrack to the state (since we are going to be writing a recursive algorithm, this would correspond to popping from the recursion stack) where we had only the empty set, and add the second element. The entire sequence of operations would now appear like:
```
[]                - empty result set
[] [1]            - adding the first element
[] [1] [1 2]      - adding the second element
                  - ** backtrack **
[] [1] [1 2] [2]  - adding only the second element
```

We can keep going. Note that when we have three elements `[1 2 3]`, we will need to backtrack to the state where our result had `[1]` and add `3` to it yielding `[1 3]` and later on (when? when we exhaust the rest of the input list) backtrack to the state where our result had `[]` and add `2`, and similarly `3` to the empty result set. I would leave it as an exercise to work out the steps as we did above.

We see there are three major operations:

1. insert the intermediate result set to our result set of sets (like how we added empty set in the left most column above
2. traverse the input set starting from the index pointing to the first element, picking elements one by one and adding it to our intermediate result set, until we exhaust all the elements in our input set
3. backtrack (corresponding to moving the index to point to the second element) and pick and add elements one by one as in step 2.

Let's write it in C++ language.

{% highlight cpp %}
void all_subsets_rec(std::vector<std::vector<int>>& result,
                     std::vector<int>& int_result,
                     std::vector<int> input_set,
                     int start_index)
{
  int input_size = input_set.size();
  // base case
  if (input_size == 0)
    return;
  
  // populate result set of sets
  result.push_back(int_result);

  // traverse
  for (int i = start_index; i < input_size; i++)
  {
    // populate intermediate result
    int_result.push_back(input_set[i]);
    // recurse
    find_all_subsets(result, int_result, input_set, i+1);
    // backtrack
    int_result.pop_back();
  }
}
{% endhighlight %}

and the above recursive function is called in the driver program as:

{% highlight cpp %}
std::vector<std::vector<int>> result;
std::vector<int> int_result;
all_subsets_rec(result, int_result, input_set, 0);
{% endhighlight %}


At the face of it, it looks like a very simple problem and it is. But this is one of those problems which is very easy to get it wrong. Many things could go wrong here - you could overflow some bounds, add the same element twice or more times to the result array and so on.

