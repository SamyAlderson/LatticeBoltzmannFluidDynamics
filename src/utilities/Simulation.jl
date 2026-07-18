module Utilities

using ..Parameters

"""
    init_simulation(grid_size, grid_type, num_iterations, output_interval)
Initialize a new simulation with the specified settings.

# Arguments
- `grid_size`: Size of the simulation grid (2D or 3D)
- `grid_type`: Type of the simulation grid (e.g., "lattice", "hexagonal")
- `num_iterations`: Number of iterations to run the simulation
- `output_interval`: Interval at which to output simulation data

# Returns
A `Simulation` object representing the initialized simulation
"""
function init_simulation(grid_size, grid_type, num_iterations, output_interval)
    # Validate input parameters
    if !(grid_size in [2, 3])
        error("Invalid grid size. Must be 2 or 3.")
    end
    if !(grid_type in ["lattice", "hexagonal"])
        error("Invalid grid type. Must be 'lattice' or 'hexagonal'.")
    end

    # Initialize simulation grid
    if grid_size == 2
        grid = zeros(Float64, (size(Parameters.lattice2D), size(Parameters.lattice2D)[1]))
    elseif grid_size == 3
        grid = zeros(Float64, (size(Parameters.lattice3D), size(Parameters.lattice3D)[1]))
    end

    # Initialize simulation settings
    simulation_settings = Parameters.SimulationSettings(
        grid=grid,
        grid_type=grid_type,
        num_iterations=num_iterations,
        output_interval=output_interval
    )

    # Create and return a new simulation object
    return Simulation(simulation_settings)
end

"""
    save_simulation_data(simulation, filename)
Save simulation data to a file.

# Arguments
- `simulation`: Simulation object to save data from
- `filename`: Name of the file to save the data to
"""
function save_simulation_data(simulation, filename)
    # Validate input parameters
    if !(filename in ["csv", "json"])
        error("Invalid file type. Must be 'csv' or 'json'.")
    end

    # Save simulation data to file
    if filename == "csv"
        savecsv(simulation.data, "simulation_data.csv")
    elseif filename == "json"
        savejson(simulation.data, "simulation_data.json")
    end
end

"""
    visualize_simulation(simulation)
Visualize simulation results using Plotly.

# Arguments
- `simulation`: Simulation object to visualize
"""
function visualize_simulation(simulation)
    # Validate input parameters
    if !(simulation.grid_size in [2, 3])
        error("Invalid grid size. Must be 2 or 3.")
    end

    # Create a Plotly plot
    if simulation.grid_size == 2
        plot(linspace(0, 1, size(simulation.grid)[1]), simulation.grid)
    elseif simulation.grid_size == 3
        plot3d(linspace(0, 1, size(simulation.grid)[1]), linspace(0, 1, size(simulation.grid)[2]), simulation.grid)
    end
end

# Define the Simulation type
mutable struct Simulation
    settings::SimulationSettings
    data::Array{Float64}
end

# Define the SimulationSettings type
struct SimulationSettings
    grid::Array{Float64}
    grid_type::String
    num_iterations::Int64
    output_interval::Int64
end

end  # module Utilities