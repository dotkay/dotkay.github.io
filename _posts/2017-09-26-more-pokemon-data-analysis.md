---
layout: post
title: Playing with some more Pokemon data 
categories: [data analysis, python]
keywords: [data analysis, python]
external-url: https://dotkay.github.io/2017/09/26/more-pokemon-data-analysis
---

Let's play with some more Pokemon data. Just to recollect, we played with the same data-set way back in [this post](https://dotkay.github.io/2017/08/18/lets-play-with-some-pokemon-data-1). Today, along with the other libraries, we will also use [seaborn](https://seaborn.pydata.org/) to make fancy plots very quickly.

Let's do the initial imports as before, this time also importing `seaborn` 

{% highlight python %}
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
{% endhighlight %}

Let's grab the data-set and try to see the `Attack` and `Defense` scores of the different generations of Pokemons.

{% highlight python %}
# read the dataset
df = pd.read_csv('Pokemon.csv', index_col=0)
{% endhighlight %}

{% highlight python %}
sns.lmplot(x='Attack', y='Defense', data=df,
           fit_reg=False,
           hue='Generation')
# specify the axes limits
plt.ylim(0,250)
plt.xlim(0,200)
{% endhighlight %}

Here, we use seaborn's function for plotting the data. As it is a function for regression, it would also draw a line showing the boundary. We set `fit_reg` to `False` in order to avoid it drawing the regression fit (line of best fit). This is the outcome of the above exercise:

<br>
![Attack and Defense Scores of Generations of Pokemons](/assets/images/data_science/attack_defense_pokemons.png){:class="img=responsive"}