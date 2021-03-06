# UnitCommitment.jl: Optimization Package for Security-Constrained Unit Commitment
# Copyright (C) 2020, UChicago Argonne, LLC. All rights reserved.
# Released under the modified BSD license. See COPYING.md for more details.

using UnitCommitment
using JuMP
using Gurobi
using JSON
using Logging
using Printf
using LinearAlgebra

function main()
    basename, suffix = split(ARGS[1], ".")
    solution_filename = "results/$basename.$suffix.sol.json"
    model_filename = "results/$basename.$suffix.mps.gz"

    time_limit = 60 * 20

    BLAS.set_num_threads(4)
    global_logger(TimeLogger(initial_time = time()))

    total_time = @elapsed begin
        @info "Reading: $basename"
        time_read = @elapsed begin
            instance = UnitCommitment.read_benchmark(basename)
        end
        @info @sprintf("Read problem in %.2f seconds", time_read)

        time_model = @elapsed begin
            model = build_model(instance=instance,
                                optimizer=optimizer_with_attributes(Gurobi.Optimizer,
                                                                    "Threads" => 4,
                                                                    "Seed" => rand(1:1000),
                                                                    ))
        end

        @info "Optimizing..."
        BLAS.set_num_threads(1)
        UnitCommitment.optimize!(model, time_limit=time_limit, gap_limit=1e-3)

    end
    @info @sprintf("Total time was %.2f seconds", total_time)

    @info "Writing: $solution_filename"
    solution = UnitCommitment.get_solution(model)
    open(solution_filename, "w") do file
        JSON.print(file, solution, 2)
    end

    @info "Verifying solution..."
    UnitCommitment.validate(instance, solution) 

    @info "Setting variable names..."
    UnitCommitment.set_variable_names!(model)

    @info "Exporting model..."
    JuMP.write_to_file(model.mip, model_filename)
end

main()
