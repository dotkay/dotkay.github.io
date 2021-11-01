---
layout: post
title: Reinforcement Learning - Theoretical Foundations
categories: [technology, ai, reinforcement learning]
keywords: [technology, ai, reinforcement learning]
external-url: https://dotkay.github.io/2019/03/09/reinforcement-learning-theory
---

In the [previous post](https://dotkay.github.io/2019/03/03/reinforcement-learning), we saw the basic concepts and terminology used in *Reinforcement Learning* (RL). Markov Decision Processes are used to describe the environment. 

> The future is independent of the past given the present

A *state* is considered Markov if it captures all the relevant information from history. It might have started from initial state and gone through 100 transitions, but one does not need to remember the 100 intermediate states in order to know the system. The current state must somehow capture all of the relevant information. For example, if I say my age is 30 years (state), it fully captures what my age was in each of the last 30 years (state in each year in history). More formally, 

$$
  \mathbb{P}[S_{t+1} \mid S_t] = \mathbb{P}[S_{t+1} \mid S_1, \cdots, S_t]
$$

We also talk about state transitions. More often these are probabilistic transitions. If I am a 30 year old engineer (my current state), there is a relatively high probability I can start afresh and learn machine learning from YouTube and become a machine learning engineer (new state) but there is a very low probability that I can start afresh and become as gymnast (new state). Given a current state *s*, there is a probabilistic transition relation to next state *s'*. More formally,

$$
\mathcal{P}_{ss'} = \mathbb{P}[S_{t+1} = s' \mid S_t = s]
$$

A *reward* is a function on states. That is, given a state *s* it tells you the expected reward one could accumulate going forward, starting from *s*. It is the expectation of the rewards you might get at each state going into the future, starting from state *s*. More formally,

$$
\mathcal{R}_s = \mathbb{E}[R_{t+1} \mid S_t = s]
$$

If I am a young graduate student, I might be more focussed on long-term rewards (higher pay later on) at the cost of sacrificing short-term rewards (early employment). If I were a trader in a hedge fund, I might be more focussed on short-term bets (short selling) rather than long-term growth companies. It is fair to say that the reward in each of the above cases has a different rate of growth. One could be myopic and be interested in short-term rewards or one could be long-sighted and wait for long-term rewards. In order to accomodate this, we introduce a discount factor $\gamma \in [0, 1]$, which when close to $0$ indicates interest in short-term rewards and when close to $1$ indicates long-sightedness. The expected total reward, also called *return* in RL literature is the total discounted reward from a given point in time. More formally,

$$
G_t = R_{t+1} + \gamma R_{t+1} + \cdots = \sum_{i=0}^{\infty} \gamma^{i} R_{t+i+1}
$$

How does one evaluate a state *s*. One needs a metric to compare states to say one state is better than the other. The *state value function v(s)* gives the long-term value of a state *s*. Note that it is *long-term* value, i.e. the value of the state *s* into the future, if we start from state *s*. More formally, 

$$
v(s) = \mathbb{E}[G_t \mid S_t = s]
$$

It is the expectation of the returns starting from state *s*. Since the returns themselves are discounted rewards,

$$
v(s) = \mathbb{E}[R_{t+1} + \gamma v(S_{t+1}) \mid S_t = s]
$$

Since are trying to program systems that have agency, the agent can take actions in order to optimize its reward. We also introduce a set of actions and this introduction makes the reward not only a function of a state *s* but also on the action *a* that we take while in state *s*. I could take an action $a_1$ to spend 300 on a Nintendo console or I can take an alternative action $a_2$ of investing 300 in TSLA. These two actions would yield, most likely, very different rewards, starting at the same state (of having 300 to spend). We can rewrite our transition probabilities and rewards by incorporating action.

$$
\mathcal{P}_{ss'}^{a} = \mathbb{P}[S_{t+1} = s' \mid S_t = s, A_t = a]
$$

and 

$$
\mathcal{R}_{s}^{a} = \mathbb{E}[R_{t+1} \mid S_t = s, A_t = a]
$$

That was too much of formalism for a post. We will look at more terminologies and formalisms before we dive into some examples to concretize our understanding.