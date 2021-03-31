---
layout: post
title: Pick the right courier ...
categories: [algorithms, C++, greedy]
keywords: C++, algorithms, greedy, job sequencing
external-url: https://dotkay.github.io/2018/10/10/job-sequencing
---

Suppose you are a messenger boy making money by transporting packages from one office to another. Some packages like food need to be transported by a specific time (say lunch time) and certain others can get delayed but still have to be transported before the end of the day (by the time the other office closes). For each such job, you get paid a little. For certain packages, like cheques or gifts, you get paid a little more. So, you want to choose the jobs in such a way that you maximize your profit. You can't refuse a job for reasons other than having another job to do at the same time. You want to write an algorithm to help you choose the right set of jobs.

As you are already greedy (or familiar with _greedy algorithms_), you can write one to solve this problem as well. This is just a variant of _interval scheduling_ that we saw in our [previous post](https://dotkay.github.io/2018/10/01/event-scheduling). This case is commonly known as _weighted interval scheduling_ as each interval (job) has a weight or value associated with it (profit) that we are trying to optimize for. In our case, our objective is to maximize the profit from doing jobs. And we want to identify the local decision rule that would also construct a globally optimal solution. 

Assume we have jobs that are defined by the following:

{% highlight cpp %}
struct Job
{
  int id;
  int deadline;
  int profit;
};
{% endhighlight %}

Since we want to maximize our profit, we first sort the jobs in decreasing order of profits. Now your acceptable set of jobs could be as large as the set of jobs available (what if all the jobs provide the same profit - you may want to do all of them to maximize your profit). So, you have a set that is as large as the initial set of jobs. 

{% highlight cpp %}
// container for our final jobs (initialized to -1)
// so that we would know if we filled in the slot already
std::vector<int> sch_slot(n, -1);
std::sort(jobs.begin(), jobs.end(),
          [] (Job const& j1, Job const& j2) {return j1.profit >= j2.profit; });
{% endhighlight %}


Next, we try to delay the job as much as it is allowed by the deadline. If lunch delivery can wait until noon, you don't want to take up that job and deliver it at 9 while sacrificing some other profit opportunity available at 9. So, we go through the list of jobs (ordered according to profits) that are not scheduled and schedule it while delaying the schedule as much as the job deadline allows. So, if lunch delivery can wait until noon, we would schedule lunch delivery the last slot before noon (say 11-12). 

{% highlight cpp %}
  for (int i = 0; i < n; i++)
  {
    // delay the job as much as possible
    for (int j = jobs[i].deadline - 1; j >= 0; j--)
    {
      if (j < n && sch_slot[j] == -1)
      {
        sch_slot[j] = jobs[i].id;
        break;
      }
    }
  }
{% endhighlight %}





