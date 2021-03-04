---
layout: post
title: Is it GameStop vs Hedge Funds or GameStop vs Streaming?
categories: [GameStop, markets, short selling, wall street]
keywords: [GameStop, markets, short selling, wall street]
external-url: https://dotkay.github.io/2021/01/19-gme-wall-street
---

Everyone knows GameStop now, and its ticker symbol too - gamers, non-gamers, traders, non-traders, all alike. 

GameStop is a chain of retail stores that sells game merchandise, equipment and at one point (when games were sold on CDs) games. Retail is moving online and if the product is software, it has already moved. I can't recollect the last time I saw Windows OS or Office sold in a CD. 

Hedge funds apparently make money by betting on such companies - borrow money or company shares from some lender promising to repay and in the mean time, bet on the downside of the company, wait for the price to crash, buy the stock (for cheap) and give it back to the lender (pocketing the difference). I am not sure how they pick companies to bet on. However, late last year and early January, GameStop was the candidate. In order to revolt againt this, some online enthusiasts mobilized themselves to buy options on this stock, thereby increasing the stock price ('stock price' not 'company value') that would hurt the Hedge funds' intentions.

Let us look at some data to see if Hedge funds are the real detterants to GameStop's future or if there are other factors - like streaming. It was not just GameStop (GME), but also Nokia (NOK), AMC and Blackberry (BB) that went through this early January, but GameStop had the biggest change. Just to show the trend in these stocks (GameStop removed from the plot below as the change in GME was too high that the other trends wouldn't show up well). Notice how the overall trend in stock prices have been over the last few years and how it changed towards the end of 2020 and early 2021.

```python
...
plt.plot(amc_df['Date'], amc_df['Adj Close'], label='AMC')
plt.plot(nok_df['Date'], nok_df['Adj Close'], label='NOK')
plt.plot(bb_df['Date'], bb_df['Adj Close'], label='BB')
plt.plot()
...
```

<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/data_science/master/plots/amc_nok_bb.png"></center>
</div>

In order to see what (game) streaming industry is like, I started looking for data on this - number of subscribers, streamers, etc. I found [Twitchtracker](https://twitchtracker.com/statistics) that tracks statistics on Twitch. Since Twitch's data was easiest to get and well organized, I decided to look at just Twitch data (number of concurrent viewers) and plot it alongside GameStop stock price over the years.

```python
fig, ax1 = plt.subplots()
ax2 = ax1.twinx()
line1, = ax1.plot(df2['month'], gme_df['Adj Close'], color='blue')
line2, = ax2.plot(df2['month'], df2['avg_concurrent_viewers']//1000, color='green')
...
plt.show()
```

<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/data_science/master/plots/gme_vs_twitch.png"></center>
</div>

The number of Twitch channels also keep increasing along with the number of viewers and this trend is only likely to continue during these pandemic times. 
```python
fig = px.scatter(df, x='avg_concurrent_viewers',               
                     y='avg_concurrent_channels',
                     size='time_watched')
fig.show()
```

<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/data_science/master/plots/twitch_data.png"></center>
</div>

On the other hand [many retail stores like GameStop's were hit hard](https://www.theverge.com/2020/3/20/21188799/gamestop-california-store-closures-indefinite-coronavirus) during the pandemic.

Everyone can infer the trend in the industry. Hedge funds are disliked for several reasons, some of them valid. But the future of gaming is online and if GameStop were to survive, it has to build that future than anchor itself in its glorious past.

<span style="font-size: 70%">
<i>The data from Twitchtracker was parsed using BeautifulSoup, and the plots were done using matplotlib, seaborn and plotly.</i>
</span>


