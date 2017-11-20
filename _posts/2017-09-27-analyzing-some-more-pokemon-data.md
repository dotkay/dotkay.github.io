---
layout: post
title: Analyzing some more Pokemon data 
categories: [data analysis, python]
keywords: [data analysis, python]
external-url: https://dotkay.github.io/2017/09/27/analyzing-some-more-pokemon-data
---

Let's continue with our data from [previous post](https://dotkay.github.io/2017/09/26/more-pokemon-data-analysis) and try to look at one more fancy function from the [seaborn](https://seaborn.pydata.org/) library. In particular, we will use seaborn's `swarmplot` function to see how the Attack scores of Type-1 Pokemons of each Type-1 class are spread out. `pokemon_colors` is just an array of colours for different pokemon classes. 

{% highlight python %}
sns.swarmplot(x='Type 1', y='Attack', data=df,
              palette=pokemon_colors)
{% endhighlight %}

And here's the result:

<br>
![Attack and Defense Scores of Generations of Pokemons](/assets/images/data_science/type1_pokemon_attack_scores.png){:class="img=responsive"}