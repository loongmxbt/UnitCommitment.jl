# UnitCommitment.jl

**UnitCommitment.jl** (UC.jl) is a Julia optimization package for the Security-Constrained Unit Commitment Problem (SCUC), a fundamental optimization problem in power systems used, for example, to clear the day-ahead electricity markets. The package provides benchmark instances for the problem and Julia/JuMP implementations of state-of-the-art mixed-integer programming formulations.

### Package Components

* **Data Format:** The package proposes an extensible and fully-documented JSON-based data specification format for SCUC, developed in collaboration with Independent System Operators (ISOs), which describes the most important aspects of the problem. The format supports all the most common generator characteristics (including ramping, piecewise-linear production cost curves and time-dependent startup costs), as well as operating reserves, price-sensitive loads, transmission networks and contingencies.
* **Benchmark Instances:** The package provides a diverse collection of large-scale benchmark instances collected from the literature and extended to make them more challenging and realistic.
* **Model Implementation**: The package provides a Julia/JuMP implementation of state-of-the-art formulations and solution methods for SCUC. Our goal is to keep this implementation up-to-date, as new methods are proposed in the literature.
* **Benchmark Tools:** The package provides automated benchmark scripts to accurately evaluate the performance impact of proposed code changes.

### Documentation

* [Usage](usage.md)
* [Data Format](format.md)
* [Instances](instances.md)

### Source code

* [https://github.com/ANL-CEEESA/unitcommitment.jl](https://github.com/ANL-CEEESA/unitcommitment.jl)

### Authors
* **Alinson Santos Xavier** (Argonne National Laboratory)
* **Feng Qiu** (Argonne National Laboratory)

### Acknowledgments

* We would like to thank **Aleksandr M. Kazachkov** (University of Florida), **Yonghong Chen** (Midcontinent Independent System Operator), **Feng Pan** (Pacific Northwest National Laboratory) for valuable feedback on early versions of this package.

* Based upon work supported by **Laboratory Directed Research and Development** (LDRD) funding from Argonne National Laboratory, provided by the Director, Office of Science, of the U.S. Department of Energy under Contract No. DE-AC02-06CH11357.

### Citing

If you use UnitCommitment.jl in your research, we request that you cite the package as follows:

* Alinson S. Xavier, Feng Qiu, "UnitCommitment.jl: A Julia/JuMP Optimization Package for Security-Constrained Unit Commitment". Zenodo (2020). [DOI: 10.5281/zenodo.4269874](https://doi.org/10.5281/zenodo.4269874).

If you make use of the provided instances files, we request that you additionally cite the original sources, as described in the [instances page](instances.md).

### License

Released under the modified BSD license. See `LICENSE.md` for more details.