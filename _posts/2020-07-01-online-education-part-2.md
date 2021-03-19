---
layout: post
title: Technologies in Online Education
categories: [online, education, technology]
keywords: [online, education, technology]
external-url: https://dotkay.github.io/2020/07/01/online-education-part-2
---

In a [previous post](https://dotkay.github.io/2020/05/25/online-education-part-1) we saw the challenges in accessing quality education digitally. In this post, we will look at some of the disparate pieces of technology that could work together to make online education less expensive, more efficient and hopefully more accessible.

From a 45000 ft. view, online education is just about a video playing in a TV or a computer browser, much like any TV program or YouTube or Vimeo video would. But there is a lot more to it as you go down into the details. Even in its simplest form (i.e. no authentication, account validation, etc.,) most of them contain video and audio streams, which itself is the first bottleneck for places which have poor internet bandwidths, if at all internet exists. 

So, the very first technical problem is to address bandwidth the way several streaming services address them - by encoding them in different qualities and formats, cache them in CDNs or edge networks efficiently, predict their access patterns and serve them efficiently. This alone may not be enough - for most of the world the only access to internet may be through a not-so-good mobile data network which might still be prohibitively expensive to stream high quality videos. 

This brings us to the second problem: video quality. Since most educational videos, unlike action movie frames, are to a large extent relatively slow moving and not lots of dynamic pixel changes, AI techniques used for _Super Resolution_ can be employed to create a higher resolution content on device even if the incoming videos from the nearest edge network are low resolution ones. But what about the device - does it need to be one with an expensive GPU attached to it? Not really.

That brings us to the third problem: device specifications. The most desired characteristic of the device would be longer battery life and quick recharge capability. Since most education content (the content itself) is generated before the class (the event) and the content is just delivered live, modest processing power should be enough to do the inference side of super resolution. Chromebooks and android devices are a first step in this direction, but a main area of improvement would also be how long the device lasts.

Most students are visual learners but most educational content is dry. One could use components of game development engines to develop tools for teachers so that they can create interesting animations and content for their class without having to learn and program using game engines. We have been living with Powerpoint for content creation for more than three decades and may be it is time to add more interesting content creation capabilities to Powerpoint or move to an application that provides such capabilities.

> Most digital content is created in English, Mandarin and Spanish while there are many other languages and many research suggest that one's first language is the best medium for early education. 

While translating languages from one to another automatically is not effective as of today, future AI technologies would hopefully be able to bridge this gap as well.

> Students with special needs would require more help both from technology and human beings in order to enjoy and benefit from online education. If technology can leave more time for teachers they could invest that gained time on students with special needs.

There are several other problems where technology could play a role. One could create authentication mechanisms for examinations and awarding certificate of completion of courses. Zoom like video conferencing technologies could be used both for delivering the content as well as break rooms for further guidance. Automated algorithms could test basics of the students' knowledge of a topic and have progressively challenging exercises, rather than a one-size-fits-all teaching and evaluation model that is currently in place. A content created by one teacher or school can be securely shared with another school, optimizing the time and effort put in for content creation. The content itself could be stored in cloud storage and personalization algorithms could recommend what other YouTube or other content would be helpful in understanding the concepts in a specific topic, instead of the students straying all over the web looking for explanations to fortify their understanding.

There are lots of ways things could improve. But in reality, most such softwares are fragmented. One might use a chromebook while the slides sent out by the teacher would be in powerpoint format, one video would be on YouTube, one would be lying as an mpeg file in a shared folder. One would use zoom and the other Webex or Teams and there is no way these applications are play well together. Further, the current techniques for first party and third party integrations of content creation and marketing might bump up content rich in marketing dollars while relatively punishing content rich in content. Nevertheless, technology would play a huge role not only in school education but also enterprise reskilling (education technology would be an enterprise product as well) and the one who wins would be the one who builds the strongest platform combining the disparate technologies listed above, and some more.