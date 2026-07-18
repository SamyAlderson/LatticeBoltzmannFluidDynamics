# LatticeBoltzmannFluidDynamics

> Simulating fluid dynamics with unprecedented precision.

## Overview
LatticeBoltzmannFluidDynamics is a Julia implementation of the Lattice Boltzmann method for simulating fluid dynamics, enabling researchers to model and analyze complex fluid behavior in 2D and 3D environments. By leveraging the power of high-performance computing and the versatility of the Lattice Boltzmann method, this project provides a reliable and efficient tool for scientists and engineers to study fluid dynamics in various fields, including physics, chemistry, and engineering. The project's focus on visualization capabilities further enhances its value by allowing users to easily interpret and communicate their results.

## Features
- **2D and 3D Simulations**: LatticeBoltzmannFluidDynamics supports simulations in both 2D and 3D environments, catering to a wide range of research applications.
- **High-Performance Computing**: The project utilizes Julia's high-performance capabilities to ensure efficient and scalable simulations.
- **Lattice Boltzmann Method**: The Lattice Boltzmann method is a powerful tool for simulating fluid dynamics, and this project provides an accurate and reliable implementation.
- **Visualization Capabilities**: The project includes a visualization module using Plotly, allowing users to easily interpret and communicate their results.
- **Parameter File**: The project includes a parameter file for defining simulation settings and constants, making it easy to customize and configure simulations.
- **Utility Functions**: The project includes utility functions for managing simulations and output, simplifying the process of running and analyzing simulations.
- **Modular Design**: The project's modular design ensures that each component is well-organized and easy to maintain.

## Getting Started

### Prerequisites
- Julia 1.7 or higher
- Plotly 4.14 or higher

### Installation
```bash
# Clone the repository
git clone https://github.com/your-username/LatticeBoltzmannFluidDynamics.git

# Navigate to the project directory
cd LatticeBoltzmannFluidDynamics

# Install required packages
using Pkg
Pkg.add("Plotly")

# Set the parameter file
using Parameters
@load src/parameters.jl
```

### Usage
```bash
# Run a 2D simulation
using Main
simulate_2d(N=100, dt=0.01, t_max=10)

# Visualize the simulation results
visualize_simulation(2)
```

## Architecture
LatticeBoltzmannFluidDynamics follows a modular design, with each component responsible for a specific task:
- `src/main.jl`: The main entry point, responsible for initializing simulations and visualizing results.
- `src/models/Fluid.jl`: The model for simulating fluid dynamics using the Lattice Boltzmann method.
- `src/visualizers/PLOT.jl`: The module for visualizing simulation results using Plotly.
- `src/utilities/Simulation.jl`: The utility functions for managing simulations and output.
- `src/parameters.jl`: The parameter file for defining simulation settings and constants.

## API Reference
- `simulate_2d(N, dt, t_max)`: Runs a 2D simulation with the specified parameters.
- `simulate_3d(N, dt, t_max)`: Runs a 3D simulation with the specified parameters.
- `visualize_simulation(dim)`: Visualizes the simulation results in the specified dimension.

## Testing
```bash
# Run the tests
using Test
include("test/test.jl")
```

## Contributing
1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Push and open a PR

## License
MIT License