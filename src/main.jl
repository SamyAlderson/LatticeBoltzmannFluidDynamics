# src/main.jl

"""
Main entry point for LatticeBoltzmannFluidDynamics.
Responsible for initializing simulations and visualizing results.
"""

module Main

using .Fluid
using .Simulation
using .PLOT
using Parameters

"""
Initialize simulation based on user input.
"""
function initialize_simulation(; dimensions::Int, grid_size::Int, fluid_parameters::NamedTuple)
    # Validate user input
    if !(1 <= dimensions <= 3)
        error("Invalid dimensions. Must be between 1 and 3.")
    end

    # Initialize fluid simulation
    fluid = Fluid(dimensions, grid_size, fluid_parameters)

    # Initialize simulation output
    simulation_data = Simulation.initialize_output(fluid)

    # Return simulation data
    simulation_data
end

"""
Run simulation and visualize results.
"""
function run_simulation(simulation_data::NamedTuple)
    # Run simulation
    fluid, output = Simulation.run_simulation(simulation_data)

    # Visualize simulation results
    PLOT.visualize_output(output)

    # Return nothing
    nothing
end

# Main entry point
function main()
    # Parse command-line arguments
    param = parse_command_line_args()

    # Initialize simulation
    simulation_data = initialize_simulation(
        dimensions=param["dimensions"],
        grid_size=param["grid_size"],
        fluid_parameters=param["fluid_parameters"],
    )

    # Run simulation and visualize results
    run_simulation(simulation_data)
end

# Parse command-line arguments
function parse_command_line_args()
    # Define allowed parameters
    @declare parameters = (
        dimensions=Int,
        grid_size=Int,
        fluid_parameters=NamedTuple,
    )

    # Parse command-line arguments
    param = parse(Parameters, ARGS; instantiate=true)

    # Validate user input
    if !haskey(param, "dimensions")
        error("Missing dimensions parameter.")
    elseif !haskey(param, "grid_size")
        error("Missing grid_size parameter.")
    elseif !haskey(param, "fluid_parameters")
        error("Missing fluid_parameters parameter.")
    end

    # Return parsed parameters
    param
end

# Run main entry point
main()

end  # module Main