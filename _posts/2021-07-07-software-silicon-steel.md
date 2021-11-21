---
layout: post
title: More Software and Silicon than Steel 
categories: [automotive, semiconductors, software, IoT]
keywords: [automotive, semiconductors, software, IoT]
external-url: https://dotkay.github.io/2021/07/07/software-silicon-steel
---

Automakers are in the news lately, not for the the usual reasons like launching fully electric models of their vehicles, or factory closures or emission scandals. They are in the news because of semiconductor shortage, throwing many into a state of shock. For people following the auto industry this is only as common as [Apple, Qualcomm or AMD's woes](https://www.techradar.com/news/chip-maker-for-apple-qualcomm-amd-warns-chip-shortage-to-last-through-2022). 

__The rise of the ECUs__
For more than a decade now, there has been more and more software and silicon that go into automobiles than steel. A typical automobile has about a couple of hundred Electronic Control Units (ECUs) which are microcontrollers each receiving inputs from different (like tire pressure, oil, seat belt, engine temperature, etc.) and producing outputs that translate to action (like a dashboard indicator light on low tire pressure, etc.). Since the cost of sensors have been going down rapidly, more and more of them are added in today's vehicles and hence more ECUs to process them. The software that goes along is also tightly coupled with the hardware and these ECUs are bought from different OEMs. Much like a computer architecture, most of the automakers connect these ECUs through a common bus usually over a Controller Area Network [(CAN)](https://www.engineersgarage.com/can-protocol-understanding-the-controller-area-network-protocol/). The number of ECUs have only been increasing with the number of features. Rain sensors, daylight sensors, blind-spot sensors, parking sensors are all commonplace in today's vehicles.

<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/tmp/main/misc/auto_ecus.png"></center>
</div>
<span style="color:gray; font-size: 60%;">
Source: How Computer Science Helps Car Technology - Bruce Yellin
</span>

__From ECUs to DCUs__
ECUs constitute a *decentralized* architecture - each ECU controls a particular function. With the increasing number of ECUs controlling critical functions like ADAS (Advanced Driver Assist Systems), autonomous driving, radars, etc., the industry has been moving to an architecture called DCU (Domain Control Unit) wherein instead of hundreds of ECUs a few DCUs would control multiple functions. This has been enabled by advances in semiconductors (performance and power) over the years and the decreasing cost of sensors. In a sense, DCUs constitute a *centralized* architecture. Much like how a PC Operating System can make way for high priority tasks, the software enabling the DCUs could prioritize critical functions. Further, this also enables flexibility and extensibility. The hardware (sensors and processing power) would remain in the vehicle and new software when installed would provide a new feature, much like how you have a CPU and memory (hardware) in your laptop and you can install Microsoft Office (software) if and when needed. From CAN, the automobiles are trying to move on to ethernet based architecture for many of the functionalities because of the faster transmission speed and more data per frame. CAN provides predictable and collision-free network access between nodes.

__Into the Future__
With advanced sensors (like cameras and lidar) providing streaming, high resolution data, the processing power of the hardware needs to be beefed up in order to process them in real-time. This has enabled the makers of high performance processors to enter the market to compete with the many ECU vendors. NVIDIA and Intel are two of the major processor makers that are making their presence felt in the automotive space, besides Qualcomm and others. With hardware being the muscle, more and more value would be added by innovation in software (the mind). For example, a camera might just send frames of a snowy scene which software could then process, along with some real-time data it receives from neibouring vehicles or cellular phone towers, etc. and create an actionable insight for the actuators. Software can use the historical data from the vehicle for diagnosis and more importantly prognosis of faults. With the decreasing cost of sensors the data collected will explode in volume over time and the automotive software stack might also include a cloud component to store data for continuous processing. 

> As the importance of electronics and software has grown, so has complexity. Take the exploding number of software lines of code (SLOC) contained in modern cars as an example. In 2010, some vehicles had about ten million SLOC; by 2016, this expanded by a factor of 15, to roughly 150 million lines. Snowballing complexity is causing significant software-related quality issues, as evidenced by millions of recent vehicle recalls - [McKinsey & Co.](https://www.mckinsey.com/industries/automotive-and-assembly/our-insights/rethinking-car-software-and-electronics-architecture)

With most vehicles made of steel and aluminium the value differentiator was brought about by the (electronic) features over the past decade. The next decade would usher in a new era of value differentiation enabled by software innovations. Who would own the hardware and operating system (much like Windows and Intel or Android and ARM in PC and mobile generation) of the era of automobile innovation is yet to be seen.

> We really designed the Model S to be a very sophisticated computer on wheels 
-- Elon Musk, 2015
