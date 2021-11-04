---
layout: post
title: OpenAI Gym - Playground for RL
categories: [technology, ai, openai gym, reinforcement learning]
keywords: [technology, ai, openai gym, reinforcement learning]
external-url: https://dotkay.github.io/2019/04/11/openai-gym
---

In some [previous post]() we saw some theory behind reinforcement learning (RL). It is better to augment the theory with some practical examples in order to absorb the concepts clearly. While one can always get into some computer games and trying to build agents, observing the environment, taking some actions (game moves), it is worthwhile to start small and get an understanding of the many terminologies involved.

[OpenAI](https://openai.com/) provides [OpenAI Gym](https://gym.openai.com/) that enables us to play with several varieties of examples to learn, experiment with and compare RL algorithms. We will see how to use one of the smallest examples in this post and map the terminologies from the theory section to the code fragments and return values of the gym toolkit.

We do the basic formalities of importing the environment, etc.

```python
import gym
from gym import wrappers
from gym import envs
```

We shall look at *ForestLake* which is a game where an agent decides the movements of a character on a grid world. `gym.make()` creates the environment, `reset()` initializes it and `render()` renders it.

```python
env = gym.make('FrozenLake-v1').env
env.render()
```

The rendered environment prints the following.
<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/tmp/main/rl_illustrations/frozenlake_gridworld.png"></center>
</div>

Some tiles in the grid are safe (marked `F` for *Frozen*), while certain others (marked `H` for *Hole*) lead to the agent falling into the lake. The tile marked `S` is supposed to be *safe* and the objective is to reach a tile marked `G` which is the agent's goal, without falling into a hole.

We will work with a small 4x4 grid so that it is easy to imagine the different states and compute actions and their results manually while we do it algorithmically. OpenAI gym offers a way to render the environment to see how the grid world looks like

We can also print the action space (the set of all possible actions) and the state space (the set of all possible states). 

```python
env.reset()
print('Action space {}'.format(env.action_space))
print('State space {}'.format(env.observation_space))
```
returns
```
Action space Discrete(4)
State space Discrete(16)
```

There are 4 possible actions - *Left*, *Down*, *Right* and *Up* and  (corresponding to numbers 0, 1, 2 and 3). There are 16 possible states as it is a 4x4 grid (the agent can be on any tile on this grid). The agent is rewarded 0 points at each tile step for finding a path to `G` without encountering a hole. When it reaches `G` the agent is rewarded 1 point.

The transition dynamics for different actions can be obtained by looking at the transition table `P`. 

```python
env.P[0]
```

prints
```
{0: [(0.3333333333333333, 0, 0.0, False),
     (0.3333333333333333, 0, 0.0, False),
     (0.3333333333333333, 4, 0.0, False)],
 1: [(0.3333333333333333, 0, 0.0, False),
     (0.3333333333333333, 4, 0.0, False),
     (0.3333333333333333, 1, 0.0, False)],
 2: [(0.3333333333333333, 4, 0.0, False),
     (0.3333333333333333, 1, 0.0, False),
     (0.3333333333333333, 0, 0.0, False)],
 3: [(0.3333333333333333, 1, 0.0, False),
     (0.3333333333333333, 0, 0.0, False),
     (0.3333333333333333, 0, 0.0, False)]}
```

`env.P[state]` ($P_s$) is a tuple of the form:

```
{action: [probability (next_state), next_state, reward, done]}
```
i.e.

$$
P_{s}^{a} = P_{s'}, s', r, done
$$

*done* indicates the completion of the episode (reaching `G`). We see that from state *0* none of the actions we take would lead us to `G` and hence *done* is `False` for all the actions. We take an action by calling `env.step(action)` which returns a tuple of the form:

```python
print(env.P[14])
```

prints
```
{0: [(0.3333333333333333, 10, 0.0, False), 
     (0.3333333333333333, 13, 0.0, False), 
     (0.3333333333333333, 14, 0.0, False)], 
 1: [(0.3333333333333333, 13, 0.0, False), 
     (0.3333333333333333, 14, 0.0, False), 
     (0.3333333333333333, 15, 1.0, True)],
 2: [(0.3333333333333333, 14, 0.0, False), 
     (0.3333333333333333, 15, 1.0, True), 
     (0.3333333333333333, 10, 0.0, False)], 
 3: [(0.3333333333333333, 15, 1.0, True), 
     (0.3333333333333333, 10, 0.0, False), 
     (0.3333333333333333, 13, 0.0, False)]}
```

We can see that some of the actions take us from state `14` to the final state `15` and hence the value `True` for *done* for such cases and the probability of $s'$ is also 1.0.
```
{new_state, reward, done, info}
```

For example,

```python
env.reset()
env.render()
new_state, r, done, info = env.step(2)
print('newstate {}'.format(new_state))
print('reward {}'.format(reward))
print('done {}'.format(done))
print()
env.render()
```
returns
<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/tmp/main/rl_illustrations/frozenlake_one_step_action.png"></center>
</div>

