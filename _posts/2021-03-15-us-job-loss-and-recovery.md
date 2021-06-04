---
layout: post
title: U.S. - Job Losses and Recovery
categories: [US, labor market, economy, pandemic]
keywords: [US, Jobs, Sectors, Pandemic, 2008]
external-url: https://dotkay.github.io/2021/03/15/us-job-loss-and-recovery
---

In a [previous post](https://dotkay.github.io/2021/02/21/us-unemployment), we saw how many jobs the different states in the U.S. have lost over the years primarily due to trade deficits. In this post, we will visually analyze the [data from BLS](https://www.bls.gov/charts/employment-situation/employment-levels-by-industry.htm) and compare the effects of 2008 recession and the ongoing pandemic on the state of employment in the U.S. across different sectors.

The covid-19 pandemic has definitely wrecked the employment across several sectors of the labor economy and not just the hospitality sector. If we look at the employment numbers for an year starting from January 2020, job losses are evident. We also see the quick recovery (though not to January-2020 levels) in several of the sectors.

```python
job_cols = ['Manufacturing Jobs', 'Hospitality Jobs', 'Wholesale Jobs',
       'Retail Jobs', 'Transportation Jobs', 'Construction Jobs',
       'Education Health Services Jobs', 'Finance Jobs', 'Information Jobs',
       'Mining Jobs', 'Other Services Jobs', 'Professional Services Jobs',
       'Utilities Jobs']
fig = px.area(pandemic_df, x="Month", y=job_cols, 
              template='simple_white')
fig.add_annotation(...)
...
fig.show()
```

<iframe id="igraph" scrolling="yes" style="border:none;" seamless="seamless" src="https://plotly.com/~kkplot/10.embed" height="700" width="980">
</iframe>

If we zoom out in the data set and look at two decades of employment numbers all the way from January 2001 until January 2021, we also see the effect of 2008 recession on employment numbers. We also see how gradual and prolonged the effect of 2008 recession was. The job losses across sectors during the pandemic was sudden and steep and the recovery of numbers was also quick.

```python
fig = px.area(emp_df, x="Month", y=job_cols, 
                   template='simple_white')
fig.add_annotation(...)
...
fig.show()
```

<iframe id="igraph" scrolling="yes" style="border:none;" seamless="seamless" src="https://plotly.com/~kkplot/12.embed" height="700" width="980">
</iframe>

We can just hope that the recovery from the pandemic continues quicker and reaches early 2020 levels, not only in the U.S. but across the globe. Given that the world is very globalized today than ever before, anyone is healthy and good only when everyone is healthy and good.

<span style="font-size: 70%">
<i>The tabular BLS data was parsed using BeautifulSoup, and the plots were done using plotly and chart_studio.</i>
</span>