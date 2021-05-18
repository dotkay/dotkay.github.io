---
layout: post
title: Cost-efficient Water Connections
categories: [algorithms, C++, greedy, Kruskal, Minimum Spanning Tree]
keywords: C++, algorithms, greedy, Kruskal, minimum spanning tree
external-url: https://dotkay.github.io/2018/11/11/water-connection
---


Suppose you are the tech-savvy engineer recruited by Public Works Department in your rural county. The rural county has wonderful flora, fauna and a few environmentalists and ecologists have been recruited to take care of the environment. There are a few houses built to host these people. Since the settlement is very new, the county has asked you to design a efficient water connection map to bring water to these settlements from a water source at one corner of the area. There are known paths where these water pipelines could be laid in a way that will have minimal effect on the environment. And you have been entrusted with using some of these paths in such a way as to minimise the cost and at the same time make sure every house gets a water connection.

<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/tmp/main/algo_illustrations/kruskal_mst_1.PNG"></center>
</div>
<br>

You sit down and think that the map is nothing but an implicit graph, the cost of laying the pipelines being the weights on the graph's edges. The vertices are the houses. You have one special vertex which is the community's source of water. Your plan is to find the path from the source of water to every house in the community. Further, there might be several such paths and you would have to choose the one that has the lowest cost. You recall algorithms for minimum spanning trees that you had learned in your algorithms lessons a decade ago and decide to give it a go.

Algorithmically, you have a set of edges with weights, a set of vertices and a special start vertex. Suppose each edge is defined by a source vertex `src`, a destination vertex `dest` and the associated cost of laying the pipe between these vertices `cost` - represented by the following structure:

{% highlight cpp %}
struct Edge
{
  int src;
  int dest;
  int cost;
};
{% endhighlight %}

And our graph is defined by the total set of vertices `V` (one source of water + the nodes representing houses) and a vector of Edges `EdgeList` each element is an Edge as defined above.

{% highlight cpp %}
Graph(int V, std::vector<Edge> edges)
{% endhighlight %}

Assume that we also have a UnionFind data structure for us to use. Since we have to minimize the cost of construction, we try a greedy approach by picking the least expensive pipelines first - i.e., we sort `edges` in increasing order of `cost`.

{% highlight cpp %}
std::sort(EdgeList.begin(), EdgeList.end(), 
          [](Edge e1, Edge e2) { return e1.cost < e2.cost; });
{% endhighlight %}

Once we pick the least cost edge, the next least cost edge may not be a neighbour of the current edge (i.e. having a common `src` or `dest` vertex). In order to prevent cycles, we maintain a UnionFind data structure and keep adding the (minimum cost) edges we choose. As we collect the minimum cost edges, we can compute the cost using an accumulator.

{% highlight cpp %}
int Graph::kruskal_mst()
{
  int V = size;
  UnionFind uf(V);
  std::sort(EdgeList.begin(), EdgeList.end(), 
            [](Edge e1, Edge e2) { return e1.cost < e2.cost; });
  int mst_cost = 0;
  int n = EdgeList.size();
  for (int i = 0; i < n; i++)
  {
    Edge e = EdgeList[i]; // min cost edge
    if (!uf.isSameSet(e.src, e.dest))
    {
      mst_cost += e.cost;
      uf.formUnion(e.src, e.dest);
    }
  }
  return mst_cost;
}
{% endhighlight %}

Finally, we will end up with the following minimum cost spanning tree, with pipelines laid with a total cost of `$990000`.

<br>
<div class="img_container">
<center><img src="https://raw.githubusercontent.com/dotkay/tmp/main/algo_illustrations/kruskal_mst_2.PNG"></center>
</div>
<br>
