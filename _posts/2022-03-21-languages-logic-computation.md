---
layout: post
title: Languages, Logic and Computation
categories: [NLP, logic, computation, OpenAI]
keywords: [NLP, logic, computation, OpenAI]
external-url: https://dotkay.github.io/2022/03/21/languages-logic-computation
---

A [previous post](https://dotkay.github.io/2022/02/22/languages-culture-communication) spoke about state-of-the-art NLP systems that are based on Transformers and some of the challenges around using such systems for translations. Although they could translate almost accurately, they may not match the nuances of spoken (informal) languages. There are other challenges around *Question Answering* systems - another tasks such NLP systems are capable of doing. In this post, this is explored futher to see when some computation (as in logical inference rather than mathematical inference) is needed to come up with an answer. We play with [OpenAI](https://openai.com/) APIs to see how the state-of-the-art NLP systems excel at language understanding and also where they have gaps to fill.

English, like many other languages, is a little ambiguous. There are well established rules of English grammar but I believe there are several statements in common parlance that have introduce some ambiguity. While I tried [OpenAI](https://openai.com/), in particular the `text-davinci-002` engine on a variety of English statements and the results were astounding, when I kept going on, there were some statements where the answer was not exactly clear. 

One of the was what _she_ refers to in a statement like _Anna hit Clara because she was drunk_. Though it looks ambiguous I believe as _Anna_ is the subject, the _she_ in the statement must refer to _Anna_. OpenAI does seem to tell me that the _she_ in the statement refers to _Anna_.

```
>>> response = openai.Completion.create(
      engine="text-davinci-002",
      prompt="Anna hit Clara because she was drunk.\n\nQ: Who was drunk?\nA:",
      top_p=1,
      ...
    )
>>> print(response)
{
  "choices": [
    {
      ...
      "text": " Anna was drunk."
    }
  ],
...
}
```

If I rephrase the above statement as _Anna hit Clara because she was drunk. Was Clara drunk?_, OpenAI was humble enough to admit that it does not know, which is impressive as there isn't enough context to infer if _Clara_ was drunk.

```
>>> response = openai.Completion.create(
      engine="text-davinci-002",
      prompt="Anna hit Clara because she was drunk.\n\nQ: Was Clara drunk?\nA:",
      ...
      stop=["\n"]
    )
>>> print(response)
{
  "choices": [
    {
      ...
      "text": " I don't know."
    }
  ],
  ...
}
```

What impressed me the most was the ability to do formulaic calculations and return an answer. 

```
>>> response = openai.Completion.create(
      engine="text-davinci-002",
      prompt="The sale price of a decent house in California is about a million dollars. 20%
      of the price needs to be paid as down payment. In addition, the county levies a 
      property tax of 1.2% on the sale price of the house. John takes a 30 year fixed rate 
      mortgage at 3.5% interest rate.\n\nQ: What would be John's monthly cost of ownership? 
      \nA:",
      ...
    )
>>> print(response)
{
  "choices": [
    {
      ... 
      "text": " John's monthly cost of ownership would be $4,167."
    }
  ],
  ...
}
```

While the ability to solve when numerical information was provided was too impressive, there was some struggle when the answer involved logical interpretation and numerical computation. For example, the query in the following requires interpreting what "boundary" is and how it contributes to the answer. 

```
>>> response = openai.Completion.create(
      engine="text-davinci-002",
      prompt="Dhoni scored a single off the first ball of the 11th over. Sachin scored two
      consecutive boundaries followed by a single. Dhoni hit the biggest six of the match. 
      He then followed it up with a single and retained strike. \n\nQ: How many runs were 
      scored off the 11th over? \nA:",
      ...
    )
>>> print(response)
{
  "choices": [
    {
      ...
      "text": " 15"
    }
  ],
  ...
}
```

Human languages are such that they involve logical interpretation, deduction and computation. It is precisely this challenge that leads to misinterpretation, miscommunication and chaos - you can think of the last time a celebrity or a politican claimed his comments were misinterpreted or taken out of context. However, we as human beings deal with these every day and are attuned to the fallacies and inaccuracies. Our communication system, the one that distinguishes us from many other species, is itself a stochastic one.

Some statements require logical deduction which is challenging for deep learning systems (that learn from patterns contained in a training corpus). For example,

```
>>> response = openai.Completion.create(
      engine="text-davinci-002",
      prompt="marco passed the ball to miel, miel quickly gave it to don who passed it on to
      sky. sky ran with it for a while and gave it to anna.\n\nQ: Does marco have the ball 
      now?\nA:",
      ...
   )
   >>> print(response)
{
  "choices": [
    {
      ...
      "text": " No"
    }
  ],
  ...
}
```

While the system is able to deduce that _marco_ does not have the ball, a deduction performed to answer _who has the ball?_ doesn't seem to work well.

```
>>> response = openai.Completion.create(
      engine="text-davinci-002",
      prompt="marco passed the ball to miel, miel quickly gave it to don who passed it on to
      sky. sky ran with it for a while and gave it to anna.\n\nQ: Who has the ball now?\nA:",
      ...
    )
>>> print(response)
{
  "choices": [
    {
      ...
      "text": ""
    }
  ],
  ...
}
```

There is immense research interest in this area and the progress being made is as impressive as that has been achieved so far. Hopefully, in a future post, I will be able to show an NLP system that combines logical reasoning with deep learning and is able to answer much more fancier questions. I am looking forward to it.
