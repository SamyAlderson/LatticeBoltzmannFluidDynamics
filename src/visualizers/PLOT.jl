# src/visualizers/PLOT.jl

"""
Module for visualizing simulation results using Plotly.
"""
module PLOT

using Plotly
using JuPyte
using Parameters
import ..Simulation

"""
Function to plot the simulation results.

Arguments:
- sim::Simulation: The simulation object to plot.
- plot_type::String: The type of plot to generate (e.g., "2d", "3d", "contour").

Returns:
- A Plotly plot object.
"""
function plot(sim::Simulation, plot_type::String)
    if plot_type == "2d"
        density = sim.density[:, :]
        velocity = sim.velocity[:, :]
        plot = plotly("2D Density and Velocity Plot", [ density, velocity ])
        plot.layout.title = "2D Simulation Results"
    elseif plot_type == "3d"
        density = sim.density[:, :, :]
        velocity = sim.velocity[:, :, :]
        plot = plotly("3D Density and Velocity Plot", [ density, velocity ])
        plot.layout.title = "3D Simulation Results"
    elseif plot_type == "contour"
        density = sim.density
        plot = contour("Contour Plot of Density", density)
        plot.layout.title = "Contour Plot of Density"
    else
        error("Invalid plot type. Please choose from '2d', '3d', or 'contour'.")
    end
    return plot
end

"""
Function to display the simulation results as a plot.

Arguments:
- plot::Plotly plot object: The plot to display.
"""
function display_plot(plot::Plotly.plot)
    display(plot)
end

end  # module PLOT