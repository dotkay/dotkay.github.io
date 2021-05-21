---
layout: post
title: Jobs, Offshoring and Unemployment - US
categories: [US, labor market, economy]
keywords: [US, Unemployment, Covid, Manufacturing]
external-url: https://dotkay.github.io/2021/02/21/us-unemployment
---

With 2020 being one of the worst in recent history, for many reasons fuelled by the pandemic. With many countries being unprepared to handle a pandemic of this size, it also exposed the global supply chain being [highly optimized rather than flexible](https://dotkay.github.io/2020/04/01/efficiency-vs-flexibility). It also exposed the inequality in society - healthcare, job security, income, etc. Many countries had to start manufacturing personal protective equipments (PPE), ventilators, etc. by themselves to serve the local needs rather than rely on the supply chain that got stalled. A couple of decades ago, many of these equipments were manufactured locally but over time, many of those got offshored. 

However, this post is not about unemployment due to the pandemic. It is more about loss of U.S. jobs over the period 2001-2017, mostly due to trade deficits, with data from [this report](https://www.epi.org/publication/the-china-toll-deepens-growth-in-the-bilateral-trade-deficit-between-2001-and-2017-cost-3-4-million-u-s-jobs-with-losses-in-every-state-and-congressional-district/) and manufacturing data from [BLS data](https://www.bls.gov/charts/employment-situation/employment-levels-by-industry.htm).

The first decade of the century was the worst for U.S. manufacturing jobs. It saw the steepest decline in such jobs, in a very long time. There are two conflicting theories around this - one argues the loss is due to increased automation, while the other attributes the loss to offshoring of such jobs. I could not find the data on rate of automation or increase in manufacturing jobs in other geographies during the time period in order to analyze it analytically. However the loss of jobs, whatever being the root cause, is itself staggering.

```python
import plotly.express as px
fig = px.bar(emp_df[:100], x='Month', y='Manufacturing Jobs', height=600, color='Manufacturing Jobs',
            labels=dict({'Manufacturing Jobs':'Manufacturing Jobs (in thousands)'}),
            template='simple_white')
fig.update_layout(
    autosize=False,
    width=700,
    height=700
)
fig.show()
```

<iframe id="igraph" scrolling="yes" style="border:none;" seamless="seamless" src="https://plotly.com/~kkplot/6.embed" height="700" width="100%">
</iframe>

Apparently, about four decades ago the Bay Area in California was full of orange orchards, and a couple of decades later they all became startups working in electronics and software (Silicon Valley). They were not startups making apps that let teenagers poke and swipe at each other but advanced electronics and software that goes along with it, like routers, modems, semiconductor chips, etc. There were supposedly many small enterprises manufacturing circuit boards and assembling systems for these famous companies. 

An old video of Macintosh Factory in Fremont:
<br>
<div class="img_container">
<iframe width="560" height="315" src="https://www.youtube.com/embed/Dk306ZkNOuc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

But does it mean only the electronics jobs got offshored? Not really. If we look at the data deeper and look at the number of jobs lost state-wise, it gives a more detailed picture. Almost every major state in the U.S. has lost thousands of jobs from 2001-2017, with most of the loss happening between 2001-2009. Many other states would have seen loss of jobs in other industries like automobiles and steel included.

```python
fig = px.bar(df, x='State', y='Jobs Lost', height=600, color='% Jobs Lost',
             labels=dict({'Jobs Lost':'Jobs Lost (in thousands)'}))
fig.show()
```

<iframe id="igraph" scrolling="yes" style="border:none;" seamless="seamless" src="https://plotly.com/~kkplot/1.embed" height="600" width="980">
</iframe>

If we look even deeper into the data, we can see how many jobs were lost in each state's congressional districts. 

```python
fig = px.bar(df, x='Total Jobs', y='State', color='% Jobs Lost',
             labels=dict({'State':'States and Congressional Districts'}),
             hover_name='Congressional District')
fig.show()
```

<iframe id="igraph" scrolling="yes" style="border:none;" seamless="seamless" src="https://plotly.com/~kkplot/4.embed" height="870" width="100%">
</iframe>

When I find reliable data on rate of automation and manufacturing jobs gained in other geographies, analysis of that data would help in putting the pieces together. While I am not against offshoring, I am all for a more flexible supply chain, rather than a super-optimized supply chain that would get disrupted affecting the lives and livelihoods of several people, as we witnessed last year when medical devices and PPE supply chain got disrupted. 

While many jobs have been offshored causing large scale unemployment, there is still hope for reskilling of workers and creating new jobs that would drive the economy the next two decades - like solar panels, [electric batteries](https://dotkay.github.io/2020/09/13/electric-batteries), recycling of batteries, advanced technologies for water, air purification, education and healthcare, etc. 

<span style="font-size: 70%">
<i>The tabular data from EPI report was parsed using BeautifulSoup, and the plots were done using plotly and chart_studio.</i>
</span>