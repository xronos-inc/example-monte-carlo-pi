#!/bin/python3

# SPDX-FileCopyrightText: © 2024 Xronos Inc.
# SPDX-License-Identifier: BSD-3-Clause

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.animation import FuncAnimation

# Set the number of random points
n_points = 1000
points_inside_circle = 0
points_total = 0

# Create a figure and a plot
fig, ax = plt.subplots()
# Set equal scaling
ax.set_aspect('equal')
# Set limits to show the square edges and the circle
ax.set_xlim(-1, 1)
ax.set_ylim(-1, 1)

# Draw a unit circle
circle = plt.Circle((0, 0), 1, edgecolor='r', facecolor='none')
ax.add_artist(circle)

# Prepare scatter plot
scatter, = plt.plot([], [], 'b.', markersize=3)
pi_estimate_text = ax.text(-0.95, 0.95, '', fontsize=18)

# Initialization function for the animation
def init():
    scatter.set_data([], [])
    pi_estimate_text.set_text('')
    return scatter, pi_estimate_text

# Animation update function
def update(frame):
    global points_inside_circle, points_total

    # Generate a random point
    x, y = np.random.uniform(-1, 1, 2)
    points_total += 1

    # Check if the point is inside the unit circle
    if x**2 + y**2 <= 1:
        points_inside_circle += 1

    # Update the scatter plot
    scatter.set_data(np.append(scatter.get_xdata(), x), np.append(scatter.get_ydata(), y))
    
    # Update the PI estimate
    if points_total > 0:
        pi_estimate = (points_inside_circle / points_total) * 4
        pi_estimate_text.set_text('π ≈ {:.4f}'.format(pi_estimate))

    return scatter, pi_estimate_text

# Create the animation
ani = FuncAnimation(fig, update, frames=n_points, init_func=init, blit=True, repeat=False)

# Save the animation as a GIF
ani.save('monte_carlo_pi.gif', writer='imagemagick', fps=60)
