## How it works

Force-directed graph layout simulates forces to give motion to vertices and arrange them in a way that is visually pleasing and/or reveals structure. The Fruchterman-Reingold algorithm assigns a repelling force to vertices pair of the graph, effectively pushing appart vertices so they don't overlap, and a attraction force between each adjacent vertices, dragging closer connected vertices. Theses forces dim when the vertices respectively get further apart or closer, and a global temperature also serves as a simulated annealing, capping the maximum vertex displacement at each iteration. As the forces between each component and the temperature gradually diminish, the layout stabilizes.

Another method, the Kamada Kawai algorithm, relies on the simulation of springs between each vertex, which strength is determined by the length of the shortest path between both vertices. The potential energy of each vertex, ie the sum of the energy of all its springs, is then computed. The goal being to reduce the global energy of the layout, each vertex is moved step-by-step until its potential energy is considered low-enough, using a Newton Raphson algorithm.

[]1
[1]: https://www.imagemagick.org/script/quantize.php

## Implementation

Our Fruchter-Reingold implementation starts by positioning all vertices on a circle as this appears to favor "unmangling" as compared to random positions. The radius how the circle is alway 1.0, and all further computations are performed with floating point values, without knowledge of the canvas dimensions. In consequence, contrary to the original Fruchterman-Reingold algorithm, no bound checking is performed, and the layout can spreed constraint-free. The final result is then
scaling to fit into the canvas dimensions. One limitation of this approach is that it is not possible to have fancy circle-shaped or heart-shaped layouts.

A Kamada Kawai algorithm is also provided, mostly for comparison purpose. Its complexity makes it rather unsuitable for larger graps.


## Results

### K6 graph

| Fruchterman-Reingold      | Kamada-Kawai              | Graphviz                  |
| :-----------------------: | :-----------------------: | :-----------------------: |
| [![][g1_fr_thumb]][g1_fr] | [![][g1_kk_thumb]][g1_kk] | [![][g1_gv_thumb]][g1_gv] |
| x.xxs                     | x.xxs                     | x.xxs                     |

[g1_fr]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/k6_fr.png
[g1_fr_thumb]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/thumbs/k6_fr.png
[g1_kk]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/k6_kk.png
[g1_kk_thumb]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/thumbs/k6_kk.png
[g1_gv]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/k6_gv.png
[g1_gv_thumb]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/thumbs/k6_gv.png

*Dot file from [graphs.grevian.org](http://graphs.grevian.org/example)*

### Small dense graph

| Fruchterman-Reingold      | Kamada-Kawai              | Graphviz                  |
| :-----------------------: | :-----------------------: | :-----------------------: |
| [![][g2_fr_thumb]][g2_fr] | [![][g2_kk_thumb]][g2_kk] | [![][g2_gv_thumb]][g2_gv] |
| x.xxs                     | x.xxs                     | x.xxs                     |

[g2_fr]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/small_dense_fr.png
[g2_fr_thumb]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/thumbs/small_dense_fr.png
[g2_kk]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/small_dense_kk.png
[g2_kk_thumb]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/thumbs/small_dense_kk.png
[g2_gv]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/small_dense_gv.png
[g2_gv_thumb]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/thumbs/small_dense_gv.png

*Dot file from [graphs.grevian.org](http://graphs.grevian.org/example)*

### Bin tree

| Fruchterman-Reingold      | Kamada-Kawai              | Graphviz                  |
| :-----------------------: | :-----------------------: | :-----------------------: |
| [![][g3_fr_thumb]][g3_fr] | [![][g3_kk_thumb]][g3_kk] | [![][g3_gv_thumb]][g3_gv] |
| x.xxs                     | x.xxs                     | x.xxs                     |

[g3_fr]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/bin_tree_fr.png
[g3_fr_thumb]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/thumbs/bin_tree_fr.png
[g3_kk]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/bin_tree_kk.png
[g3_kk_thumb]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/thumbs/bin_tree_kk.png
[g3_gv]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/bin_tree_gv.png
[g3_gv_thumb]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/thumbs/bin_tree_gv.png

### Quad tree
| Fruchterman-Reingold      | Kamada-Kawai              | Graphviz                  |
| :-----------------------: | :-----------------------: | :-----------------------: |
| [![][g4_fr_thumb]][g4_fr] | [![][g4_kk_thumb]][g4_kk] | [![][g4_gv_thumb]][g4_gv] |
| x.xxs                     | x.xxs                     | x.xxs                     |

[g4_fr]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/quad_tree_fr.png
[g4_fr_thumb]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/thumbs/quad_tree_fr.png
[g4_kk]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/quad_tree_kk.png
[g4_kk_thumb]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/thumbs/quad_tree_kk.png
[g4_gv]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/quad_tree_gv.png
[g4_gv_thumb]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/thumbs/quad_tree_gv.png

### Large random graph

| Fruchterman-Reingold      | Kamada-Kawai              | Graphviz                  |
| :-----------------------: | :-----------------------: | :-----------------------: |
| [![][g5_fr_thumb]][g5_fr] | [![][g5_kk_thumb]][g5_kk] | [![][g5_gv_thumb]][g5_gv] |
| x.xxs                     | x.xxs                     | x.xxs                     |

[g5_fr]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/large_random_fr.png
[g5_fr_thumb]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/thumbs/large_random_fr.png
[g5_kk]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/large_random_kk.png
[g5_kk_thumb]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/thumbs/large_random_kk.png
[g5_gv]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/large_random_gv.png
[g5_gv_thumb]: https://raw.githubusercontent.com/olvb/nodesoup/master/samples/thumbs/large_random_gv.png

## Caveats

TODO Twiddling with factors