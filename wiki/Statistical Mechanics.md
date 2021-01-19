Statistical mechanics is the field of physics that underpins much of molecular simulation, and is therefore a pretty important topic to know about!

The main theme of statistical mechanics is calculating properties of systems from averages over the systems' components. For example, a collection of atomic configurations could be averaged to determine the average potential energy associated with those atoms in a particular volume V at a particular temperature T.

## Thermodynamic Variables 
Energy is one of the most important concepts in thermodynamics and statistical mechanics: The flow of energy determines how systems evolve over time, and the equal distribution of energy over a system's degrees of freedom is the driving force behind relaxation to equilibrium. Energy can also be stored in a bunch of different ways, through the potential energy defined by interaction potentials and atomic positions, through velocities of atoms (kinetic energy), and through gradients in concentration (chemical potential).

All of these different kinds of energies play roles in the calculation of thermodynamic *free* energies that are minimized at equilibrium. These different kinds of energies can be summarized by pairs of conjugate variables:

* Volume \* Pressure = Energy (**V**P)
* Number of particles \* chemical potential = Energy (**N**u)
* Entropy * Temperature = Energy (**S**T)

The bolded variables above are **extensive** in that they depend on the **size** of the system (If you double the system size, these variables also double). The un-bolded variables are *intensive*, in that they don't depend on system size (doubling the amount of water in a glass doesn't double its temperature). These intensive-extensive pairs all multiply to have units of energy. 

### Chemical Potential 
Chemical potential is the energy associated with the addition of just one more of a chemical species.