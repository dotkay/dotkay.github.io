---
layout: post
title: Greedy algorithms vs Tik-Tok teenagers
categories: [algorithms, C++, greedy]
keywords: C++, algorithms, greedy, event scheduling
external-url: https://dotkay.github.io/2018/10/01/event-scheduling
---

Suppose you are a famous celebrity getting several requests for interviews and appearances at events, of course with enough media presence, and you want to choose a few of the events so that you do not overcommit and keep your calendar relatively organized. You are relatively old fashioned and are having to compete against Tik-Tok teenagers for media clicks and so you want to accept as many invitations as possible so that it gives you maximum media coverage. The different events might be covered by different media outlets and so the more events you attend you get covered by more media outlets.

> The point is, ladies and gentleman, that greed, for lack of a better word, is good. Greed is right, greed works. Greed clarifies, cuts through, and captures the essence of the evolutionary spirit. Greed, in all of its forms; greed for life, for money, for love, knowledge has marked the upward surge of mankind. <br> -- Wall Street (1987)

A _greedy_ algorithm is one that creates a solution by making a local decision at each step with only local knowledge to optimize for some objective. In our case, our objective is to maximize the profit from doing jobs. And we want to identify the local decision rule that would also construct a globally optimal solution.

In our case, we want to accept as large a set of compatible invitations (invitations whose schedules do not conflict with one another) as possible. Your assistant provides you with the list of invitations and their schedules sufficiently in advance so that you can pick the ones that interest you. You start working out the possibilities in order to come up with the best algorithm.

The most obvious approach would be to accept the event that starts earliest, commit to it and pick other events depending on conflicts. But you see that you accepted such a thing, an event to clean a park, that consumed all of the day - just one event, and you declined four other events in order to do this.

You calendar actually looked something like this and you could have chosen the other events and had more media appearances.
<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/tmp/main/algo_illustrations/cleaning_the_park.PNG"></center>
</div>
<br>

So you think accepting events in order of their duration, preferring shortest events over longer ones, avoiding conflicts, is the right way to go. Your calendar from that boring Tuesday when you accepted a lunch invitation from a boring old actor makes you rethink the approach. Not just that you had to endure the boring actor or the lunch was not that great, you had to decline two other events, one of them a live music show and that sounds more fun now.

<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/tmp/main/algo_illustrations/boring_lunch.PNG"></center>
</div>
<br>

So, you decide not to go with prioritizing shortest events. The lunch meeting was too boring even if it was short. You decide to choose your events based on the least number of conflicts - if an event has less conflicts than others in your schedule, you want to prioritize that. That sounds promising. After your instagram post with you wearing a Bitcoin pendant went viral a couple of weeks ago, many tv channels wanted to interview you. And you committed to three of these interviews - BBC, MSNBC and CBS easily minimizing the conflicts in your calendar. Although the calendar looks confusing to choose the best set of events from, it was less confusing than the questions during those tv interviews or your answers to them.

You choose BBC because it conflicts only with TMZ and Fox (the other possible schedule) while choosing TMZ would conflict with BBC, MTV and CNBC (more conflicts). You picked the other events similarly - you choose the sequence of events in the second row - BBC, MSNBC and CBS as they seem to have minimal conflicts than the others. But now, putting the available options together, you see that you could have chosen four interviews (from first row) and had more media clicks.

<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/tmp/main/algo_illustrations/tv_interviews.PNG"></center>
</div>
<br>

_Greedy_ algorithms are not very trivial. But they have been established for certain generic problems - commonly called _interval scheduling_ that can be extended to many such real-world examples. A _greedy_ rule that would lead to optimal pick of events is actually different from any of the choices above. The optimal choice is to pick the first request that finishes first (the idea being, you want to free up yourself as early as possible to get ready for the next event). 

So, you sort the events of the day in increasing order of their finish times, pick the event that finishes first and among the rest of the events, pick the events that finish earlier and has no conflicts with already picked events.

Let us do it step by step, in a C++ program. Suppose you are given a list of events, each event described by its start and finish times.

{% highlight cpp %}
struct Event
{
  int start;
  int finish;
};
{% endhighlight %}

You first sort the given list of `n` events (`std::vector<Event> events`) according to increasing order of their finish times.

{% highlight cpp %}
std::sort(events.begin(), events.end(),
            [] (Event e1, Event e2) { return e1.finish < e2.finish; });
{% endhighlight %}

Choose the first event that finishes. Let us assume we have a vector of events `sch` to collect our optimal schedule of events.


{% highlight cpp %}
sch.push_back(events[0])
{% endhighlight %}

Now, you go through the rest of the events, check for conflicts and keep adding compatible events (events which do not conflict with the last selected event (`events[last_sel`)) to your schedule.

{% highlight cpp %}
for (int i = 1; i < n; i++)
  {
    if (events[i].start >= events[last_sel].finish)
      sch.push_back(events[i]);
  }
{% endhighlight %}

Armed with this algorithm, you can maximize the number of events you commit to, and get more media appearances.
