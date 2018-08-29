---
layout: post
title: Computing the closest pair of points - Naïve approach
categories: [algorithms, C++]
keywords:
external-url: https://dotkay.github.io/2017/10/04/closest-pair-naive
---

Given a set of points (say provided to us as _(x, y)_ coordinates) on a plane, let us find the closest pair among the set. The straight forward approach would be to compute the distance of each point with every other point in the given set and store the minimum distance. 

{% highlight cpp %}
#define REP(i, n) for (int i=0; i<n; i++)
#define REPK(i, k, n) for (int i=k; i<n; i++)

class Point {
  public: 
    int x;
    int y;
  public:
    Point () {};
    Point (int x, int y);
    static float dist(Point p, Point q);
};

float min_distance (Point p[], int n) {
  float min = MAX_DIST;
  REP(i, n)
    REPK(j, i+1, n)
      if (dist(p[i], p[j]) < min) 
        min = dist(p[i], p[j]);
  return min;
  // Time Complexity: O(n^2) - nested for loops (2)
}

{% endhighlight %}

As you can see this is a _O(n^2)_ algorithm. Can we do better than this? It turns out we can - a topic for a future post.
