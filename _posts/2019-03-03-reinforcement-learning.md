---
layout: post
title: Reinforcement Learning - Fundamentals
categories: [technology, ai, reinforcement learning]
keywords: [technology, ai, reinforcement learning]
external-url: https://dotkay.github.io/2019/03/03/reinforcement-learning
---

When we were toddlers, we did not know a lot many things. Slowly, we learnt through our own experiences or the experiences of others around us. We may not have known a gas stove is hot, a container filled to the brim is difficult to carry without spilling, etc. We might still be in the process of learning certain things. Some of these are taught in schools through repetitions and exams in order to get feedback, correct our course and *reinforce* our knowledge. 

Even in everyday activities, we continuously gather feedback and correct our actions. If we start early or start before time, we reach our destination on time. If we study well we get good grades, if we develop unhealthy habits, we have negative effects on our health, and so on. The environment gives us the feedback. The environment includes all other entities apart from us. We can, to some extent, observe the environment but we do not know the full behavior of the environment. We can read weather forecasts before making a trip, but we may not know the predicted rain will cause flash floods, for example.

There are some fundamental concepts and terminologies in *reinforcement learning* (RL) that makes mapping it to real life experiences easier. An **agent** is someone who has *agency* - makes decisions and takes actions. In real life, it refers to us - human beings (or our minds). We learn and develop RL algorithms to program an automated system with a physical embodiment (e.g. Robot) or even without it (e.g. just a software API), in which case the agent is the automated system that we are trying to build and make it better using RL. The **environment** is what the agent acts on which is everything beyond us. We do not completely know the environment. We just observe how the environment behaves and calibrate our actions. The environment in turn provides **rewards** which help us learn and calibrate. If we get drenched in rain (negative reward) we may carry an umbrella (action) the next day and try to reduce the negative reward. If we study well (action), we get good grades (positive reward) which would in turn motivate us to study better in order to increase our reward. 

<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/tmp/main/rl_illustrations/rl_intro.png"></center>
</div>

The **state** of the system is defined by the valuation of the state variables. If I am a trader in the stock market, my goal is to take actions (buy/sell stocks) in order to increase my reward (profit). My state would be the value of the money I have and a better state would be one in which the value is more (through aggregating profits through a sequence of actions). We talk about sequence of states (i.e. we take action from a state, move to another state, receive reward and take another action, and so on). Our goal is to make sure we reach a state by taking profitable **actions** where the value we obtain, going forward from that state, is maximized. 

In future posts, we will formalize many of these concepts and introduce some more.