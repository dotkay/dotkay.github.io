---
layout: post
title: Languages, Culture and Communication
categories: [NLP, Languages, Hugging Face]
keywords: [Languages, Communication, NLP, Hugging Face]
external-url: https://dotkay.github.io/2022/02/22/languages-culture-communication
---

Languages have always played a very important role in society and in our cultural evolutions. It has been the vehicle that allowed human beings to collaborate, coexist and achieve great things as well as to deceive, conspire and destroy. Languages have also evolved over time carrying with them many cultural norms, shades of history while also losing some. The same language might sound differently across an ocean or even across geographic land boundaries. Some languages like Sanskrit, though less ambiguous and more efficient, are struggling to survive while others like English are flourishing despite being more ambiguous. In the age of AI based natural language processing (NLP) is it possible to encode some of these norms and cultural connotations in order to make automated translations more close to native spoken languages?

NLP systems are a commonplace today, mostly in the form of personal assistants like Alexa and chatbots like a customer service system. While they are able to understand and respond to usual queries or translate text to a surprising level of accuracy, they are far from matching human levels of communication. My claim is that NLP research is yet to discover the means to encode the several cultural connotations that come with languages, especially while translating from one to another. While NLP algorithms like LSTM and [Transformers](https://en.wikipedia.org/wiki/Transformer_(machine_learning_model)) implicitly encode some of the context needed for better understanding of a statement, a pair of languages might be too different to capture all the context implicitly. Is capturing all of the context necessary? May not be. However, capturing important nuances might be.


I have been playing around with the [Hugging Face](https://huggingface.co/) API for quite sometime and really enjoying the easeness of use - ability to work with different popular transformer models for different types of NLP tasks. And of course, the ability to use several different famous models makes the result almost unbelievable. The `pipeline()` - fundamental component in the *Transformers* library serves as a pipeline between the different steps in an NLP pipeline. For example, we may want to connect a preprocessing step to an analysis step and then to a post-processing step. I believe the ease of use and the availability of several models makes Hugging Face the go-to tool for NLP.

```py
from transformers import pipeline
```

When instantiating, the `pipeline()` expects the user to provide the NLP task we are interested in performing as well as an optional model (when not provided, a default model is used).

We can create, for example, a sentiment analyzer by providing `sentiment-analysis` as the task. If we do not specify a model to be used, it defaults to Distilbert model.
```py
sanalyzer = pipeline('sentiment-analysis')
```

We can pass strings that we want to analyze the sentiment for.
```py
sanalyzer("I plan to learn")
```
and it returns the sentiment and a score of the sentiment.
```
> [{'label': 'POSITIVE', 'score': 0.9988747239112854}]
```

So "learn" seems to be a positive thing to do. Let's keep going with this:
```py
sanalyzer("I plan to learn Spanish")
> [{'label': 'POSITIVE', 'score': 0.9941837191581726}]
```

So, learning Spanish also seems to be a positive thing to do. However, 

```py
sanalyzer("I plan to learn some more Spanish.")
> [{'label': 'NEGATIVE', 'score': 0.9369450807571411}]
```

I am not sure why, but learning some more seems to have a negative connotation (may be "some more" indicates some lacking that one is trying to improve upon?). However, if I add an additional phrase the overall sentiment seems to become positive.

```py
sanalyzer("I plan to learn some more Spanish. I want to be able to live and work in Spain.")
> [{'label': 'POSITIVE', 'score': 0.9970537424087524}]
```

These are just some of the challenges with current NLP systems. The result could be interpreted in several ways and if the training (of which a model is a result of) was done on specific set of (data from a specific culture or a communication pattern), some phrases might get inferred as `NEGATIVE` though it would not seem negative to the user of such systems. Another example showing a subtle difference:

```py
sanalyzer("I plan to learn enough Corporate Finance in order to get a great job")
> [{'label': 'NEGATIVE', 'score': 0.5767139792442322}]
```

returns a `NEGATIVE` sentiment while 
```py
sanalyzer("I plan to learn Corporate Finance in order to get a great job")
> [{'label': 'POSITIVE', 'score': 0.902138888835907}]
```
returns a `POSITIVE` one:

More intriguing are the expressions that we use depending on cultures and traditions. In many languages, we use different pronouns and verb conjugations depending on if we are talking to elders using a formal language or talking to friends or children (informal language) - like *vous* vs *tu* in French, *aap* vs *tum* in Hindi, *avar* vs *avan* in Tamil, *iyaal* vs *ival* in Malayalam, etc. Humans have learnt to make that judgement call even when we talk over the phone - we choose formal or informal language depending on how much respect or importance we attach to the person we are talking to, even if it is a stranger and we are speaking to them for the first time. However, NLP systems do not have that context explicitly encoded and it is difficult to implicitly encode them as some languages do not have such differences and while translating from such languages, one would have to possibly over-correct.

```py
en_fr_translator = pipeline("translation_en_to_fr")
en_fr_translator("Would you like some coffee?")
> [{'translation_text': 'Avez-vous envie de prendre du café ?'}]
```

As we see, we could offer coffee to a close friend (informal language) or we could be a barista offering coffee to a stranger or a customer (using formal language). These are very difficult to encode implicitly. Even when there are some clues in the statement, like the following sentence which talks about *balloons* which most likely only children would be interested in, most systems would prefer a formal language in order to be absolutely correct.

```py
en_fr_translator("Do you want a balloon?")
> [{'translation_text': 'Voulez-vous un ballon?'}]
```

There are also everyday language (colloquial) that differs from a more grammatically correct business or literary language. At times, the differences between the two is so large that chatbots may sound weird. Let us contrast English-French translation with French-English translation to check this.

```py
en_fr_translator("There's no one here.")
> [{'translation_text': "Il n'y a personne ici."}]
```

In spoken French, [one usually leaves out the negation (*ne*) in certain cases](https://qr.ae/pvKYf3) and so "*Il y a personne ici.*" would also actually mean "*There's no one here.*"

```py
fr_en_translator("Il y a personne ici.")
> [{'translation_text': "There's no one here."}]
```

Another example, which might sound very counter-intuitive for people new to the French language.

```py
en_fr_translator("I have")
> [{'translation_text': "J'ai"}]
en_fr_translator("more bread.")
> [{'translation_text': 'plus de pain.'}]
```

Such statements are not always compositional. 

```py
fr_en_translator("J'ai plus de pain.")
> [{'translation_text': "I don't have any more bread."}]
```

Many NLP systems are trained on formal and informal phrases and hence would be great translators, they may not always be a great teacher. The fluidity of languages makes languages evolve, creating new words, phrases, letting go some rules of grammar and these are exactly what make languages beatiful and a treasure trove for linguists. These are also the same challenges that make NLP a fascinating subject for Computer Scientists. I am eagerly looking forward to understanding the research in this area hoping that there would be some architecture that would enable us encode some of these connotations implicitly, making NLP systems crawl a little closer towards human-like spoken languages.

