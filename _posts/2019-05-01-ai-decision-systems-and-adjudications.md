---
layout: post
title: Technology in Adjudications
categories: [technology, AI, adjudication, decision theory]
keywords: [technology, AI, adjudication, decision theory]
external-url: https://dotkay.github.io/2019-05-01-ai-decision-systems-and-adjudications
---

We have seen the benefits of deploying technology in many real world applications. Anyone who has used Yelp or IMDB or Rotten Tomatoes before deciding on a restaurant or watching a movie has accepted the indirect aid the (average) ratings on those sites provided about the quality of the restaurant or the movie. Anyone who has watched sports like Cricket, Tennis or Football (soccer) would be able to appreciate the role Hawk-Eye technology plays in resolving decision confusions by on-field referees or umpires. One just wonders how much of technology is used in other adjudications (like lawsuits, for example) and how technology can aid (rather than replace) such adjudications.

Let us take an example of such an adjudication - for example, a dispute between two parties (very much like two teams in a sport) being resolved by an adjudicator (like an on-field referee or an umpire). In many sports, technology plays a huge role in aiding the on-field umpire or even over-turning the decisions of the on-field umpire when one of the parties was not satisfied with his original decision. In cricket, this is referred to as [Decision Review System (DRS)](https://www.youtube.com/watch?v=is8Vd_YQKwE) - which in turn uses several technologies like Hawk-Eye vision cameras, ball tracking technology and projection and estimation of the movement of the ball beyond the point of obstruction. How do we generalize this for any adjudication process.

Shown below is a general flow of what a simplified process would look like. 

**Components of a Decision System**

<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/tmp/main/ideas/adj_tech.PNG"></center>
</div>

* **Investigation Facts** These are the facts coming out of an investigation. In sports, these could be coming from several cameras and ball tracking systems. In a civil or criminal lawsuit this could be the facts compiled by a set of investigators.

* **Acceptable Behaviours** These are the _fair_ rules of the game. In sports, these could be coming from the rule book. In a lawsuit these could be the set of rules acceptable by law (and not necessarily by society). 

* **Fact Compiler** This is a comparision of investigation facts against the rules of the game to see if all the rules were obeyed or some were not obeyed. The comparision tells us that happened that were actually allowed by the rules of the game (or by law) and what were disallowed by law. 

Each of the two parties involved in the dispute can use such a _Fact Compiler_ in order to compile their facts and check what was compromised and what rules were obeyed. There might be rule breaks that one party thinks was the right thing to do and needs an adjudicator to decide taking into account the situation under which the rule break happened (injuring another person during an act of self defence, for example). 

**Decision Systems**
Now, the decision making system has at least three sets of facts to compare - the compiled facts from each of the two parties involved in the dispute, and the fundamental truth compiled from independent investigation and acceptable (lawful) behaviours. The decision making system can compare these three sets of facts and enumerate the lawful and unlawful behaviours (w.r.t the truth as known to the investigation compared against acceptable legal behaviours). An adjudicator can consult this set of facts in order to avoid his own bias before making an adjudication. Purists might point out that this would not reduce bias as the bias introduced by investigation and fact compiler might indeed propagate to the compiled set of facts, and that is true. The effort to reduce the bias at these stages is to make the Fact Compiler and the input facts less biased by providing "more", "unbiased" data. 

**Natural Language Understanding**
While understanding natural language with context is a challenging area of Computer Science and Mathematical logic, this would pave way for an interesting area of research to encode the contexts and use that encoding while building technologies to understand natural language. One of the simplest examples why this is a challenge is to just look at the following pairs of sentences ([inspired by this](https://en.wikipedia.org/wiki/Time_flies_like_an_arrow;_fruit_flies_like_a_banana))and guess an appropriate word for the blank in the second statement:

```
Time flies like an arrow
Fruit flies like a _______
```

Most AI systems would not guess the blank as a fruit, let alone one that rhymes with _arrow_ (like _mango_). The word "like", though the same word and spelling in both cases, alters the meaning of the statements that pure structural analysis would not help one in completing the second one. We need some semantics and context behind the statements. Another example would be to check if a given statement is a sarcastic one or a serious one. Sarcasm detection, though there are partially successful approaches, is a challenging area for natural language understanding systems. 

**Automated Reasoning Engines, Logic and Encoding Facts**
Many of the reasoning engines built for reasoning about the correct of computer programs (a set of program statements with a specific syntax (syntax of the programming language), much like the set of facts in English) work on [predicate logic](http://www.manyworldsoflogic.com/predicateLogic.html) and there are well known automated solvers to solve a set of facts encoded in this logic. However, encoding contexts and possibilities would involve more than just predicate logic - it might involve modal logic and epistemic logic. A single reasoning engine, if and when built, would be the fact compiler, once the individual facts from investigations can be encoded as precise mathematical statements, rather than ambiguous English statements. While research in this area is progressing, it is also important to keep an eye on the applications - like lawsuits as legal statements in English language might require more effort to encode rather than informal statements in English language. 

While aiding an adjudicator is an important part of the technology, encoding the facts, at each level of the process, as statements in mathematical logic would allow allow one to play back the compiled judgement (a set of facts) to understand how those facts were arrived at, from the initial sets of facts (like investigations and laws). This is a huge step in explaining the decision made (this would be the cornerstone of an explainable AI system). It would also provide a valuable tool for adjudicators to replay different decisions to check if they would be consistent with the initial sets of facts, or even replay them with some facts removed or altered to explain how the decision would have been different in case one of the parties had done something different (been more lawful instead of breaking the law). 