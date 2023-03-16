---
layout: post
title: From Feature Engineering to Prompt Engineering
categories: [AI/ML, Feature Engineering, Prompt, OpenAI]
keywords: [AI/ML, Feature Engineering, Prompt, OpenAI]
external-url: https://dotkay.github.io/2022/12/21/feature-prompt-engg
---

A few years ago, when Machine Learning was at its infancy, *feature engineering* used to be the swiss army knife for getting great results out of the models. Many *domain experts*, who claimed to know which features were important and which features weren't important for a particular problem, became widely sought after. From a handful of features for predicting housing prices, like number of rooms, square footage, Zipcode, etc., to several hundreds of millions of features that might be present in a typical social media feed recommendation system, model features have grown at an impressive rate, thanks to the many varieties of inexpensive sensors and of course the distribution power of the internet. *Feature Engineering* became a role on its own in many companies that were building machine learning models. An automobile engineer would know which features are relevant or important to the stability of a car, while a grocery retailer would know about which items when placed at specific aisles in the store would garner more interest. Unsurprisingly, this also led to considerable interest from academia and subsequently there were more efficient techniques formalized and developed for effective *feature selection* based on the problem at hand and *feature construction* and *feature extraction* from raw data. Engineering teams started developing tools that facilitated such processes - like [Featuretools](https://www.featuretools.com/) for Python.

Fast forward a decade, feature engineering seems to be less in fashion while *prompt engineering* has captured the podium. This is primarily due to the interest and advancement in large language models. While earlier machine learning models were built to solve specific problems and hence needed domain experts to curate the features that best helps the model, advancements in few shot learning made selecting specific features less and less relevant while maintaining the same accuracy of the model. Today, models like OpenAI's ChatGPT and the like can work on a variety of domains as they are trained on a collective dataset (dataset from as many different domains as possible) and hence have captured the relationships between the different domains by attaching weights to the learned contexts as did the previous machine learning algorithms that attached weights to different features. A word like *teddy* would be identified with a context of *toys* more (larger weights) while the data is about donations to charity for helping children. The same word however would be identified with a context of *politics* while the data is about national parks and national forests. 

For example, experimenting with [ChatGPT](https://openai.com/blog/chatgpt), when the system is prompted with the following question, it prompts back asking for clarifications, in order to identify the context.

```
user: Can you tell me about teddy?
ChatGPT: I'm sorry, but without additional context, I'm not sure which "teddy" you're referring to. 
There are several possible meanings for the word "teddy," such as:
...
...
```

The user might give an indirect context that the system still identifies with the initial prompt (*teddy*) - i.e. the system has memory and it retrieves the weights from its collection of different contexts, much like an indexing system would retrieve the best page among a collection of pages related to a search keyword. 

```
user: tell me about the teddy related to national parks and forests
ChatGPT: Theodore Roosevelt is closely associated with the conservation movement in the United States and is often referred 
to as the "Conservation President." During his presidency from 1901 to 1909, he took significant steps to protect natural 
resources, establish national parks, and preserve wilderness areas.
...
...
```

The user could still prompt the system with a subsequent string that could entirely change the course of the conversation, much like how many real-world informal conversations move around from one topic to another while the topics themselves might be unrelated but tied together by some weak links.

```
user: tell me about the teddy related to donations to charity for children
ChatGPT: One possible "teddy" you might be referring to in this context is the "Teddy Bear" charity program. 
The Teddy Bear program is a charitable initiative that collects and distributes teddy bears and other stuffed animals 
to children in need, such as those who are sick, homeless, or traumatized.
The Teddy Bear program was first started by police officers in the United States in ...
...
...
```

The user could ask about an unrelated topic as a subsequent prompt but the system might still try to find a common context and if there is would talk about it, because the subsequent prompts are considered part of the same conversation.

```
user: what about fashion?
ChatGPT: In the world of fashion, a "teddy" can refer to a type of lingerie for women. A teddy is a 
one-piece garment that combines a camisole top and panties, often made from silk or other
...
...
```

Why is this impressive or important. In many real-world impactful applications (rather than informal chat systems), it is crucial to maintain a conversation topic - think about an airline customer service chatbot or an internet service center or education software where one builds on from simple fundamental concepts to advanced topics that are built by stitching together fundamental concepts. It is also crucial to have the ability to switch to a completely different topic even when there might be a related weak link in the conversation thread. This switch is effected by engineering the prompt in such a way as to turn the system's attention from it's current context to a new context.

```
user: No, let's just talk about contemporary fashion...
ChatGPT: Certainly! Contemporary fashion is a constantly evolving and diverse industry, encompassing a 
wide range of styles, trends, and designers. Some of the key trends and movements in ...
...
...
```

Now that *prompt engineering* gets the job done, is *feature engineering* irrelevant? Not really. It would still require a domain expert to help train the system with well engineered prompts in order for the system not to stray away. For example, a teacher could help with engineering the right prompts that would make the learning process more effective by not only charting the path to learn - from essential fundamental concepts to more involved concepts, but also in personalizing the path by identifying the learning challenges based on the questions (prompts) from the user (learner). This could be the next revolution in personalized, adaptive learning systems. There could be many other situations where such systems could benefit from domain experts. Some of them include negotiation systems, interviews and management training systems, navigation, technical support, as well as entertainment systems. Adding to this, multi-modal prompting systems, where the prompts themselves would have other modes (like voice, images, etc.) in addition to text would be immensely powerful in many real-world applications. Voice prompts would be very useful for autonomous machines, and image prompts would be exciting for content creation. I am eagerly looking forward to playing with those.

