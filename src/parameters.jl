# src/parameters.jl

"""
    parameters.jl - Parameter file for defining simulation settings and constants

This file contains the parameter settings and constants used throughout the
Lattice Boltzmann Fluid Dynamics simulation.
"""

module Parameters

"""
    SimulationParameters
Type representing simulation parameters.

Fields:
- `num_x`: Number of grid points in the x-direction.
- `num_y`: Number of grid points in the y-direction.
- `num_z`: Number of grid points in the z-direction (for 3D simulations).
- `num_steps`: Total number of simulation steps.
- `time_step`: Time step for each simulation iteration.
- `fluid_type`: Type of fluid being simulated (e.g., water, air).
- `boundary_conditions`: Boundary conditions for the simulation domain.
"""
mutable struct SimulationParameters
    num_x::Int
    num_y::Int
    num_z::Int
    num_steps::Int
    time_step::Float64
    fluid_type::String
    boundary_conditions::String
end

"""
    Constants
Type representing simulation constants.

Fields:
- `reynolds_number`: Reynolds number for the fluid flow.
- `viscosity`: Viscosity of the fluid.
- `density`: Density of the fluid.
- `sound_speed`: Sound speed in the fluid.
"""
mutable struct Constants
    reynolds_number::Float64
    viscosity::Float64
    density::Float64
    sound_speed::Float64
end

"""
    get_simulation_parameters
Get the simulation parameters.

# Arguments
- `num_x`: Number of grid points in the x-direction.
- `num_y`: Number of grid points in the y-direction.
- `num_z`: Number of grid points in the z-direction (for 3D simulations).
- `num_steps`: Total number of simulation steps.
- `time_step`: Time step for each simulation iteration.
- `fluid_type`: Type of fluid being simulated (e.g., water, air).
- `boundary_conditions`: Boundary conditions for the simulation domain.

# Returns
A `SimulationParameters` object representing the simulation parameters.
"""
function get_simulation_parameters(
    num_x::Int,
    num_y::Int,
    num_z::Int,
    num_steps::Int,
    time_step::Float64,
    fluid_type::String,
    boundary_conditions::String
)
    return SimulationParameters(num_x, num_y, num_z, num_steps, time_step, fluid_type, boundary_conditions)
end

"""
    get_constants
Get the simulation constants.

# Arguments
- `reynolds_number`: Reynolds number for the fluid flow.
- `viscosity`: Viscosity of the fluid.
- `density`: Density of the fluid.
- `sound_speed`: Sound speed in the fluid.

# Returns
A `Constants` object representing the simulation constants.
"""
function get_constants(
    reynolds_number::Float64,
    viscosity::Float64,
    density::Float64,
    sound_speed::Float64
)
    return Constants(reynolds_number, viscosity, density, sound_speed)
end

"""
    validate_simulation_parameters
Validate the simulation parameters.

# Arguments
- `params`: `SimulationParameters` object to validate.

# Returns
`true` if the simulation parameters are valid, `false` otherwise.
"""
function validate_simulation_parameters(params::SimulationParameters)
    if params.num_x <= 0 || params.num_y <= 0 || (params.num_z > 0 && params.num_z <= 0)
        return false
    end
    if params.num_steps <= 0 || params.time_step <= 0
        return false
    end
    return true
end

"""
    validate_constants
Validate the simulation constants.

# Arguments
- `consts`: `Constants` object to validate.

# Returns
`true` if the simulation constants are valid, `false` otherwise.
"""
function validate_constants(consts::Constants)
    if consts.reynolds_number <= 0 || consts.viscosity <= 0 || consts.density <= 0 || consts.sound_speed <= 0
        return false
    end
    return true
end

end  # module Parameters