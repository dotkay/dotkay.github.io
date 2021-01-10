---
layout: post
title: Creating and searching for prefixes in a Trie
categories: [algorithms, data structures, trie]
keywords: C++, data structures, trie
external-url: https://dotkay.github.io/2018/03/24/trie-insert-search
---

In a [previous post](https://dotkay.github.io/2018/03/21/trie-two) we created a Trie data structure in C++ and wrote some basic constructor and utility functions. Now, let us populate a Trie given a character string as input. Recall that Tries are efficient as they store common prefixes together. 

If we want to store strings 'Annapaola', 'Annalisa', 'Annamaria' and 'Anna', we will store the common prefix 'Anna' and then fork off to children nodes that would contain the remaining parts of the strings. This indicates that we need to traverse the string and keep adding nodes for the new (unseen) characters. We already have our `newTrieNode()` to create a new node for such characters. And we also need to maintain a node to indicate the end (recall we have `isLeaf` field for that purpose).

{% highlight cpp %}
void insert(Trie*& root, std::string str)
{
  char* cstr = &str[0];  
  // create a new trie node if not present
  if (root == nullptr)
    root = newTrieNode();
  // iterate over cstr and populate trie
  Trie* curr = root;
  while (*cstr)
  {
    // currently not in the trie, create a trie node
    if (curr->lookup.find(*cstr) == curr->lookup.end())
      curr->lookup[*cstr] = newTrieNode();
    // go to next node
    curr = curr->lookup[*cstr];
    cstr++;
  }
  curr->isLeaf = true;
}
{% endhighlight %}

We also convert std::string to character string (char*) and iterate over the characters of the string. We iteratively look for the character we are currently processing to check if it has an entry in our hashmap `lookup` and if does not have an entry, it is an unencountered character and we create a new Trie node. And when we finish iterating over all the nodes, we set `isLeaf` for the last node to be `true`.

Now, search follows a similar approach. Given an input string, if we want to search for the occurence of the entire string in our Trie (not just a prefix), we traverse the Trie starting from the root checking our hashmap to look for characters in the string and check if our search ends in a node with `isLeaf` set to `true` which would indicate the end of the string. If one of the characters is not found in the hashmap, we would know that the string does not exist and if immediately return `false`. For example, if our Trie contains only `hello` and if we search for `hi`, `h` would be found in the hashmap and when we move to the next node, `i` wouldn't be found and hence `curr = curr->lookup[i]` would return a `nullptr`.

{% highlight cpp %}
bool search(Trie* node, std::string str)
{
  char* cstr = &str[0];
  if (node == nullptr)
    return false; 
  Trie* curr = node;
  while (*cstr)
  {
    curr = curr->lookup[*cstr];
    if (curr == nullptr)
      return false;
    cstr++;
  }
  return curr->isLeaf;
}
{% endhighlight %}

We can also search for string prefixes in which case, we do not have the luxury of returning `isLeaf` as prefixes would just be a part of a path in the Tree and need not end in a leaf node.