---
layout: post
title: Logic, Languages and Reasoning
categories: [NLP, logic, reasoning, computation, NLTK]
keywords: [NLP, logic, reasoning, computation, NLTK]
external-url: https://dotkay.github.io/2022/04/24/logic-languages-reasoning
---

Human languages developed and evolved over thousands of years. Though most languages have a structure (defined by the rules of grammar) we think of spoken languages as a series of informal statements ("informal" compared to the "formal" rigor of mathematical statements). While informal statements helped human species to communicate and collaborate, eventually evolving languages themselves, informal statements were not enough for settling arguments, legal disputes or discovering (new) knowledge from existing knowledge. Socrates, Plato's teacher, is credited with coming up with inductive arguments and universal definitions. Aristotle's logic consisted of formulating statements and deriving new knowledge (conclusion) from the knowledge contained in a set of statements (_premises_) guided by rules that he called _syllogisms_. Aristotle, a student of Plato, is credited with the earliest study of logic, _formal logic_, in his collected works _[Organon]_(https://archive.org/details/AristotleOrganon/mode/2up). Plato also contributed to the study of reasoning. While Plato relied on _deduction_ from _a priori_ knowledge and postulated that knowledge of things that happen can be deduced from the knowledge of universal ideas, Aristotle's epistemology postulated that knowledge of things that happen build up to universal knowledge collectively. Together the main recipes for reasoning - induction, deduction and abduction - were discovered that are the pillars for making reasoning infallible.

Mathematicians developed it further for mathematical reasoning which got shaped, like many mathematical computations, into _automated reasoning_ using computer programs by computer scientists. Mathematical logic is the cornerstone of systems that are used for reasoning about the correctness of computer programs.

We can use [NLTK](https://www.nltk.org/)'s Python API to play with it to see what it means to encode English sentences as logical formulas. Once we are able to encode knowledge (in English sentences) we can use well formed rules of logic to deduce new information, also called _logical inference_.

```python
import nltk
from nltk import load_parser
grammar_file = 'file:///nltk_data/grammars/book_grammars/simple-sem.fcfg'
lp = load_parser(grammar_file)
stmt = 'Angus gives a bone to every dog'
trees = lp.parse(stmt.split())
for tree in trees:
    print(tree.label()['SEM'])
```

This gives the semantics in the form of a logical formula:

```
all z2.(dog(z2) -> exists z1.(bone(z1) & give(angus,z1,z2)))
```

Further more, one could use the theorem prover that comes along with NLTK to check for consistency among statements and prove goals (conclusion) given a list of statements (premises). For example, one could write 

```python
mini_has_ball = read_expr('has(mini)')
mini2jane = read_expr('pass(mini, jane)')
rules = read_expr('all x. all y. (pass(x, y) -> has(y))')
```

We just encoded some English statements as well as the assumption that if _x_ passes the ball to _y_, then _y_ will have the ball. We can use a theorem prover to prove a goal that _jane has the ball_ and check if it follows from our assumptions, i.e. of the goal can be derived given the assumptions

```python
jane_has_ball = read_expr('has(jane)')
prover = nltk.Prover9()
prover.prove(jane_has_ball, [rules, mini2jane])
```
and the prover, if it can establish a proof, will return:
```
True
```

This kind of encoding and logical reasoning might be needed to answer questions like the last one we saw in a [previous post](https://dotkay.github.io/2022/03/21/languages-logic-computation). One might also need more expressive logics in order to encode statements about temporal events succinctly. However, languages themselves are stochastic systems which would imply that we would never be able to come up with logically accurate formulations of the sentences we use in everyday conversations, especially when it involves conversations involving languages that are not one's native language and might have grammatical mistakes and still convey the intended message. Legal documents or financial documents, for example, could be structured in a precise format that might allow one to formulate the sentences in a logical language and make queries that can return an accurate answer that can be reasoned about if needed - think of a healthcare database to which policy makers submit queries in a natural language. A deep learning based approach, which looks at several usage patterns, to arrive at an approximate formulation which would still enable one to deduce new information from a set of facts already provided. This would be more crucial in developing (explainable) AI systems that can be reasoned about, which is especially crucial in healthcare and other critical domains where AI systems are beginning to find their place.


![img](https://images.metmuseum.org/CRDImages/ep/original/DP-13139-001.jpg#center)
*Death of Socrates, by Jacques Louis David (Credits: The Met)*

