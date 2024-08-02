# Analysis-of-DNS Data---Square-Cylinder

This problem analyzes the flow around a square cylinder at a Reynolds number of 22,000. The
dimensionless Reynolds number (Re) depends on the incoming flow velocity (U) and the
cylinder width (D). The computational domain is 30.5D long (streamwise), 54D wide (crossstream), and πD deep (spanwise). The cylinder’s front face is located 10D downstream from
the inlet and is centered between the side boundaries. The coordinate origin is placed at the
cylinder’s center.
The inlet has a constant velocity profile of u = (U, 0, 0), while the outlet uses convective
boundary conditions. No-slip walls bound the cylinder surface. The side boundaries are
periodic to allow for spanwise homogeneous turbulence, with a Neumann condition enabling
cross-stream velocity gradients.
Results are made dimensionless, with D,  U,  D/U, and $ρ𝑈^2/2$ as reference length, velocity,
time, and pressure, respectively. A schematic of the problem is shown below

![image](https://github.com/user-attachments/assets/f13df9fb-1819-48f2-a897-e9302de58665)

DNS Data from: F. X. Trias, A. Gorobets, and A. Oliva, “Turbulent flow around a square cylinder at Reynolds number 22,000: A DNS study,” Computers & Fluids, vol. 123, pp. 87–98, Dec. 2015, doi: 10.1016/j.compfluid.2015.09.013.
