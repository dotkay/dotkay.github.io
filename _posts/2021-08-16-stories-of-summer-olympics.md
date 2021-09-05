---
layout: post
title: The Stories of Summer Olympics
categories: [Olympics, medals, data science]
keywords: [Olympics, medals, data science, pandas, plotly]
external-url: https://dotkay.github.io/2021/08/16/stories-of-summer-olympics
---

This is about the stories of Summer Olympics - not just one story but many stories and not just the recently concluded Tokyo Olympics, but all of the Olympic games since the first one in Athens in 1896. Although the analysis of the medals won by different countries would make the story read like a story medals and achievements statistics, there are other stories hidden within. We will narrate many of those as we do the analysis.

We will use `pandas` library to do the data analysis and plotly to create our plots that would tell a visual story.

```python
import pandas as pd
import plotly.express as px
```

When we look at the hosts we see many western powers with Brazil and China (then emerging economies) hosting in 2008 and 2016 respectively. Of course, hosting an Olympics is no small thing - the infrastructure, safety, accessibility, etc. play a huge role and many of these cost money. London seems to be the only city that has hosted Olympics thrice. 

```python

total_medals_by_host_city = summer_df.groupby(['City', 'Year'], as_index=False)['Medal'].count()
fig = px.bar(total_medals_by_host_city, x='City', y='Medal',
            hover_data = ['Medal', 'Year'], 
            color='Medal', 
            title='Medals Awarded at Each Venue')
fig.add_annotation(x='London', y=1690,
        text="London has hosted Olympics thrice...",
        ...
        ...
        opacity=1.0
)

```
The number of events in each of the Olympics also seems to be different, as evidenced by the total number of medals awarded during the games. With Paris and London regularly competing for the best European City regularly I believe it is high time Paris got a chance to host the Summer Olympic games, and very glad 2024 Olympics are going to be held in Paris. I also hope more and more emerging economies to be able to host the games. The motivation and interest in sports such events would infuse is invaluable.

<iframe id="igraph" scrolling="no" style="border:none;" seamless="seamless" src="https://plotly.com/~kkplot/17.embed" height="525" width="100%">
</iframe>

When we look at the cumulative number of medals won from the start of Summer Olympic games, USA clearly leads. But more important to note here is Russia which was more excellent in sports, science and technology, arts and culture, etc., when it was Soviet Union. Also interesting to note is the presence of an entry *Individual athletes* - athletes who chose to compete under the Olympic flag instead of any specific country. This is a political story. 

```python
total_medals_by_country = summer_df.groupby('Country', as_index=False)['Medal'].count()
fig = px.bar(total_medals_by_country, x='Country', y='Medal',
            hover_data = ['Medal'], color='Medal', 
            title='Cumulative Number of Medals Won (1896-2021)')
```

There were many instances where athletes who requested to compete independently and were refused - for example, the ones who emigrated from Communist Europe during the cold war, as well as some during the [1976 Olympic boycott](https://en.wikipedia.org/wiki/1976_Olympic_boycott). The first provisions were made by IOC (International Olympic Committee) during the 1980 Summer Olympics hosted at Moscow.

<iframe id="igraph" scrolling="no" style="border:none;" seamless="seamless" align="middle" src="https://plotly.com/~kkplot/15.embed" height="900" width="100%">
</iframe>

When we look at the countries that shine on the top of the medals table regularly the familiar pattern is clear. It is mostly European countries, USA, Australia and more recently China. Although we might have cheered Usain Bolt's sprints and track and field athletics being one of the most anticipated events of the Summer Olympic games, in terms of total number of medals, many western countries top the table year after year. This also indicates the broad variety and the number of events in the summer games. 

There is also a political story hidden here, that of the 1980 Summer Olympics. There were only two cities that bid to host the games - Los Angeles and Moscow and eventually Moscow won. If you notice the 1980 Olympics that was hosted by Moscow, Russia seems to be the clear leader in terms of number of medals. Almost always, one expects host country to win several medals, but scoring more medals than the usual competitive powers is always a big achievement. Many nations boycotted the 1980 Olympics, led by the USA to protest against the Soviet-Afghan war. It had the smallest participation - just around 80 countries.

```python
def top_n(n):
    return (
     df 
    .groupby("Country")
    .agg({"Medal Count": "sum"})
    .sort_values("Medal Count", ascending=False)
    .head(n)
    )
df = summer_df.groupby(['Year', 'Country', 'Medal']).size().reset_index()
df.columns = ['Year', 'Country', 'Medal', 'Medal Count']
fig = px.bar(df.loc[df["Country"].isin(top_n(10).index)], 
             x='Year', y='Medal Count',
            hover_data = ['Country', 'Medal Count', 'Medal'],
            color='Country', barmode='stack',
            color_continuous_scale=px.colors.sequential.Viridis,
            title='Medal Winners in Olympics')
```
<iframe id="igraph" scrolling="no" style="border:none;" seamless="seamless" src="https://plotly.com/~kkplot/19.embed" height="800" width="100%">
</iframe>

There are more politics stories in Olympics. The apparent gaps in the plot below makes one wonder what happened those years. The 1916 summer Olympics, to be hosted by Berlin, were cancelled due to World War I, a first cancellation in the 20 year history of Olympics during those days. The 1940 Olympics to be hosted by Tokyo were rescheduled to be hosted by Finland (due to Japan's invasion of China in 1937) and eventually cancelled due to the outbreak of World War II. Again, the 1944 Summer Olympics to be hosted by London got cancelled due to World War II. The 2020 Olympics hosted by Tokyo was rescheduled to 2021 due to the outbreak of Covid. It took tremendous courage and organization by Japan and the participating countries to put up a great show during the pandemic.

<iframe id="igraph" scrolling="no" style="border:none;" seamless="seamless" src="https://plotly.com/~kkplot/21.embed" height="700" width="100%">
</iframe>

```python
df_final = (df).fillna(0).sort_values(idcols)
                         .groupby(idcols[1:])
                         .cumsum()
                         .rename(columns={0: 'Cumulative Total Medals'})
                         .reset_index()
                         .merge(dfnoc, on='NOC')
```

Now, to finish it off, let us see how the top 25 medal winners (measured as per medals won in 2020)
have fared over the years in terms of total medals won. The rise of China as a major sporting nation is very apparent.

```python
fig = px.scatter(
    df_final.loc[df_final["Country"].isin(top_n(25).index)],
    x="Country",
    y="Cumulative Total Medals",
    log_y=True,
    size="Cumulative Total Medals",
    color_discrete_sequence=["brown","gold","silver"],
    color="Medal",
    animation_frame="Year",
    hover_name="Country",
    title="The Olympics Story",
)

```
<iframe id="igraph" scrolling="no" style="border:none;" seamless="seamless" src="https://plotly.com/~kkplot/24.embed" height="800" width="100%">
</iframe>

<br>
<br>

While this short post tells several stories behind the Summer Olympics, I would like to write a future post on the stories behind Paralympics which will would be stories of courge, inspiration and extraordinary commitment.

<br>

<span style="color:gray; font-size: 70%; text-align: left;">
The data used here is from a <a href="https://www.kaggle.com/amirba/olympic-sports-and-medals-18962021" target="_self">Kaggle dataset</a>. This <a href="https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results" target="_self">Kaggle dataset</a> was also used to get NOC (National Olympic Committee) codes of the different countries. Some of the numbers in the dataset does not seem to agree with tables in Wikipedia, nevertheless the differences are not huge to change the story.
</span>
