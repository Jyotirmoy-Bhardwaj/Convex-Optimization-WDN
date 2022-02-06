# wdnOptimization
<p align=justify>
This work demonstrates how one can obtain a feasible solution to water distribution network Optimization problems. In general, computing optimal solutions of such formulations are NP-Hard given non-convex constraints. We can obtain an approximate solution by relaxing some of the non-convex constraints.  While applying the principles of optimization in a WDN, the Hazen–Williams equations are used to relate the flow of water in a pipe with the physical properties of the pipe such as pressure drop, flow measurements, etc. However, due to the non-linear/non-convex nature of the Hazen-Williams equation, pure linear programming cannot be directly applied to these equations, and heuristic techniques must need to be used. In this work, we solve a nonconvex optimization problem; where we compute the optimal dimensions of the pipes of the network. This is a particularly important problem, and it is necessary to compute an optimal solution while designing the physical infrastructure of the water network.  
 
 
# Requirements:
- [`cvxOpt`](http://cvxr.com/cvx/)
- [`matLab`](https://se.mathworks.com/products/matlab.html)

## License
The project is licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html).
