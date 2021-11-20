---
layout: post
title: Improving a Policy Using Value Iteration
categories: [technology, ai, openai gym, reinforcement learning]
keywords: [technology, ai, openai gym, reinforcement learning]
external-url: https://dotkay.github.io/2019/07/17/openai-gym-value-iter
---

In a [previous post](https://dotkay.github.io/2019/06/17/openai-gym-policy-iter) we saw how to [evaluate a policy](https://dotkay.github.io/2019/06/04/openai-gym-policy-eval) and iteratively improve it. The value iteration algorithm in an alternative formalism to iteratively improve a policy. In policy iteration, we started with a random policy, evaluated the state value function, took a greedy step and iteratively updated the state value function. Here, we will start with a initial state value function and iteratively update it. 

1. We will start with an initial value function:
  ```python
  v = np.zeros(env.observation_space.n)
  ```

2. We use `one_step_lookahead()` from our [previous example](https://dotkay.github.io/2019/06/17/openai-gym-policy-iter) to compute the action values. 
  ```python
  action_values_vec = one_step_lookahead(env, s, v)
  best_val = np.max(action_values_vec)
  ```

3. We will pick the action that has maximum value and update our value function. Essentially, in each iteration $k+1$, we update our value function using the value of the value function in iteration $k$, by picking the action that would fetch us the maximum value. 
  $$
  v_{k+1}(s) = \max_{a} \mathbb{E}[R_{t+1} + \gamma . v_k(S_{t+1}) \mid S_t = s, A_t = a]
  $$

4. Compute the values and update until convergence.
  ```python
  action_vec = one_step_lookahead(env, s, v)
  best_a = np.argmax(action_vec)
  ```

5. Update the policy by picking the best action.

Putting it together:

```python
def value_iter(env, gamma=0.9, th=1e-9, max_iter=10000):
    # (1) initialize the value function for each state
    v = np.zeros(env.observation_space.n)
    # iterate until converges w.r.t th
    for i in range(int(max_iter)):
        # initialize change in value to 0
        delta = 0
        # for each state in environment 
        for s in range(env.observation_space.n):
            # (2) look one step ahead and compute action-value function
            action_values_vec = one_step_lookahead(env, s, v)
            # (3) select the best action value from 
            # action values from one-step lookahead
            best_val = np.max(action_values_vec)
            # calculate the change in value
            delta = max(delta, np.abs(v[s] - best_val))
            # update the value function v
            v[s] = best_val
        # check stopping condition
        if delta < th:
            print(f'\nvalue iteration converged in {i} iterations')
            break
    # create a policy 
    policy = np.zeros([env.observation_space.n, env.action_space.n])
    for s in range(env.observation_space.n):
        # look one step ahead and compute action-value function
        action_vec = one_step_lookahead(env, s, v)
        # (4) select the best action from actions from one-step lookahead
        best_a = np.argmax(action_vec)
        # update policy
        policy[s][best_a] = 1.0
    return policy, v
```


Policy iteration works in two phases in each iteration: 1. we evaluate the policy, 2. we improve the policy (and make updates). The value iteration combines these two phases into one. We do not explicitly evaluate a policy. Instead, we just sweep through all possible actions and find the action that leads to the best action value. Both approaches implicitly update state value function and action value function in each iteration.