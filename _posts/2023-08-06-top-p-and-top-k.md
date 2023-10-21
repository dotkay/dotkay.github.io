---
layout: post
title: LLM Tokens, Sampling and Hallucinations
categories: [AI/ML, LLM, Tokens, Sampling]
keywords: [AI/ML, LLM, Tokens, Sampling]
external-url: https://dotkay.github.io/2023/08/06/top-p-and-top-k
---

Many Large Language Model (LLM) APIs have certain parameters that help in selecting the tokens. I am not sure if these should be called *parameters* as these are unlike temperature, which is a *hyperparameter* - better considered as a sampling technique or inference time parameter setting. These control how predictable (i.e. one could be highly certain that the tokens would come from a most probable set of tokens) the output is. More technically, they control output probability distributions. After all, we are living in a world where probabilistic systems rule everything and everyone has, by now, heard of hallucinations from LLM applications that generate text.
<br>

**Top-K**

LLMs typically work on a sequence of tokens. For simplicity the tokens could be considered as words in the target language (for translation or content generation task). Note that most LLMs (like ChatGPT for example) tokenize on sub-words: i.e. for English language every word is approximately 1-1.5 tokens while for other European languages like Spanish or French every word is approximately 2+ tokens. It is important to note that the number is tokens is not the same as the number of words in the target language. When an LLM gobbles up an input sentence and tries to generate an output sentence, it has to predict the tokens in the output language vocabulary one by one. On a very high level, this generates a discrete probability distribution over all possible tokens available (the softmax layer at the end of your network does this). The different output tokens would have different probabilities associated with it and they would sum to 1.

For example, if our task is a sentence completion task, and our input sentence is

```
Aurore likes eating ____________.
```

Our LLM could potentially fill it up with any of the thousands of tokens that would have an associated high probability with *eat*. It could choose bread, cheese, pizza or even snail, rabbit or a shark. What if we want it to predict only the most likely outcomes (e.g. bread, cheese, etc. and not rare tokens like a shark), we can make the LLM choose from among the top *K* tokens. Our LLM would then:

Assume that there are only 6 tokens to choose from, with the following probabilities:

| Token | Probability |
| :-- | :-- |
| Bread | $t_0 : 0.43$ |
| Cheese | $t_1 : 0.35$ |
| Pizza | $t_2 : 0.16$ |
| Rabbit | $t_3 : 0.04$ |
| Snail | $t_4 : 0.015$ |
| Shark | $t_5 : 0.005$ |

* Order all of the tokens in order of their probabilities
* Select the K tokens with the highest probablities and creates a new distribution
* Sample the token from this new distribution to predict 

Note the the probabilities should add up to 1.

Now from the above set of six tokens, if we want to choose the most probable 3 tokens (K = 3), those would be:

| Token | Probability |
| :-- | :-- |
| Bread | $t_0 : 0.43$ |
| Cheese | $t_1 : 0.35$ |
| Pizza | $t_2 : 0.16$ |

This is our new distribution. However the probabilities should add up to 1 and hence the above set needs to be normalized by the sum of the K = 3 tokens. (0.43 + 0.35 + 0.16 = 0.94). This normalization would give us:

| Token | Probability |
| :-- | :-- |
| Bread | $t_0 : 0.46$ |
| Cheese | $t_1 : 0.37$ |
| Pizza | $t_2 : 0.17$ |

which sums to 1. If you set K=1, it would be a *greedy* approach where the highest probability token would always get selected.
<br>

**Top-p**

This is also referred to as *nucleus sampling*. Very similar to Top-K but instead of requesting certain most probable tokens, we want to choose enough tokens to cover a certain probability denoted *p*. 

* Order all of the tokens in order of their probabilities
* Select the most probable tokens in such a way that their probabilities sum to at least *p*
* Sample the token from this new distribution to predict

Suppose we set *p* to 0.75 in our case, we would be picking the following tokens to choose from (their probabilities sum to at least 0.9 (0.43 + 0.35 = 0.78)

| Token | Probability |
| :-- | :-- |
| Bread | $t_0 : 0.43$ |
| Cheese | $t_1 : 0.35$ |

Again, we will have to normalize the new distribution as done in Top-K, so that the probabilities sum to 1.

| Token | Probability |
| :-- | :-- |
| Bread | $t_0 : 0.55$ |
| Cheese | $t_1 : 0.45$ |

The next time you feel hallucinated, you may want to check these parameter settings in your API calls.