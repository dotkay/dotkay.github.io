---
layout: post
title: Reinforcement Learning - Value, Policy and Action
categories: [technology, ai, reinforcement learning]
keywords: [technology, ai, reinforcement learning]
external-url: https://dotkay.github.io/2019/03/21/reinforcement-learning-vpa
---

In a [previous post](https://dotkay.github.io/2019/03/09/reinforcement-learning-theory), we looked at some more terminology in order to dive into Reinforcement Learning (RL). We will see some more key constituents of RL in this one. In particular, we will see how we evaluate states and policies and how actions play a role. 

We already saw that states are evaluated using *state value function - v(s)* that tells us how good a state *s* is. We also know that our agent can decide to take certain actions to move from one state to another. The agent, ideally, should take the best action - the one that would maximize the value of the states the agent would end up in, by taking the action(s). We talked about an example of taking two actions that correspond to spending \$300 in two different ways. Since there could be multiple actions with different probabilities, each action would lead to a different outcome. What determines the actions we take? Are there rules that allow us to decide?

A policy denoted by $\pi$ is a distribution of actions over states, i.e. it denotes the probabilities of different actions given a state *s*. This completely defines the behavior of the agent. The agent uses a policy to decide what actions to take. Hence in RL, we need to identify the best policy - that would lead us to states with maximum returns. More formally,

$$
\pi(a \mid s) = \mathbb{P}[A_t = a \mid S_t = s]
$$

Given a policy $\pi$ the transition dynamics defined by our Markov process would take us through a sequence of states that would get us rewards for that policy. Since actions help us transition from one state to another, the overall transition dynamics (it is after all a probabilistic system and each action has a specific probability of being taken) would be the average of all the actions that take us through the different sequences of states. More formally,

$$
\mathcal{P}^{\pi}_{s, s'} = \sum_{a \in A} \pi(a \mid s)\mathcal{P}_{s, s'}^{a}
$$

The rewards would therefore be,

$$
\mathcal{R}_{s}^{\pi} = \sum_{a \in A} \pi(a \mid s)\mathcal{R}^{a}_{s}
$$

Given a policy $\pi$, we can encapsulate all the knowledge we need in two functions:

1. State value function $v_{\pi}(s)$ that denotes *how good is it to be in state $s$ following policy $\pi$*

$$
v_{\pi}(s) = \mathbb{E}_{\pi}[G_t \mid S_t = s]
$$

2. Action value function $q_{\pi}(s, a)$ that denotes *how good is it to take an action $a$ while being in state $s$*

$$
q_{\pi}(s, a) = \mathbb{E}_{\pi}[G_t \mid S_t = s, A_t = a]
$$

Stepping back from formalizing, let us rething what is our ultimate goal when we program an agent. We want to:

- Identify what are the best states to be in (with the help of state value function)
- Identify what action to choose whatever state we end up in (with the help of action value function)

But we are not just satisfied by knowing how good a state is or even how good an action in a given state is. We want to find the best (optimal) values for state value function and action value functions - denoted by $ v_{*} (s)$ and $ q_{*} (s, a)$ over all possible policies. These are governed by two equations:

1. Bellman Expectation Equation - that helps us with evaluating states and actions
2. Bellman Optimality Equation - that helps us in identifying optimal states and actions

The formalisms we came up in this and in the previous post would help us arrive at the above equations.
