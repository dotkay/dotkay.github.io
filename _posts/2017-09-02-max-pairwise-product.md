---
layout: post
title: Maximum pairwise product
categories: [algorithms, C++]
keywords: [algorithms, C++]
external-url: https://dotkay.github.io/2017/09/02/max-pairwise-product
---

Let's take a quick look at a simple problem:   

*Given a list of numbers, how would you determine the maximum pairwise product of numbers in the list?*

For example, if we have the list `[1; 3; 5; -2]` the maximum pairwise product is `15`, which is the product of `3` and `5`.

The straigt-forward approach is to compute all possible pairwise products and identify the maximum among the intermediate results:

{% highlight cpp %}
long long MaxPairwiseProduct(const vector<int>& numbers) {
	long long result = 0; // result to hold the max pairwise product
	int n = numbers.size();
	long long product = 0;
	for (int i = 0; i < n; i++) {
		for (int j = i + 1; j < n; j++) {
			product = (long long)numbers[i] * numbers[j]; 
			if (product > result)
				result = product;
		}
	}
	return result;
}
{% endhighlight %}

Since we have two loops that iterate over the list of numbers, the time complexity is O(n<sup>2</sup>). 

Can we do better? Yes, we can. The idea is to find the maximum and the second maximum elements in the list - and their product would be the maximum pairwise product.  

{% highlight cpp %}
long long MaxPairwiseProductFast(const vector<int>& numbers) {
	int n = numbers.size();
	long long product = 0;
	// find the max element in the collection 'numbers'
	int max_index1 = -1;
	for (int i = 0; i < n; i++) {
		if ((max_index1 == -1) || (numbers[i] > max_index1)) {
			max_index1 = i; // largest number in the list
		}
	}
	
	int max_index2 = -1;
	for (int j = 0; j < n; j++) {
		if ((numbers[j] != numbers[max_index1]) && ((max_index2 == -1) ||
			(numbers[j] > max_index2))) {
			max_index2 = j; // second largest number in the list
		}
	}
	
	product = numbers[max_index1] * numbers[max_index2];
	return ((long long) product);
}
{% endhighlight %}

Simple and sweet!